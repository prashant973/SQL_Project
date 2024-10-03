create database AmazonDB;
use amazondb;
select * from amazondb.amazon_sales;
desc amazondb.amazon_sales;


ALTER table amazon_sales change column `Invoice ID` Invoice_ID VARCHAR(30) not null;
ALTER table amazon_sales modify column Invoice_ID VARCHAR(30) not null;

ALTER table amazon_sales change column Branch branch VARCHAR(5);
ALTER table amazon_sales modify column branch VARCHAR(5) not null;

ALTER table amazon_sales change column City city VARCHAR(30) not null;

ALTER table amazon_sales change column `Customer type` customer_type VARCHAR(30);
ALTER table amazon_sales modify column customer_type VARCHAR(30) not null;

ALTER table amazon_sales change column Gender gender VARCHAR(10) not null;

ALTER table amazon_sales change column `Product line` product_line VARCHAR(100);
ALTER table amazon_sales modify column product_line VARCHAR(100) not null;

ALTER table amazon_sales change column `Unit price` unit_price DECIMAL(10, 2);
ALTER table amazon_sales modify column unit_price DECIMAL(10, 2) not null;

ALTER table amazon_sales change column Quantity quantity int not null;

ALTER table amazon_sales change column `Tax 5%` VAT FLOAT(6, 4) not null;

ALTER table amazon_sales change column Total total DECIMAL(10, 2) not null;

ALTER table amazon_sales change column Date date DATE not null;
ALTER table amazon_sales modify column date DATE  not null;

ALTER table amazon_sales modify column Time time;
ALTER table amazon_sales change column time time timestamp not null;

ALTER table amazon_sales change column Payment payment_method DECIMAL(10, 2) not null;
ALTER table amazon_sales modify column payment_method decimal(10,2) not null;

ALTER table amazon_sales modify column cogs DECIMAL(10, 2) not null;

ALTER table amazon_sales change column `gross margin percentage` gross_margin_percentage FLOAT(11, 9) not null;

ALTER table amazon_sales change column `gross income` gross_income DECIMAL(10, 2);
ALTER table amazon_sales modify column gross_income DECIMAL(10, 2) not null;

ALTER table amazon_sales change column `Rating` rating float(3,1) not null;

select total from  amazondb.amazon_sales;

select * from  amazondb.amazon_sales;
desc amazondb.amazon_sales;


ALTER TABLE amazondb.amazon_sales
ADD timeofday varchar(20) not null;


UPDATE amazondb.amazon_sales
SET timeofday = 
  CASE 
   WHEN HOUR(time) BETWEEN 6 AND 11 THEN 'Morning'
   WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
   WHEN HOUR(time) BETWEEN 18 AND 23 THEN 'Evening'
    ELSE 'Night'
  END;