--Inner Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id --actor. here mean actor table
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

--Left Join on the Actor and Film_Actor Table
SELECT actor.actor_id, first_name,last_name,film_id --actor. here mean actor table
FROM film_actor --asking this table to join actor- this table holds all the info
LEFT JOIN actor -- above info(actor_id, first_name,last_name,film_id) is coming film actor
ON actor.actor_id = film_actor.actor_id;
WHERE first_name IS NULL and last_name is NULL; --This would check for NULL spaces

--Join that will produce info about a customer 
-- From the country of Angola
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';



--Subquery Examples

-- Two queries split apart(which will become a subqury later)

--Find a customer_id that has a amount greater 
--Than 175 in total payments
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

--Find ALL customer info
SELECT *
from customer;

--goal is to get all the info on everyone but just for those 6 people 
--Subguery to find the 6 customers that have
--A total amount of payments greater than 175

SELECT *
FROM customer
WHERE customer_id IN( 
   	SELECT customer_id --same code as above starting here placed in ()
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
--The above is a combination of the steps above with the added line with () 
--Just a subquery by it self



SELECT store_id,first_name,last_name
FROM customer
WHERE customer_id IN( 
   	SELECT customer_id --same code as above starting here placed in ()
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id,first_name,last_name;

--???
SELECT store_id,first_name,last_name,address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola' AND customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);





-- Basic Subquery
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);



-- Basic Subquery
-- Find all films with a language of "Enlish"

SELECT *
FROM film
WHERE language_id IN(
	SELECT language_id
	FROM language
	WHERE name = 'English'
);

---HOMEWORK--


--Question 1 List all the customers who live in Texas(use Joins)
SELECT first_name,last_name,address,district
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';

--Question 2 Get all payments above $6.99 with the Customer's Full Name
SELECT customer.customer_id,first_name,last_name,amount
FROM customer
INNER JOIN payment
ON  customer.customer_id = payment.customer_id
WHERE(amount) > 6.99
ORDER BY(amount) ASC;

--Question 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name,last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY first_name,last_name;

--Question 4 List all customers that live in Nepal (use the city table)
SELECT customer.first_name,customer.last_name,country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--5. Which staff member had the most transactions?
SELECT staff_id, COUNT(staff_id)
FROM payment
GROUP BY staff_id;

--6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);
	
--8. How many free rentals did our store give away?	
SELECT COUNT(customer.customer_id)
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount <= 0;