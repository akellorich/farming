-- Jukam Poultry Management System - Maturity Tracking Enhancement
-- File: migrations/update_maturity_logic.sql

-- 1. Ensure maturityperiod exists in poultrybirdtypes
-- Note: Using a procedural block to safely add column if missing
DROP PROCEDURE IF EXISTS sp_temp_add_maturity_columns;
DELIMITER //
CREATE PROCEDURE sp_temp_add_maturity_columns()
BEGIN
    -- Add maturityperiod to bird types if missing
    IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = 'poultrybirdtypes' AND column_name = 'maturityperiod') THEN
        ALTER TABLE poultrybirdtypes ADD COLUMN maturityperiod INT DEFAULT 130 AFTER description;
    END IF;

    -- Add maturitydate to flocks if missing
    IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = 'poultryflocks' AND column_name = 'maturitydate') THEN
        ALTER TABLE poultryflocks ADD COLUMN maturitydate DATE AFTER arrivaldate;
    END IF;
END //
DELIMITER ;
CALL sp_temp_add_maturity_columns();
DROP PROCEDURE sp_temp_add_maturity_columns;

-- 2. Update existing data for maturitydate
UPDATE poultryflocks f
JOIN poultrybirdtypes bt ON f.birdtypeid = bt.typeid
SET f.maturitydate = DATE_ADD(f.arrivaldate, INTERVAL bt.maturityperiod DAY)
WHERE f.maturitydate IS NULL;

-- 3. Update sp_savepoultryflock to automatically calculate maturitydate
DROP PROCEDURE IF EXISTS sp_savepoultryflock;
DELIMITER //
CREATE PROCEDURE sp_savepoultryflock(
    IN `$id` INT,
    IN `$flockno` VARCHAR(50),
    IN `$flockname` VARCHAR(100),
    IN `$birdtypeid` INT,
    IN `$stageid` INT,
    IN `$breedid` INT,
    IN `$source` VARCHAR(50),
    IN `$arrivaldate` DATE,
    IN `$initialcount` INT,
    IN `$houseid` INT,
    IN `$notes` TEXT,
    IN `$generate_vax` TINYINT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(50)
)
BEGIN
    DECLARE `$actual_flockid` INT;
    DECLARE `$generated_flockno` VARCHAR(50) DEFAULT '';
    DECLARE `$maturityperiod` INT DEFAULT 130;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Fetch maturity period for the bird type
    SELECT COALESCE(maturityperiod, 130) INTO `$maturityperiod` 
    FROM poultrybirdtypes 
    WHERE typeid = `$birdtypeid`;

    START TRANSACTION;

    IF `$id` = 0 THEN
        -- Check for duplicate Flock ID if manual entry
        IF `$flockno` != '[AUTO]' AND `$flockno` != '' THEN
            IF EXISTS (SELECT 1 FROM `poultryflocks` WHERE `flockno` = `$flockno` AND `deleted` = 0) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate Flock ID: The provided Flock ID is already in use.';
            END IF;
        END IF;

        -- Handle Auto-ID
        IF `$flockno` = '[AUTO]' OR `$flockno` = '' THEN
            SET `$generated_flockno` = fn_generateflockid();
            -- Update serials
            UPDATE `serials` SET `currentno` = `currentno` + 1 WHERE `document` = 'Poultry Flock';
        ELSE
            SET `$generated_flockno` = `$flockno`;
        END IF;

        INSERT INTO `poultryflocks` (
            `flockno`, `flockname`, `birdtypeid`, `stageid`, `breedid`, 
            `source`, `arrivaldate`, `maturitydate`, `initialcount`, `currentcount`, `houseid`, `notes`, `addedby`
        ) VALUES (
            `$generated_flockno`, `$flockname`, `$birdtypeid`, `$stageid`, `$breedid`, 
            `$source`, `$arrivaldate`, DATE_ADD(`$arrivaldate`, INTERVAL `$maturityperiod` DAY), `$initialcount`, `$initialcount`, `$houseid`, `$notes`, `$userid`
        );
        
        SET `$actual_flockid` = LAST_INSERT_ID();

        -- Create Vaccination Schedule based on bird type protocols (ONLY IF REQUESTED)
        IF `$generate_vax` = 1 THEN
            INSERT INTO `poultry_flock_vaccination_schedule` (`flockid`, `diseaseid`, `scheduledate`, `narration`, `addedby`)
            SELECT 
                `$actual_flockid`, 
                `diseaseid`, 
                DATE_ADD(`$arrivaldate`, INTERVAL `minage` DAY), 
                `narration`, 
                `$userid`
            FROM `poultry_birdtype_vaccinations`
            WHERE `birdtypeid` = `$birdtypeid` AND `deleted` = 0;
        END IF;

        -- Audit Trail
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Registered Poultry Flock: ', `$generated_flockno`), `$platform`, 
                JSON_OBJECT('flockid', `$actual_flockid`, 'flockno', `$generated_flockno`, 'name', `$flockname`));
    ELSE
        -- Update existing flock
        UPDATE `poultryflocks` SET 
            `flockname` = `$flockname`,
            `stageid` = `$stageid`,
            `houseid` = `$houseid`,
            `notes` = `$notes`,
            `maturitydate` = DATE_ADD(`arrivaldate`, INTERVAL `$maturityperiod` DAY) -- Recalculate in case bird type changed
        WHERE `flockid` = `$id`;
        
        SET `$actual_flockid` = `$id`;
        
        -- Audit Trail
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Poultry Flock ID: ', `$id`), `$platform`, 
                JSON_OBJECT('flockid', `$id`, 'name', `$flockname`));
    END IF;

    COMMIT;
    
    SELECT `$actual_flockid` AS flockid, `$generated_flockno` AS flockno;
END //
DELIMITER ;
