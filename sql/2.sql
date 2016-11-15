select author.first_name, author.last_name, count(author.id) cc
from booking
join book_author on booking.book_id = book_author.book_id
join author on author.id = book_author.author_id
group by book_author.author_id order by cc desc limit 15
