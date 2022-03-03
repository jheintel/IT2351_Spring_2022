select
      # Count number of products
       count(product_id) as "Product Count",
       
       # Display the maximum item price
       max(list_price) as "Maximum Item Price"
from products