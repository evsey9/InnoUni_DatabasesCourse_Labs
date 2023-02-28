-- Create normalized table

CREATE TABLE customers
	(
	customerId INT,
	customerName VARCHAR(15),
	city VARCHAR(15),
	PRIMARY KEY (customerId)
	);

CREATE TABLE items
	(
	itemId INT,
	itemName VARCHAR(15),
	price REAL,
	PRIMARY KEY (itemId)
	);

CREATE TABLE customerOrders
	(orderId INT,
	customerId INT references customers(customerId),
	date DATE,
	PRIMARY KEY (orderId)
	);

CREATE TABLE itemOrders
	(orderId INT references customerOrders(orderId),
	itemId INT references items(itemId),
	quantity INT,
	PRIMARY KEY (orderId, itemId)
	);


-- Insert data

INSERT INTO customers SELECT customerId, customerName, city FROM orders GROUP BY customerId, customerName, city;

INSERT INTO items SELECT itemId, itemName, price FROM orders GROUP BY itemId, itemName, price;

INSERT INTO itemOrders SELECT orderId, itemId, quantity FROM orders GROUP BY orderId, itemId, quantity;

INSERT INTO customerOrders SELECT orderId, customerId, date FROM orders GROUP BY orderId, customerId, date;

-- Do the exercise queries

-- First query
SELECT orderId, SUM(quantity * price) as "total_cost", SUM(quantity) as "total_items" 
FROM itemOrders 
JOIN items ON itemOrders.itemId=items.itemId
GROUP BY orderId;

-- Second query
SELECT * FROM (
SELECT itemOrders.orderId, SUM(quantity * price) AS our_sum, customerOrders.customerId, customers.customerName 
FROM itemOrders 
JOIN items ON itemOrders.itemId=items.itemId
JOIN customerOrders ON itemOrders.orderId=customerOrders.orderId
JOIN customers ON customerOrders.customerId=customers.customerId
GROUP BY itemOrders.orderId, customerOrders.customerId, customers.customerName
) joined
ORDER BY our_sum DESC
LIMIT 1
