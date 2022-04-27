-- change the delimiter/line ending symbol so we can write nested code while using the standard ;
DELIMITER //

DROP PROCEDURE IF EXISTS delete_customer;
-- creates a procedure named test that takes no arguements
CREATE PROCEDURE delete_customer
(
-- declare our in variable - the customers ID
IN to_delete_id TINYINT
)
BEGIN
	
    -- create a variable names sql_error that is a tiny int
    -- set our new variable to false
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    -- create a handler that will wait for any error to be thrown, then update sql_error to true if one is thrown
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
        
	-- set a rollback point
	START TRANSACTION;
    
    -- attempt to delete the everything along the row containing the supplied ID
	DELETE FROM customers WHERE customer_id = to_delete_id;
    
    -- If the exception handler wasn't tripped solidify the changes within the tables and show the message in the action output
    IF sql_error = FALSE THEN
		COMMIT;
        SELECT 'The customer was deleted.';
        
	-- If the exception handler was tripped rollback andy changes back to the 'START TRANSACTION' line then show message in action output
	ELSE
		ROLLBACK;
        SELECT 'Unable to delete customer.';
	-- end the IF statement
    END IF;
-- end the procedure
END//