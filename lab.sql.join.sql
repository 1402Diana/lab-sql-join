-- List the number of films per category.
select c.name as category_name, count(*) as film_count
from category c
join film_category fc on c.category_id = fc.category_id
join film f on fc.film_id = f.film_id
group by c.name
order by film_count desc;

-- Display the first and the last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff s
join address a on s.address_id = a.address_id;

-- Display the total amount rung up by each staff member in August 2005.
select s.staff_id, s.first_name, s.last_name, sum(p.amount) as total_amount
from payment p
join staff s on p.staff_id = s.staff_id
where p.payment_date between '2005-08-01' and '2005-08-31'
group by s.staff_id, s.first_name, s.last_name
order by total_amount desc;

-- List all films and the number of actors who are listed for each film.
select f.title, count(fa.actor_id) as actor_count
from film f
join film_actor fa on f.film_id = fa.film_id
group by f.film_id, f.title
order by f.title;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_amount
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by c.last_name, c.first_name;