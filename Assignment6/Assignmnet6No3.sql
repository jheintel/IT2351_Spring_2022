-- A script to create a function that calculates a new price which is the item_price minus discount_amount in the order_items table

-- Declare what database to use
USE jonheintel_guitar_shop;
-- delete new_price if the function already exists
DROP FUNCTION IF EXISTS new_price;
-- change the delimiter so that ; may be used within the function
DELIMITER //

-- Create the function new_price passing it an integer id
CREATE FUNCTION new_price(id INT) RETURNS DECIMAL(10, 2)
-- I could have changed settings to relax MySQL requiring these lines but I prefered figuring them out
READS SQL DATA
DETERMINISTIC
BEGIN
	-- create variable to store solution
    DECLARE total DECIMAL(10, 2) DEFAULT 0;
    -- subtract discount_amount from item_price and store the value in total, where passed value is the id of the current line
    SELECT (item_price - discount_amount) INTO total FROM order_items WHERE item_id = id;
    RETURN total;
END //

-- Change delimiter back
DELIMITER ;	