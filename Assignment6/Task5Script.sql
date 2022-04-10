-- Declare what database to use
USE ap;
-- change the delimiter so that ; may be used within the function
DELIMITER //
-- delete get_balance_due if the function already exists
DROP FUNCTION IF EXISTS get_balance_due;

-- create get_balance_due procedure to check error handling
CREATE FUNCTION get_balance_due(
	-- define function parameters
    invoice_id_param INT
)
-- set a return type
RETURNS DECIMAL(9,2)
-- the function reads sql data and is deterministic
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE balance_due_var DECIMAL(9,2);
    
    -- balance_due_var = (invoice_total - payment_total - credit_total)
    SELECT invoice_total - payment_total - credit_total
    INTO balance_due_var
    FROM invoices
    -- make sure we do the math on the correct rows
    WHERE invoice_id = invoice_id_param;
    
    -- return stored value
    RETURN balance_due_var;
END//

-- Change delimiter back
DELIMITER ;	

-- call the function
SELECT vendor_id, invoice_number, 
	get_balance_due(invoice_id) AS balance_due
FROM invoices
WHERE vendor_id = 37;