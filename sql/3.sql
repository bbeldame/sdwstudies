select avg(amount), date_format(payment_date, '%Y') `year` from payment
where payment_date >= date_sub(NOW(), INTERVAL 5 YEAR) group by `year`
