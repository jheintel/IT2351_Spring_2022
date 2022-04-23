-- change the delimiter/line ending symbol so we can write nested code while using the standard ;
DELIMITER //

-- creates a procedure named test that takes no arguements
CREATE PROCEDURE test()
BEGIN
	-- create a variable names sql_error that is a integer between 0-255 (we'll only be using 0-1 for boolean purposes)
    -- set our new variable to false
	DECLARE sql_error TINYINT DEFAULT FALSE;
    
    -- create a handler that will wait for any error to be thrown, then update sql_error to true if one is thrown
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET sql_error = TRUE;
        
	-- set a rollback point
	START TRANSACTION;
    
    -- insert rows into tables with the given values in order that they are given
    INSERT INTO invoices
    VALUES (115, 34, 'ZXA-080', '2018-01-18',
			14092.59, 0,0,3, '2018-04-18', NULL);
            
	INSERT INTO invoice_line_items
    VALUES (115, 1, 160, 4447.23, 'HW upgrade');
    
    INSERT INTO invoice_line_items
    VALUES (115, 2, 167, 9645.36, 'OS upgrade');
    -- end table inserts
    
    -- If the exception handler wasn't tripped solidify the changes within the tables and show the message in the action output
    IF sql_error = FALSE THEN
		COMMIT;
        SELECT 'The transaction was committed.';
        
	-- If the exception handler was tripped rollback andy changes back to the 'START TRANSACTION' line then show message in action output
	ELSE
		ROLLBACK;
        SELECT 'The transaction was rolled back.';
	-- end the IF statement
    END IF;
-- end the procedure
END//