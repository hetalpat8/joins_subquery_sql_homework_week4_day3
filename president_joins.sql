-- Customer Table for Presidents
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);

-- Orders Table for Presidents
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(1,'George','Washington','gwash@usa.gov', '3200 Mt Vernon Hwy', 'Mt Vernon', 'VA', '22121');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(2,'John','Adams','jadams@usa.gov','1200 Hancock', 'Quincy', 'MA','02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(3,'Thomas','Jefferson', 'tjeff@usa.gov', '931 Thomas Jefferson Pkway', 'Charlottesville','VA','02169');

INSERt INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(4,'James','Madison', 'jmad@usa.gov', '11350 Conway','Orange','VA','02169');

INSERT INTO customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
VALUES(5,'James','Monroe','jmonroe@usa.gov','2050 James Monroe Parkway','Charlottesville','VA','02169');

-- INSERT INFO INTO ORDERS TABLE

INSERT INTO order_(order_id,amount,customer_id)
VALUES(1,234.56,1);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(2,78.50,3);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(3,124.00,2);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(4,65.50,3);

INSERT INTO order_(order_id,amount,customer_id)
VALUES(5,55.50,NULL);

SELECT *
FROM order_;

SELECT *
FROM customer;

--Inner Join - asking info from these tables to view together-not creating new table
SELECT first_name,last_name,order_date,amount -- first and last names came from customer(A) and date+amount came from order_(B)
FROM customer --table A
INNER JOIN order_ --table B
ON customer.customer_id = order_.customer_id;

--Left Join - asking info from these tables to view together-not creating new table
SELECT first_name,last_name,order_date,amount  -- first and last names came from customer(A) and date+amount came from order_(B)
FROM customer --table A
LEFT JOIN order_ --table B
ON customer.customer_id = order_.customer_id
WHERE order_date IS NOT NULL; --this says don't give info if it has null
--The same example as below but with null which now removes null boxes

--Left Join - asking info from these tables to view together-not creating new table
SELECT first_name,last_name,order_date,amount  -- first and last names came from customer(A) and date+amount came from order_(B)
FROM customer --table A
LEFT JOIN order_ --table B
ON customer.customer_id = order_.customer_id;
--The same example as above but without null which now includes null boxes

--Right Join - asking info from these tables to view together-not creating new table
SELECT first_name,last_name,order_date,amount  -- first and last names came from customer(A) and date+amount came from order_(B)
FROM customer --table A
RIGHT JOIN order_ --table B
ON customer.customer_id = order_.customer_id;

--FULL Join - asking info from these tables to view together-not creating new table
SELECT first_name,last_name,order_date,amount  -- first and last names came from customer(A) and date+amount came from order_(B)
FROM customer --table A
FULL JOIN order_ --table B
ON customer.customer_id = order_.customer_id;
--This allows us to see everything listed next to select



