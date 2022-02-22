-- display item_id, title, artist and multiply the unit_price 
-- in the items table by 1.08. Round to two decimal places and assign the 
-- alias new_price. Sort the output by price in descending order.
-- NOTE: to get equal numbers to the example replace 1.08 with 1.04

select item_id, title, artist, round((unit_price *1.08), 2) as "new_price"
from items
order by new_price desc