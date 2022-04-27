-- change delimiter
DELIMITER //

-- create a trigger that will run before an update on the products table
CREATE TRIGGER products_before_update
	BEFORE UPDATE ON products
    -- run the trigger for any row updates
	FOR EACH ROW
BEGIN
	-- create variables named upper and lower for future tweaking 
    DECLARE upper INT DEFAULT 1200;
    DECLARE lower INT DEFAULT 100;
    
    -- IF the new price isnt within the set bounds toss out an error and a message
    IF  (NEW.list_price > upper || NEW.list_price < lower) THEN
		-- toss out a general error with the set message to the action output
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'new list price is outside of acceptable range.';
	END IF;
END//