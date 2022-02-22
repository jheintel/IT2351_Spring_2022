-- display title, artist, unit price, order quantity, and a 
-- total with tax (1.07) then remove duplicate rows with the distinct keyword

select distinct title, artist, unit_price, order_qty, 
	   round(unit_price*1.07, 2) as "Total with Tax"
from items i
inner join order_details od on i.item_id = od.item_id