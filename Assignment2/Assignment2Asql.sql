-- title, artist, and unit price (between 15-18) from items 
-- order by unit price then artist

select title as "Title", artist as "Artist", unit_price as "Unit Price"
from items
where unit_price between 15 and 18
order by unit_price, artist asc