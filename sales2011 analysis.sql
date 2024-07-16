--creating the 2011 Sales table
CREATE TABLE sales2011(
	order_id VARCHAR,
	order_date DATE,
	ship_date DATE,
	ship_mode VARCHAR,
	customer_name VARCHAR,
	segment VARCHAR,
	state VARCHAR,
	country VARCHAR,
	product_id VARCHAR,
	category VARCHAR,
	sub_category VARCHAR,
	product_name VARCHAR,
	sales INT,
	quantity INT,
	discount DECIMAL,
	shipping_cost DECIMAL
);

SELECT * FROM sales2011;

--making order id the primary key of the table
ALTER TABLE sales2011 ADD CONSTRAINT sales_pky PRIMARY KEY (order_id);



--importing the sales data into the table
COPY sales2011 FROM 'C:\Users\sandr\Desktop\Amdor Analytics\SQL\2011Sales.csv' DELIMITER ',' CSV HEADER;

--deleting the primary key constraint
ALTER TABLE sales2011 DROP CONSTRAINT sales_pky;


SELECT * FROM sales2011;

--query to return the total number of orders
SELECT COUNT(*) FROM sales2011;

--query to return the total number of customers
SELECT COUNT(DISTINCT customer_name) FROM sales2011;

--query to return the total revenue generated from sales
SELECT SUM(sales) FROM sales2011;

--query to return the maximum shipping cost
SELECT MAX(shipping_cost) FROM sales2011;

--query to return the total number of orders from the consumer segment
SELECT COUNT(order_id)
FROM sales2011
WHERE segment = 'Consumer';















