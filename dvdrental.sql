--query to view the customer table
SELECT * FROM public.customer;


--creating category table
CREATE TABLE category(
category_id INT,
category_name VARCHAR,
last_update timestamp);

SELECT * FROM category;
--importing data into the category table
COPY public.category
FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\category.csv'
DELIMITER ',' CSV HEADER;

--making category id the primary key of the category table
ALTER TABLE category ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--creating city table
CREATE TABLE city(
	city_id INT PRIMARY KEY,
	city VARCHAR,
	country_id INT,
	last_update TIMESTAMP
);
--importing data into the city table
COPY city
FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\city.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM city;


--creating country table
CREATE TABLE country(
	country_id INT PRIMARY KEY,
	country VARCHAR,
	last_update TIMESTAMP
);
--importing data into the country table
COPY country
FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\country.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM country;


--creating actor table
CREATE TABLE actor(
	actor_id INT PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	last_update TIMESTAMP
);
--importing data into the actor table
COPY actor
FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\actor.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM actor;


--creating film_actor table
CREATE TABLE film_actor(
	actor_id INT,
	film_id INT,
	last_update TIMESTAMP,
	FOREIGN KEY (actor_id) REFERENCES actor (actor_id),
	FOREIGN KEY (film_id) REFERENCES film (film_id)
);
--importing data into the film_actor table
COPY film_actor
FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\film_actor.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM film_actor;


--creating film_category table
CREATE TABLE film_category(
	film_id INT,
	category_id INT,
	last_update TIMESTAMP,
	FOREIGN KEY (category_id) REFERENCES category (category_id),
	FOREIGN KEY (film_id) REFERENCES film (film_id)
);
--importing data into the film_category table
COPY film_category
FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\film_category.csv'
DELIMITER ',' CSV HEADER;

SELECT * FROM film_category;

--creating the inventory table
CREATE TABLE inventory(
	inventory_id INT PRIMARY KEY,
	film_id INT,
	store_id INT,
	last_update TIMESTAMP
);

SELECT * FROM inventory;

COPY inventory FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\inventory.csv' DELIMITER ',' CSV HEADER;

--language table
CREATE TABLE language(
	language_id INT,
	name VARCHAR,
	last_update TIMESTAMP
);
COPY language FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\language.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM language;

--payment table
CREATE TABLE payment(
	payment_id INT PRIMARY KEY NOT NULL,
	customer_id INT NOT NULL,
	staff_id INT,
	rental_id INT,
	amount DECIMAL(5,2),
	payment_date TIMESTAMP
);
COPY payment FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\payment.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM payment;


--rental table
DROP TABLE IF EXISTS rental;
CREATE TABLE rental(
	rental_id INT PRIMARY KEY,
	rental_date TIMESTAMP,
	inventory_id INT,
	customer_id INT,
	return_date VARCHAR,
	staff_id INT,
	last_update TIMESTAMP,
	FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
	FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id)
);
COPY rental FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\rental.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM rental;

SELECT * FROM rental WHERE return_date is NULL;

UPDATE rental
SET return_date = NULL
WHERE return_date = 'NULL';

--changing the data type of return_date varchar to timestamp
ALTER TABLE rental ALTER COLUMN return_date SET DATA TYPE TIMESTAMP USING return_date::TIMESTAMP;

--staff table
CREATE TABLE staff(
	staff_id INT PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	address_id INT,
	email VARCHAR UNIQUE,
	store_id INT,
	active VARCHAR,
	username VARCHAR,
	password VARCHAR,
	last_update TIMESTAMP,
	picture VARCHAR
);
COPY staff FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\staff.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM staff;

--store table
CREATE TABLE store(
	store_id INT PRIMARY KEY,
	manager_staff_id INT,
	address_id INT,
	last_update TIMESTAMP
);
COPY store FROM 'C:\Users\sandr\Desktop\dvdrental\dvd rental\store.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM store;





