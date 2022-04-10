-- A script that calls a stored procedure named ProductCount
-- I read an article about SQL capitalization so thats a thing I'll try to be better about

-- Declare what database to use
USE jonheintel_guitar_shop;
-- delete ProductCount if the procedure already exists
DROP PROCEDURE IF EXISTS ProductCount;
-- change the delimiter so that ; may be used within the procedure
DELIMITER //

-- Create the procedure product count passing it no variables
CREATE PROCEDURE ProductCount()
BEGIN
	-- create an integer variable named pcount and assign it the value counted from the products table
	DECLARE pcount INT;
    SELECT COUNT(*) INTO pcount FROM products; #maybe want to count DISTINCT in case of duplicate entries
    
    -- Check to see if pcount is greater than or equal to 18 then output predetermined messages
    IF pcount >= 18 THEN
		SELECT CONCAT('The number of products is greater than or equal to 18') AS message;
    ELSE
		SELECT CONCAT('The number of products is less than 18') AS message;
    END IF;
END //

-- Change delimiter back
DELIMITER ;	
-- call the created procedure
CALL ProductCount();