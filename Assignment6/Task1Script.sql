-- Declare what database to use
USE ap;
-- delete test if the procedure already exists
DROP PROCEDURE IF EXISTS test;
-- change the delimiter so that ; may be used within the procedure
DELIMITER //

-- Create the procedure test passing it no variables
CREATE PROCEDURE test()
BEGIN
	-- declare variable to store count
    DECLARE invoice_count INT DEFAULT 0;
    -- count invoices above $6000
    SELECT COUNT(*) INTO invoice_count FROM invoices WHERE invoice_total > 6000;
    -- display a message about how many invoices exceed threshold
	SELECT CONCAT(invoice_count, ' invoices exceed $6,000') AS message;
END //

-- Change delimiter back
DELIMITER ;	
-- call the created procedure
CALL test();