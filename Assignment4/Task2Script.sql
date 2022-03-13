#Show the date and payment columns in different formats
select invoice_date, 
       cast(invoice_date as datetime) as "Full Date", 
       format(payment_total, 'N', 'en-us') as "Total Payment"
from invoices