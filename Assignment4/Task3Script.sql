#show the invoice date and payment date
select invoice_id, invoice_date, payment_date,
       #show the days between payments
	   datediff(payment_date, invoice_date) as "Nonpayment Days",
       #show 30 days from the invoice
       date_add(invoice_date, interval 30 day) as "Payment Due"
from invoices