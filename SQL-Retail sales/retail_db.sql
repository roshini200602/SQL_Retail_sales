create database  retail_db;
use retail_db;
create table sale(sale_id INT unique key,
product_name varchar(50),
category varchar(50),
quantity INT not null,
price int  not null,
customer_city varchar(50),
payment_mode  varchar(50),
sales_person varchar(50));
INSERT INTO sale(sale_id, product_name, category, quantity, price, customer_city, payment_mode, sales_person) VALUES 
(1, 'Laptop', 'Electronics', 2, 55000, 'Bangalore', 'UPI', 'Anil'),
 (2, 'Mouse', 'Electronics', 5, 800, 'Mysore', 'Cash', 'Bhumika'),
 (3, 'Keyboard', 'Electronics', 3, 1500, 'Bangalore', 'Card', 'Chetan'), 
 (4, 'Chair', 'Furniture', 4, 3500, 'Mangalore', 'UPI', 'Anil'),
 (5, 'Table', 'Furniture', 2, 7000, 'Bangalore', 'Card', 'Dhruv'), 
 (6, 'Notebook', 'Sta onery', 10, 80, 'Mysore', 'Cash', 'Bhumika'), 
 (7, 'Pen', 'Stationery', 20, 30, 'Bangalore', 'UPI', 'Chetan'), 
 (8, 'Printer', 'Electronics', 1, 18000, 'Mangalore', 'Card', 'Dhruv'),
 (9, 'Desk Lamp', 'Furniture', 3, 1200, 'Mysore', 'UPI', 'Anil'), 
 (10, 'Headphones', 'Electronics', 4, 2500, 'Bangalore', 'Cash', 'Bhumika'),
 (11, 'Bookshelf', 'Furniture', 1, 9000, 'Mangalore', 'Card', 'Chetan'), 
 (12, 'Marker', 'Stationery', 8, 60, 'Bangalore', 'Cash', 'Dhruv'); 
 
 -- Display all records from the sales table
 select * from sale;
 
 --  Display only:  product_name   category   price  
 select product_name,category,price from sale;
 
 --  Display all sales where the product category is Electronics. 
 select * from sale where category="electronics";
 
 -- Display all sales made by salesperson Anil. 
 select * from sale where sales_person="anil";
 
 -- Display all sales where the quantity sold is greater than 3. 
 select * from sale where quantity>3;
 
-- Display all sales where the price is greater than 5,000
select * from sale where price>5000;

-- Display all sales made in Bangalore. 
select * from sale where customer_city="Bangalore";

-- Display the product name, quan ty and price of products where the payment mode is UPI.
select product_name,quantity,price from sale where payment_mode="UPI";

-- Display Electronics products sold in Bangalore. 
select * from sale where category="electronics" and customer_city="Bangalore";

--  Display sales where the quantity is greater than 3 and the payment mode is UPI.
select * from sale where quantity>3 and payment_mode="upi";

--  Display sales where the category is Furniture and the city is Mangalore.
SELECT * FROM sale WHERE CATEGORY ="FURNITURE" AND CUSTOMER_CITY="MANGALORE";

-- Display sales made either in Bangalore or Mysore. 
SELECT * FROM SALE WHERE CUSTOMER_CITY="BANGALORE" OR CUSTOMER_CITY="MYSORE";

--  Display Electronics products where the price is greater than 10,000. 
SELECT * FROM SALE WHERE CATEGORY="ELECTRONICS" AND PRICE>10000;

-- Display sales made by Anil or Bhumika. 
SELECT * FROM SALE WHERE SALES_PERSON="BHUMIKA"; 

-- Display products whose price is between 1,000 and 10,000. 
SELECT  product_name  FROM SALE WHERE PRICE>1000 AND PRICE<10000;

-- Display products whose quantity is between 2 and 5. 
SELECT product_name from sale where quantity between 2 and 5;

-- Display sales from Bangalore, Mysore and Mangalore using IN.
select * from sale where customer_city in("mysore","mangalore","bangalore");

--  Display sales where the payment mode is either Cash or Card.
select * from sale where payment_mode="cash" or payment_mode="card";

--  Display Furniture and Electronics products using IN. 
select * from sale  where category in("furniture","electronics");

--  Find the total number of sales records. 
select count(*) as total_sale from sale;

--  Find the total quantity of products sold.
select sum(quantity) from sale;

--  Find the highest product price. 
select max(price) from sale;

-- Find the lowest product price.
select min(price) from sale;

-- Find the average product price.
select avg(price) from sale;

-- Find the total quantity of Electronics products sold. 
select count(*) from sale where category="electronics";

--  Find the number of products sold using UPI. 
select count(*) from sale where payment_mode="upi";

-- Find the average price of Furniture products.
select avg(price) from sale where category="furniture";

-- Find the number of sales made in each city. 
select customer_city,count(*) from sale group by customer_city;

-- Find the total quantity sold in each city. 
select customer_city,count(quantity) from sale group by customer_city;

-- Find the average product price for each category.
select category,avg(price) from sale group by category;

-- Find the highest product price in each category.
select category,max(price) from sale group by category; 

--  Find the lowest product price in each category
select category,min(price) from sale group by category; 

-- Find the number of sales handled by each salesperson
select sales_person,count(*) from sale group by sales_person; 

--  Find the number of sales for each payment mode.
select payment_mode,count(*) from sale group by payment_mode;

-- Find the total quantity sold for each category.
select category,count(quantity) from sale group  by category;

-- Display cities where more than 2 sales were made.
select customer_city,count(*)  from sale group  by  customer_city having count(*)>2;

--  Display categories having more than 3 sales.
select category,count(*) from sale group by category having count(*)>3;

-- Display salespersons who handled more than 2 sales.
select sales_person,count(*)  from sale  group by sales_person having count(*)>2;

-- Display categories where the average product price is greater than 2,000.
select category,avg(price) from sale group by category having avg(price)>2000;

-- Display cities where the total quantity sold is greater than 10.
select customer_city,sum(quantity) from sale group by customer_city having sum(quantity)>10;

-- Display payment modes used for more than 3 sales.
select payment_mode,count(*) from sale group by payment_mode having count(*)>3;

--  Display all products from highest price to lowest price.
select * from sale order by price desc;

--  Display all products from lowest price to highest price.
select * from sale order by price asc;

--  Display products alphabetically according to their names.
select * from sale order by product_name asc;

--  Display categories and their average product price, star ng from the highest average price
select category,avg(price) from sale group by category order by avg(price) desc;

-- Find the total quantity sold in each city and display the cities from highest quantity to lowest quatity. 
select customer_city,sum(quantity) from sale group by customer_city order by sum(quantity) desc;

--  Find the average price of each category and display only categories whose average price is greater than 2,000. 
select category,avg(price) from sale group by category having avg(price)>2000;

-- Find the number of sales made by each salesperson and display only salespersons who made more than 2 sales.
select salesperson,count(*) from sale group by salesperson having count(*)>2;

--  Find the total quantity sold for each category and arrange the categories from highest to lowest quantity.
select category,sum(quantity) from sale group by category order by sum(quantity) desc;

--  Find the average product price for each city and display the cities from highest average price to lowest average price.
select customer_city,avg(price) from sale group by customer_city order by avg(price) desc;

--  Find the number of sales for each payment mode and display only payment modes used more than 3 times.
select payment_mode,count(*) from sale group by payment_mode having count(*)>3;

--  Find the total quantity of Electronics products sold in each city.
select customer_city,sum(quantity) from sale where category='Electronics' group by customer_city;

-- Find the average price of products sold in Bangalore for each category.
select category,avg(price) from sale where customer_city='Bangalore' group by category;

--  Find the total quantity sold by each salesperson and display only salespersons whose total quantity is greater than 10.
select sales_person,sum(quantity) from sale group by sales_person having sum(quantity)>10;

--  Find the number of sales for each category, but display only categories having more than 3 sales, and arrange them from highest number of sales to lowest.
select category,count(*) from sale group by category having count(*)>3 order by count(*) desc;