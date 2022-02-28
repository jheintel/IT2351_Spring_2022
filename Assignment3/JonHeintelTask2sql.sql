# update terms_id 6 with a new description and due date

update terms
set terms_description = "Net due 90 days",
    terms_due_days = 90
where terms_id = 6