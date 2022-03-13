select 
	#Use different methods to effect list_price
    list_price,
    format(list_price, 1) as "Rounded with 1 decemal place",
    convert(list_price, signed) as "Converted to signed int",
    cast(list_price as signed) as "Cast as a signed int"
from products