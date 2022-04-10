-- Declare what database to use
USE ap;
-- change the delimiter so that ; may be used within the procedure
DELIMITER //
-- delete test if the procedure already exists
DROP PROCEDURE IF EXISTS test;

-- create test procedure to check error handling
CREATE PROCEDURE test()
BEGIN
	-- make a variable to use for error testing
    DECLARE duplicate_entry_for_key TINYINT DEFAULT FALSE;
    
     -- create an error handler that looks for the 1062 error then sets error variable to true
    DECLARE CONTINUE HANDLER FOR 1062
		SET duplicate_entry_for_key = TRUE;
    
    -- attempt bunk insert
	INSERT INTO general_ledger_accounts VALUES (130, 'Cash');
    
    -- if error display 1st message else display second
    IF duplicate_entry_for_key = TRUE THEN
		SELECT 'Row was not inserted - duplicate key encountered.' AS message;
    ELSE
		SELECT '1 row was inserted.' AS message;
	END IF;
END//

-- Change delimiter back
DELIMITER ;	
-- call the created procedure
CALL test();