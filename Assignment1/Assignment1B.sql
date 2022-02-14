-- selects title, artist, unit price within items table 
-- where the unit price is greater that 16
-- Jon Heintel 2/13/22

select title, artist, unit_price
	from items
    where unit_price > 16