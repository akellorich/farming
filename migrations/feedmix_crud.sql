-- Feed Mix Master Table
CREATE TABLE IF NOT EXISTS feedmix (
    id INT AUTO_INCREMENT PRIMARY KEY,
    feedcode VARCHAR(50) NOT NULL UNIQUE,
    feedname VARCHAR(100) NOT NULL,
    mixdate DATE NOT NULL,
    totalweight DECIMAL(10,2) DEFAULT 0.00,
    createdby INT NOT NULL,
    datecreated DATETIME DEFAULT CURRENT_TIMESTAMP,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT DEFAULT NULL,
    datedeleted DATETIME DEFAULT NULL,
    platform VARCHAR(50) DEFAULT 'Web',
    FOREIGN KEY (createdby) REFERENCES user(userid)
);

-- Feed Mix Details Table
CREATE TABLE IF NOT EXISTS feedmixdetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    feedmixid INT NOT NULL,
    inventoryitemid INT NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (feedmixid) REFERENCES feedmix(id) ON DELETE CASCADE,
    FOREIGN KEY (inventoryitemid) REFERENCES inventoryitems(id)
);

-- Stored Procedures
DELIMITER //

DROP PROCEDURE IF EXISTS sp_savefeedmix //
CREATE PROCEDURE sp_savefeedmix(
    IN $id INT,
    IN $feedcode VARCHAR(50),
    IN $feedname VARCHAR(100),
    IN $mixdate DATE,
    IN $totalweight DECIMAL(10,2),
    IN $userid INT,
    IN $platform VARCHAR(50),
    IN $generatecode TINYINT(1)
)
BEGIN
    DECLARE $newcode VARCHAR(50);
    DECLARE $currentno INT;
    DECLARE $yearprefix VARCHAR(50);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
    
    SET $newcode = $feedcode;
    
    IF $generatecode = 1 AND $id = 0 THEN
        SET $yearprefix = CONCAT('FEED-', YEAR(CURRENT_DATE));
        
        -- Get or initialize serial
        IF NOT EXISTS (SELECT 1 FROM serials WHERE document = 'feedmix') THEN
            INSERT INTO serials (document, prefix, currentno, addedby)
            VALUES ('feedmix', $yearprefix, 1, $userid);
            SET $currentno = 1;
        ELSE
            SELECT currentno + 1 INTO $currentno FROM serials WHERE document = 'feedmix';
            UPDATE serials SET currentno = $currentno, prefix = $yearprefix WHERE document = 'feedmix';
        END IF;
        
        SET $newcode = CONCAT($yearprefix, LPAD($currentno, 4, '0'));
    END IF;

    IF $id = 0 THEN
        INSERT INTO feedmix (feedcode, feedname, mixdate, totalweight, createdby, datecreated, platform)
        VALUES ($newcode, $feedname, $mixdate, $totalweight, $userid, CURRENT_TIMESTAMP, $platform);
        SET $id = LAST_INSERT_ID();
        
        -- Audit Trail
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
        VALUES (CURRENT_TIMESTAMP, $userid, 'CREATE', CONCAT('Created new feed mix formulation: ', $feedname, ' (', $newcode, ')'), $platform);
    ELSE
        UPDATE feedmix 
        SET feedcode = $newcode,
            feedname = $feedname,
            mixdate = $mixdate,
            totalweight = $totalweight
        WHERE id = $id AND deleted = 0;
        
        -- Delete old details before inserting new ones
        DELETE FROM feedmixdetails WHERE feedmixid = $id;
        
        -- Audit Trail
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
        VALUES (CURRENT_TIMESTAMP, $userid, 'UPDATE', CONCAT('Updated feed mix formulation: ', $feedname, ' (ID: ', $id, ')'), $platform);
    END IF;

    COMMIT;
    
    -- Return result after commit
    SELECT $id AS feedmixid, $newcode AS generated_code;
END //

DROP PROCEDURE IF EXISTS sp_savefeedmixdetail //
CREATE PROCEDURE sp_savefeedmixdetail(
    IN $feedmixid INT,
    IN $inventoryitemid INT,
    IN $quantity DECIMAL(10,2)
)
BEGIN
    INSERT INTO feedmixdetails (feedmixid, inventoryitemid, quantity)
    VALUES ($feedmixid, $inventoryitemid, $quantity);
END //

DROP PROCEDURE IF EXISTS sp_getfeedmixes //
CREATE PROCEDURE sp_getfeedmixes(IN $id INT)
BEGIN
    IF $id = 0 THEN
        SELECT f.*, u.firstname as creator_name,
        (SELECT COUNT(*) FROM feedmixdetails fd WHERE fd.feedmixid = f.id) as component_count
        FROM feedmix f
        LEFT JOIN user u ON f.createdby = u.userid
        WHERE f.deleted = 0
        ORDER BY f.datecreated DESC;
    ELSE
        SELECT f.*, u.firstname as creator_name
        FROM feedmix f
        LEFT JOIN user u ON f.createdby = u.userid
        WHERE f.id = $id AND f.deleted = 0;
    END IF;
END //

DROP PROCEDURE IF EXISTS sp_getfeedmixdetails //
CREATE PROCEDURE sp_getfeedmixdetails(IN $feedmixid INT)
BEGIN
    SELECT fd.*, i.itemname, i.itemcode, i.uom
    FROM feedmixdetails fd
    JOIN inventoryitems i ON fd.inventoryitemid = i.id
    WHERE fd.feedmixid = $feedmixid;
END //

DROP PROCEDURE IF EXISTS sp_deletefeedmix //
CREATE PROCEDURE sp_deletefeedmix(
    IN $id INT,
    IN $userid INT,
    IN $platform VARCHAR(50)
)
BEGIN
    DECLARE $feedname VARCHAR(100);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT feedname INTO $feedname FROM feedmix WHERE id = $id;

    UPDATE feedmix
    SET deleted = 1,
        deletedby = $userid,
        datedeleted = CURRENT_TIMESTAMP
    WHERE id = $id;
    
    -- Audit Trail
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (CURRENT_TIMESTAMP, $userid, 'DELETE', CONCAT('Deleted feed mix formulation: ', IFNULL($feedname, 'Unknown'), ' (ID: ', $id, ')'), $platform);

    COMMIT;

    SELECT 1 AS success;
END //

DELIMITER ;
