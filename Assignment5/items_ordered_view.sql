create or replace view items_ordered as
select distinct p.product_name, oi.item_price, oi.quantity
from products p
join order_items oi on oi.product_id = p.product_id
;

SELECT * FROM jonheintel_guitar_shop.items_ordered;