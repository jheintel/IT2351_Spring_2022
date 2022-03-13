#Show vendor name then show it again uppercase
select vendor_name, upper(vendor_name) as "Vendor Name Upper",
       #show vendor phone and then its last 4 digits
       vendor_phone, right(vendor_phone, 4) as "Last 4 phone digits",
       #show the second word in vendor name
       substring(vendor_name, locate(' ', vendor_name), 
			#calculation to subtract from the second space to the first
            (locate(' ', vendor_name, locate(' ', vendor_name)+1) - locate(' ', vendor_name))
	   ) as "Vendor Second Word"
from vendors