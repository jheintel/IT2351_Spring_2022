select 
	#show the product name and list price for 
    #products over the average cost
    product_name, list_price
from products
# use a subquery to find average list_price
where list_price > (select avg(list_price) from products)