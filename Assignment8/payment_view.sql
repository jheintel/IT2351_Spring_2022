CREATE OR REPLACE VIEW invoices_owed AS
SELECT si.invoice_id, sci.supplier_name, si.invoice_date, si.invoice_total, s.routing_number, s.acct_number
FROM supply_invoices si

JOIN supply_orders so ON so.supply_order_id = si.supply_order_id
JOIN suppliers s ON s.supplier_id = so.supplier_id
JOIN suppliers_contact_info sci ON sci.supplier_id = s.supplier_id

WHERE payment_date IS NULL