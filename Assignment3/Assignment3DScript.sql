select 
	# Display category name from categories
	c.category_name as "Product Category", 
    # Display product name
    p.product_name as "Product", 
    #sum the number of each item ordered from product_id
    sum(oi.quantity) as "Total Quantity"

# Join categories/products/order_items
from categories c
inner join products p
	on c.category_id = p.category_id
inner join order_items oi
	on oi.product_id = p.product_id
    
# combine categories into single rows then organize table
group by category_name,
         p.product_name with rollup
order by count(p.product_id) asc