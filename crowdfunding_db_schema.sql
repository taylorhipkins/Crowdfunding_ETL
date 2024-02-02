--before creating tables, a new schema was created titled 'crowdfunding_db_schema'. Each table was created
--under this schema instead of the public schema. 
--IMPORTANT--
--1. To run this code, create a new database titled crowdfunding_db in pg admin 4. 
--2. Within the crowdfunding_db database, make a new schema titled crowdfunding_db_schema. 
--3. Right click the crowdfunding_db_schema schema and select Query Tool. 
--4. In the query tool, run this code in the order that is shown below. If the tables are
----not created in this exact order, there will be errors. 
--5. When importing each csv file to the corresponding, you must import each file in the following order:
-----1. subcategory, 2. contacts, 3. category, 4. campaign. If this order is not followed, errors will occur.
-----PLEASE NOTE: each csv file is labeled to match the table that it should be imported to. 

CREATE TABLE crowdfunding_db_schema.contacts(
	contact_id INT PRIMARY KEY NOT NULL,
    email VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50)
);

SELECT * FROM crowdfunding_db_schema.contacts

CREATE TABLE crowdfunding_db_schema.category(
	category_id VARCHAR(4) PRIMARY KEY NOT NULL,
    category VARCHAR(20) NOT NULL
);

SELECT * FROM crowdfunding_db_schema.category

CREATE TABLE crowdfunding_db_schema.subcategory(
	subcategory_id VARCHAR(10) PRIMARY KEY NOT NULL,
    subcategory VARCHAR(20) NOT NULL
);

SELECT * FROM crowdfunding_db_schema.subcategory

CREATE TABLE crowdfunding_db_schema.campaign(
	cf_id INTEGER PRIMARY KEY NOT NULL,
    contact_id INTEGER NOT NULL,
	company_name VARCHAR(75),
	description VARCHAR(100),
	goal FLOAT NOT NULL,
	pledged FLOAT,
	outcome VARCHAR(15) NOT NULL,
	backers_count INTEGER,
	country VARCHAR(5) NOT NULL,
	currency VARCHAR(5) NOT NULL,
	launched_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(7) NOT NULL,
	subcategory_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES crowdfunding_db_schema.contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES crowdfunding_db_schema.category(category_id),
	FOREIGN KEY	(subcategory_id) REFERENCES crowdfunding_db_schema.subcategory(subcategory_id)
);

SELECT * FROM crowdfunding_db_schema.campaign
