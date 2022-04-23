DROP EVENT IF EXISTS monthly_update;

-- change deliminter
DELIMITER //

-- create an event named monthly update
CREATE EVENT monthly_update
-- happens once a month starting June 1st 2022
ON SCHEDULE EVERY 1 MONTH
STARTS '2022-06-01'
DO BEGIN
	-- insert all the rows from invoices that payment_date is older than a month old, into invoice archive
	-- I was afraid to delete stuff =(
    INSERT INTO invoice_archive
    SELECT * FROM ivoices
	WHERE payment_date < NOW() - INTERVAL 1 MONTH;
END//