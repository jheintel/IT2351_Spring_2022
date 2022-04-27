If I assume the script has already been written then easy-peasy: 

CALL delete_customer(customer_id);

But lets assume I must write this script! As best I understand:

-- USE A STORED PROCEDURE -- (a function returns a value we don't need no values here)
1) drop the procedure if it already exists
2) change your DELIMITER to some wakadoo symbol (not ; )
3) create a procedure named delete_customer()
4) within that procedure declare an IN variable requesting a customer ID
5) declare a exception handler, a start transaction, and try to DELETE * FROM customers WHERE customer_id = IN_variable
6) IF the error handler catches an error ROLLBACK and SELECT 'entry could not be dleted'
7) IF the error handler has not been triggered COMMIT and SELECT 'Customer entry deleted'
8) END the IF then END the procedure
9) slap whatever wonky symbol I've chosen to be the DELIMITER at the end
