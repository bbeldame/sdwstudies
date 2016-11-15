select customer.id, customer.first_name, customer.last_name from customer
left join booking on booking.customer_id = customer.id
where booking.id is null
