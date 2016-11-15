select b.id, b.title from book b
join book_category bc on bc.book_id = b.id
join category c on c.id = bc.category_id
join book_keyword bk on bk.book_id = b.id
join keyword k on k.id = bk.keyword_id
where c.name = "science fiction" and k.keyword in ('religion', 'humour')
group by b.id having count(*) = 2
