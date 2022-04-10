-- Declare what database to use
USE jonheintel_guitar_shop;
-- delete InsertCategory if the procedure already exists
DROP PROCEDURE IF EXISTS InsertCategory;
-- change the delimiter so that ; may be used within the procedure
DELIMITER //

-- Create the procedure InsertCategory passing it no variables
CREATE PROCEDURE InsertCategory()
BEGIN
	-- declare variable to be used within procedure, one for error, one for value to be added
    DECLARE sql_error INT DEFAULT FALSE; #Are booleans not used in SQL?
    DECLARE new_value VARCHAR(10) DEFAULT NULL;
    SET new_value = 'Winds';
    
    BEGIN
		-- declare a condition handler to catch all erros that aren't "NOT FOUND" errors
        -- that sets the value of sql_error to true if error is thrown
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
			SET sql_error = TRUE;
		
        -- attempt to add a new row to categories with the value within new value
		INSERT INTO categories(category_id, category_name)
			VALUES(NULL, new_value); #null in the ID place takes advantage of AUTO_INCREMENT within the table definition ;; I didn't check if category_name was DISTINCT
		-- Display message denoting success of row insert
        SELECT '1 row was inserted' AS message;
	END;
    
--   Added IF STATEMENT error checking which didnt use the exception handler only to realize it ruined the purpose of assignment
--   IF new_value NOT IN(SELECT category_name FROM categories) THEN
-- 		BEGIN
-- 			DECLARE EXIT HANDLER FOR SQLEXCEPTION
-- 				SET sql_error = TRUE;
-- 			INSERT INTO categories(category_id, category_name)
-- 				VALUES(NULL, new_value);
-- 			SELECT '1 row was inserted' AS message;
-- 		END;
-- 	  ELSE
-- 		SELECT 'Category Already Exists' AS messgae;
--    END IF;
    
    -- Check if error was thrown and caught by exception handler then display message of procedure failure
    IF sql_error = TRUE THEN
		SELECT 'Row was not inserted - SQL exception encountered.' AS message;
	END IF;
END //

-- Change delimiter back
DELIMITER ;	
-- call the created procedure
CALL InsertCategory();

-- Delete the row for testing shenanigans
-- DELETE FROM categories WHERE category_name = 'Winds'