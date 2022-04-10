-- Declare what database to use
USE ap;
-- change the delimiter so that ; may be used within the procedure
DELIMITER //
-- delete update_invoices_credit_total if the procedure already exists
DROP PROCEDURE IF EXISTS update_invoices_credit_total;

-- create update_invoices_credit_total procedure to check error handling
CREATE PROCEDURE update_invoices_credit_total(
	-- define procedure parameters and output
    IN invoice_id_param    INT,
    IN credit_total_param DECIMAL(9,2),
    OUT update_count       INT
)
BEGIN
	-- make a variable for error checking then activate error handling for all exceptions
	DECLARE sql_error TINYINT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
    
    -- set a rollback starting point
	START TRANSACTION;
    
    -- update the credit_total in invoices with our parameters
    UPDATE invoices
    SET credit_total = credit_total_param
    WHERE invoice_id = invoice_id_param;
    
    -- IF no error set update count to 1
    IF sql_error = FALSE THEN
		SET update_count = 1;
        COMMIT;
	ELSE
		-- if an error was thrown rollback to before 'START TRANSACTION'
		SET update_count = 0;
        ROLLBACK;
	END IF;
END//

-- Change delimiter back
DELIMITER ;	
-- call the created procedure
CALL update_invoices_credit_total(1, 123.89, @row_count);
SELECT CONCAT('row_count: ', @row_count) as update_count;