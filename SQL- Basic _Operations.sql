-- Objective:
-- Understand and apply basic SQL operations including database creation, data retrieval, data manipulation, and aggregation.

-- 1. Create a database named EcommerceOrders.
create database EcommerceOrders;

-- 2. Select / use the database.
use EcommerceOrders;
-- 3. Create a table named Orders with the following columns:
	-- OrderID (Primary Key, Auto Increment)
	-- CustomerName
	-- Email
	-- Product
	-- Category
	-- Quantity
	-- Price
	-- OrderDate


create Table Orders(
OrderID  int  NOT NULL AUTO_INCREMENT,
CustomerName varchar(100 ),
Email varchar(100 ),
Product varchar(100 ),
Category varchar(100 ),
Quantity int,
Price int,
OrderDate date,
PRIMARY KEY (OrderID)
);

select * from Orders;
    
-- 4. Insert the given rows into table
	-- complete the given code by writing the table name
    
INSERT INTO Orders (CustomerName, Email, Product, Category, Quantity, Price, OrderDate) 
VALUES
	('Ali Khan', 'ali.khan@example.com', 'Laptop', 'Electronics', 1, 1200, '2023-01-15'),
	('Fatima Ahmed', 'fatima.ahmed@example.com', 'Smartphone', 'Electronics', 2, 800, '2023-01-17'),
	('Bilal Shah', 'bilal.shah@example.com', 'Office Chair', 'Furniture', 3, 150, '2023-01-20'),
	('Ayesha Malik', 'ayesha.malik@example.com', 'Desk Lamp', 'Furniture', 5, 25, '2023-01-22'),
    ('Omar Farooq', 'omar.farooq@example.com', 'Mixer', 'Kitchen', 1, 60, '2023-02-01'),
	('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Air Conditioner', 'Home Appliances', 1, 1000, '2023-02-03'),
	('Asad Mirza', 'asad.mirza@example.com', 'Toaster', 'Kitchen', 1, 25, '2023-02-07'),
	('Usman Sheikh', 'usman.sheikh@example.com', 'Coffee Maker', 'Kitchen', 1, 80, '2023-01-25'),
	('Sara Yousaf', 'sara.yousaf@example.com', 'Blender', 'Kitchen', 1, 50, '2023-01-28'),
	('Hassan Iqbal', 'hassan.iqbal@example.com', 'Book', 'Books', 10, 15, '2023-01-30'),
	('Rabia Karim', 'rabia.karim@example.com', 'Microwave', 'Kitchen', 1, 100, '2023-02-01'),
    ('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Coffee Maker', 'Kitchen', 1, 80, '2023-02-08'),
	('Arif Ali', 'arif.ali@example.com', 'Headphones', 'Electronics', 2, 200, '2023-02-03'),
	('Nida Khan', 'nida.khan@example.com', 'Monitor', 'Electronics', 1, 300, '2023-02-05'),
	('Zainab Javed', 'zainab.javed@example.com', 'Tablet', 'Electronics', 1, 150, '2023-02-07'),
	('Omar Farooq', 'omar.farooq@example.com', 'Vacuum Cleaner', 'Home Appliances', 1, 250, '2023-02-10'),
	('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Washing Machine', 'Home Appliances', 1, 500, '2023-02-12'),
	('Asad Mirza', 'asad.mirza@example.com', 'Refrigerator', 'Home Appliances', 1, 800, '2023-02-14'),
	('Sana Tariq', 'sana.tariq@example.com', 'Air Conditioner', 'Home Appliances', 1, 1000, '2023-02-16'),
	('Ahmad Raza', 'ahmad.raza@example.com', 'Electric Kettle', 'Kitchen', 1, 30, '2023-02-18'),
	('Hiba Anwar', 'hiba.anwar@example.com', 'Toaster', 'Kitchen', 1, 25, '2023-02-20'),
	('Faisal Nawaz', 'faisal.nawaz@example.com', 'Blender', 'Kitchen', 1, 40, '2023-02-22'),
	('Mariam Saeed', 'mariam.saeed@example.com', 'Cooker', 'Kitchen', 1, 70, '2023-02-24'),
	('Imran Siddiqui', 'imran.siddiqui@example.com', 'Mixer', 'Kitchen', 1, 60, '2023-02-26'),
    ('Omar Farooq', 'omar.farooq@example.com', 'Mixer', 'Kitchen', 1, 60, '2023-02-27'),
	('Mehreen Akhtar', 'mehreen.akhtar@example.com', 'Air Conditioner', 'Home Appliances', 1, 1000, '2023-02-21'),
	('Asad Mirza', 'asad.mirza@example.com', 'Toaster', 'Kitchen', 1, 25, '2023-02-17'),
	('Sana Tariq', 'sana.tariq@example.com', 'Cooker', 'Kitchen', 1, 70,  '2023-02-20');

-- 4. Retrieve all records from the table.
select * from orders;

-- 5. Retrieve orders where the category is 'Electronics'.
select * from orders
where category='electronics';

-- 6. Retrieve orders where the price is above 100.
select * from orders
where price>100;

-- 7. Add the Sales/Revenue Column to the Table: (choose one name. either sales or revenue)
Alter table orders  add Sales int ; 

-- 8. Update the Sales/Revenue Column with price * Quantity.  
update orders set Sales = price * Quantity;
SET SQL_SAFE_UPDATES = 0;

-- 9. Find the total sales generated from the 'Electronics' category.
select sum(Sales) as total_Sale 
from orders 
where category ='Electronics';

-- 10. List the top 5 customers by the total amount spent.
select * from orders 
order by  sales 
desc limit 5; 
-- 11. Find the average price of products in each category.

select avg(price) from orders 
group by Category;

-- 12. List all products that have been ordered more than 5 times.
select product, sum(quantity) as total_orders
from orders
group by product
having sum(quantity) > 5;

-- 13. Calculate the total number of products sold in the 'Kitchen' category.
select category , sum(quantity) as product_sold
from orders
where category='kitchen'
group by category;

-- 14. Use the IF  statement to create a temporary new column PriceCategory where:
	-- Orders with a price above 200 are 'High'
	-- Orders with a price between 100 and 200 are 'Medium'
	-- Orders with a price below 100 are 'Low'

select price,
       IF(price > 200, 'High',
          IF(price >= 100 AND price <= 200, 'Medium',
           IF(price < 100 , 'low','unknow')
           ))
           
           as price_category
from orders;


-- 15. Identify customers who have placed 2 or more orders.
select email, count(*) as order_count 
from orders 
group by email
having count(*) >= 2;

