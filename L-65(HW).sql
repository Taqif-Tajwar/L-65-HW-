-- 1. Create a product table with appropriate constraints
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0)
);

-- Populate the table with sample hardware data for testing
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Intel Core i7-13700K Processor', 'CPU', 419.99, 15),
('AMD Ryzen 5 7600X Processor', 'CPU', 229.00, 25),
('NVIDIA RTX 4070 Graphics Card', 'GPU', 599.99, 8),
('Logitech G PRO X Superlight Mouse', 'Peripherals', 159.99, 30),
('Corsair Vengeance 32GB DDR5 RAM', 'Memory', 115.50, 40),
('Samsung 990 PRO 2TB SSD', 'Storage', 169.99, 0), -- Out of stock example
('ASUS ROG Strix B650-A Motherboard', 'Motherboard', 239.99, 12);

-- 2. Filter products using conditions (e.g., in-stock items over $200)
SELECT * 
FROM products 
WHERE price > 200.00 AND stock_quantity > 0;

-- 3. Search product names with wildcard patterns (e.g., searching for "Ryzen" or any CPU)
SELECT * 
FROM products 
WHERE product_name LIKE '%Ryzen%' OR category = 'CPU';

-- 4. Find the lowest and highest prices using aggregate functions
SELECT 
    MIN(price) AS lowest_price, 
    MAX(price) AS highest_price 
FROM products;

-- 5. Update a product record (e.g., adjusting price and stock after a shipment restock)
UPDATE products 
SET price = 579.99, stock_quantity = 15
WHERE product_name = 'NVIDIA RTX 4070 Graphics Card';

-- 6. Delete a record safely using the primary key to avoid accidental bulk deletion
DELETE FROM products 
WHERE product_id = 6;
