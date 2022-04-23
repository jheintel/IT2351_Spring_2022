-- change delimiter
DELIMITER //

-- create a trigger that will run before an update on the invoices table
CREATE TRIGGER invoices_before_update
	BEFORE UPDATE ON invoices
    -- run the trigger for any row updates
	FOR EACH ROW
BEGIN
	-- create a variable named sum_line_item_amount that is a decimal with 9 places before and 2 places after the dot
    DECLARE sum_line_item_amount Decimal(9,2);
    
    -- add the contents of the line_item_amount columns
    SELECT SUM(line_item_amount)
    -- store that sum into our created variable
    INTO sum_line_item_amount
    -- from the table invoice_line_items
    FROM invoice_line_items
    -- make sure the data being compared is the NEW data being added
    WHERE invoice_id = NEW.invoice_id;
    
    -- IF our variable is not equal to the the invoice_total which is a sum of the invoices your update is bad
    IF sum_line_item_amount != NEW.invoice_total THEN
		-- toss out a general error with the set message to the action output
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'Line item total must match invoice total.';
	END IF;
END//

