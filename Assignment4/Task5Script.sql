select 
	#Show vendor name and replace nulls in phone number column
    v.vendor_name,
	ifnull(v.vendor_phone, "No phone provided")as "Phone Number",
    #display high when invoice_total > 1500 otherwise show low
    case
		when invoice_total > 1500 then "High"
        when invoice_total <= 1500 then "Low"
        else "Cost missing!"
    end as "Cost"
from vendors v
inner join invoices i on i.vendor_id = v.vendor_id