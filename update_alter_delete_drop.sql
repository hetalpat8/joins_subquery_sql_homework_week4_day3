-- Alter the order_ table
-- Drop the NOT NULL Constraint

ALTER TABLE order_
ALTER COLUMN upc
DROP NOT NULL;

-- Alter the customer table
--Adding new column of email
ALTER TABLE customer
ADD email VARCHAR(200);

--Alter the order_ table
--Change the name of the table

ALTER TABLE order_
RENAME COLUMN total_cost TO total_cost_tax;

--Update Statements
--Update Statements for customer table 
--Adding Email data to the email column

UPDATE customer
SET email = 'joel@codingtemple.com'
WHERE customer_id = 1; --this makes the change only for this customer

SELECT *
FROM customer

-- Update statement for order_ table 
-- Update the order_date to a future date

UPDATE order_
SET order_date = '2020/10/22'
WHERE order_date = '2020/10/20' and upc = 1;

SELECT *
FROM order_;

-- Delete Statement

-- Delete Statement for brand
--where seller_id == 1

DELETE FROM brand 
WHERE seller_id = 1;

-- DROP the product table 
DROP TABLE ptoduct CASCADE; -- finds the FK relationships and removes ties and removes the table

-- DROP the order_ table
DROP TABLE order_;
