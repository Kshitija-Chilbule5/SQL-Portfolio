-- Tea Shops Table
CREATE TABLE Tea_Shops (
    shop_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    country VARCHAR(50) NOT NULL
);

INSERT INTO Tea_Shops (shop_id, shop_name, city, state, country) VALUES
(1, 'Chaichology', 'Mumbai', 'Maharashtra', 'India'),
(2, 'Chaichology', 'Delhi', 'Delhi', 'India'),
(3, 'Chaichology', 'Bangalore', 'Karnataka', 'India'),
(4, 'Chaichology', 'Chennai', 'Tamil Nadu', 'India');

-- Menu Items Table
CREATE TABLE Menu_Items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category ENUM('Tea', 'Snack', 'Dessert') NOT NULL,
    price DECIMAL(5,2) NOT NULL,
    available BOOLEAN DEFAULT TRUE
);

INSERT INTO Menu_Items (item_id, item_name, category, price, available) VALUES
(1, 'Masala Chai', 'Tea', 30.00, TRUE),
(2, 'Ginger Tea', 'Tea', 35.00, TRUE),
(3, 'Samosa', 'Snack', 20.00, TRUE),
(4, 'Bun Maska', 'Snack', 25.00, TRUE),
(5, 'Gulab Jamun', 'Dessert', 40.00, TRUE),
(6, 'Kulhad Chai', 'Tea', 50.00, TRUE);


-- Sales Table
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_id INT,
    item_id INT,
    quantity INT NOT NULL,
    transaction_date DATE NOT NULL,
    FOREIGN KEY (shop_id) REFERENCES Tea_Shops(shop_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);

INSERT INTO Sales (shop_id, item_id, quantity, transaction_date) VALUES
(1, 1, 10, '2025-03-01'),
(1, 2, 5, '2025-03-02'),
(2, 3, 12, '2025-03-02'),
(3, 4, 6, '2025-03-03'),
(4, 5, 8, '2025-03-04'),
(1, 6, 15, '2025-03-05'),
(3, 2, 7, '2025-03-05'),
(2, 4, 10, '2025-03-06'),
(4, 3, 9, '2025-03-07'),
(1, 5, 6, '2025-03-08');

-- Ratings Table
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    shop_id INT,
    customer_name VARCHAR(100),
    rating DECIMAL(2,1) CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    FOREIGN KEY (shop_id) REFERENCES Tea_Shops(shop_id)
);

INSERT INTO Ratings (shop_id, customer_name, rating, review) VALUES
(1, 'Amit Sharma', 4.5, 'Great chai, loved the flavors!'),
(1, 'Sneha Patel', 4.8, 'Excellent service and cozy ambiance.'),
(2, 'Rahul Verma', 4.2, 'Nice variety of tea and snacks.'),
(3, 'Priya Singh', 4.6, 'Loved the Bun Maska with chai.'),
(4, 'Kunal Das', 4.9, 'Best Masala Chai in town!'),
(4, 'Anjali Mehta', 4.3, 'Samosas were crispy and delicious.'),
(3, 'Rohan Joshi', 4.7, 'Kulhad Chai was amazing!'),
(2, 'Pooja Nair', 4.5, 'Great place to relax with friends.'),
(1, 'Aditya Kapoor', 4.1, 'Nice selection, but a bit pricey.'),
(3, 'Vikram Reddy', 4.4, 'Friendly staff and great ambiance.'),
(4, 'Sanya Malhotra', 4.5, 'Best tea experience so far.'),
(2, 'Manoj Kumar', 4.7, 'Authentic and refreshing tea options.'),
(1, 'Rajesh Iyer', 4.2, 'Quick service and good snacks.'),
(3, 'Neha Thakur', 4.6, 'Kulhad Chai had a unique taste.'),
(4, 'Arjun Mishra', 4.3, 'Samosas were a bit oily, but tasty.'),
(1, 'Divya Sharma', 4.9, 'Loved the Ginger Tea!'),
(2, 'Vishal Gupta', 4.0, 'Decent selection, could improve seating.'),
(3, 'Meera Kapoor', 4.8, 'Gulab Jamun was heavenly!'),
(4, 'Tarun Saxena', 4.6, 'Nice tea shop, good vibes.'),
(1, 'Simran Kaur', 4.7, 'Perfect for evening tea breaks.');	