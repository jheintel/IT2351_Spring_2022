select 
	#show email address and its length
	email_address, length(email_address) as "Length",
    #display the position of the '@' in the email address
	position("@" in email_address) as "@",
    #Display before and after the '@' with the names Username, Domain respectively
    substring(email_address, 1 , position("@" in email_address)-1) as "Username",
    substring(email_address, position("@" in email_address)+1) as "Domain"
from customers