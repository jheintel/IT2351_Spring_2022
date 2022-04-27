SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS one_time_test_row;

-- change deliminter
DELIMITER //

-- create an event named monthly update
CREATE EVENT one_time_test_row
-- 
ON SCHEDULE AT NOW() + INTERVAL 1 MONTH
DO BEGIN
	-- insert all the rows from invoices that payment_date is older than a month old, into invoice archive
	-- I was afraid to delete stuff =(
    INSERT INTO categories(category_id, category_name)
    VALUES(NULL, TEST);
END//

SHOW EVENTS;