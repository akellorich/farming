-- Mixed Feeds (Actual Mixing Events)
CREATE TABLE IF NOT EXISTS mixedfeeds (
    id INT AUTO_INCREMENT PRIMARY KEY,
    feedmixid INT NOT NULL, -- Reference to the Formulation (Template)
    mixdate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    totalweight DECIMAL(10,2) NOT NULL,
    createdby INT NOT NULL,
    platform VARCHAR(50) DEFAULT 'Web',
    FOREIGN KEY (feedmixid) REFERENCES feedmix(id),
    FOREIGN KEY (createdby) REFERENCES user(userid)
);

-- Mixed Feed Details (Actual Weights Used in this specific batch)
CREATE TABLE IF NOT EXISTS mixedfeeddetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mixedfeedid INT NOT NULL,
    inventoryitemid INT NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (mixedfeedid) REFERENCES mixedfeeds(id) ON DELETE CASCADE,
    FOREIGN KEY (inventoryitemid) REFERENCES inventoryitems(id)
);

DELIMITER //

-- Record a Mixing Event in a single transaction
-- This automatically calculates ingredient weights based on the formulation ratio
DROP PROCEDURE IF EXISTS sp_recordmixing //
CREATE PROCEDURE sp_recordmixing(
    IN $feedmixid INT,
    IN $batchweight DECIMAL(10,2),
    IN $userid INT,
    IN $platform VARCHAR(50)
)
BEGIN
    DECLARE $mixedfeedid INT;
    DECLARE $template_total_weight DECIMAL(10,2);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Get the total weight defined in the original formulation template
    SELECT totalweight INTO $template_total_weight FROM feedmix WHERE id = $feedmixid;

    IF $template_total_weight IS NULL OR $template_total_weight = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid formulation template or zero weight defined.';
    END IF;

    START TRANSACTION;
    
    -- 1. Insert into master event table
    INSERT INTO mixedfeeds (feedmixid, mixdate, totalweight, createdby, platform)
    VALUES ($feedmixid, CURRENT_TIMESTAMP, $batchweight, $userid, $platform);
    
    SET $mixedfeedid = LAST_INSERT_ID();
    
    -- 2. Insert into details table by calculating weights based on formulation ratios
    -- Formula: (Ingredient Template Qty / Template Total Weight) * Batch Target Weight
    INSERT INTO mixedfeeddetails (mixedfeedid, inventoryitemid, quantity)
    SELECT 
        $mixedfeedid, 
        inventoryitemid, 
        (quantity / $template_total_weight) * $batchweight
    FROM feedmixdetails 
    WHERE feedmixid = $feedmixid;
    
    -- 3. Record in Audit Trail
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (CURRENT_TIMESTAMP, $userid, 'MIX_FEED', CONCAT('Performed batch mixing. Formulation ID: ', $feedmixid, ', Batch Weight: ', $batchweight, ' KG'), $platform);
    
    COMMIT;
    
    -- Return the new mixing record ID and success status
    SELECT $mixedfeedid AS mixedfeedid, 'success' AS status;
END //

DELIMITER ;
