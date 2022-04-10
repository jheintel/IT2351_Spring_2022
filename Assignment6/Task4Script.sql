-- Declare what database to use
USE ap;
-- change the delimiter so that ; may be used within the procedure
DELIMITER //
-- delete insert_glaccount if the procedure already exists
DROP PROCEDURE IF EXISTS insert_glaccount;

-- create insert_glaccount procedure to check error handling
CREATE PROCEDURE insert_glaccount(
	-- define procedure parameters and output
    IN account_number_param    INT,
    IN account_description_param VARCHAR(225)
)
BEGIN
	-- make a variable for error checking then activate error handling for all exceptions
	DECLARE sql_error TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
    
    -- set a rollback starting point
	START TRANSACTION;
    
    -- update the account_number and account_description in general_ledger_accounts with our parameters
    INSERT INTO general_ledger_accounts(account_number, account_description)
    VALUES (account_number_param, account_description_param);
    
    IF sql_error = FALSE THEN
        SELECT 'Row added' AS message;
        COMMIT;
	ELSE
        SELECT 'Row not added - Row Already Exists' AS message;
        ROLLBACK;
	END IF;
END//

-- Change delimiter back
DELIMITER ;	
-- call the created procedure
CALL insert_glaccount(111, 'Junk Drawer');