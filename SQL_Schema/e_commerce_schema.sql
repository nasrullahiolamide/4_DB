-- Schema for a e-commerce website.
-- DB project from @Bahdcoder Python Backend Engineer

-- Create Products Table
CREATE TABLE IF NOT EXISTS products (
	id INT PRIMARY KEY,
	sku VARCHAR(40),
	name VARCHAR(50),
	price INT,
	weight FLOAT,
	desciptions VARCHAR(100),
	thumbnail BLOB,
	image VARCHAR(200),
	category VARCHAR(40),
	create_date DATE,
	stock INT	
);

/* --Create options table */
CREATE TABLE IF NOT EXISTS options(
	id INT PRIMARY KEY,
	option_name VARCHAR(35)
);

/* --create product option */
CREATE TABLE IF NOT EXISTS product_option(
	id INT PRIMARY KEY,
	option_id INT,
	product_id INT,
	FOREIGN KEY(option_id) REFERENCES options(id) ON DELETE SET NULL,
	FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
);

/* --create Categories table */
CREATE TABLE IF NOT EXISTS categories(
	id INT PRIMARY KEY,
	name VARCHAR(30),
	decsription VARCHAR(100),
	thumbnail BLOB
);


/* -- create product_categories table */
CREATE TABLE IF NOT EXISTS product_categories(
	id INT PRIMARY KEY,
	product_id INT,
	category_id INT,
	FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE,
	FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
);


/* -- create customers table */
CREATE TABLE IF NOT EXISTS customers(
	id INT PRIMARY KEY,
	email VARCHAR(50),
	password VARCHAR(15),
	full_name VARCHAR(50),
	billing_address VARCHAR(150),
	default_shipping_address VARCHAR(150),
	country VARCHAR(40),
	phone INT
);


/* --create orders table */
CREATE TABLE IF NOT EXISTS orders(
	id INT PRIMARY KEY,
	customer_id INT,
	amount INT,
	shipping_address VARCHAR(150),
	order_address VARCHAR(150),
	order_email VARCHAR(50),
	order_date DATE,
	order_status VARCHAR(10),
	FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

/* --create order_details table */
CREATE TABLE IF NOT EXISTS order_details(
	id INT PRIMARY KEY,
	order_id INT,
	product_id INT,
	price INT,
	sku VARCHAR(40),
	quantity INT,
	FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE,
	FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE CASCADE
);
