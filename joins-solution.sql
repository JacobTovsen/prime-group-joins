-- 1. Get all customers and their addresses.
SELECT addresses.street, addresses.city, addresses.state, addresses.zip, customers.first_name, customers.last_name from addresses
JOIN customers ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM line_items
JOIN orders ON orders.id = line_items.order_id
JOIN products ON products.id = line_items.product_id;

-- 3. Which warehouses have cheetos?
SELECT warehouse FROM warehouse_product
JOIN warehouse on warehouse.id = warehouse_product.warehouse_id
JOIN products on products.id = warehouse_product.product_id
WHERE products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT warehouse FROM warehouse_product
JOIN warehouse on warehouse.id = warehouse_product.warehouse_id
JOIN products on products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers, COUNT(*) FROM orders
JOIN addresses ON addresses.id = orders.address_id
JOIN customers ON addresses.customer_id = customers.id
GROUP BY customers;

-- 6. How many customers do we have?
SELECT COUNT(*) FROM customers;

-- 7. How many products do we carry?
SELECT COUNT(*) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';
