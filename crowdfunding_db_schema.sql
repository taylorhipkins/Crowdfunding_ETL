--before creating tables, a new schema was created titled 'crowdfunding_db_schema'. Each table was created
--under this schema instead of the public schema. 

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
