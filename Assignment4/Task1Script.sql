#show the vendors that have an invoice
select distinct vendor_name
from vendors
where vendor_id in 
	(select vendor_id from invoices)
order by vendor_name