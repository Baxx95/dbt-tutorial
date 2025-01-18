
CREATE DATABASE IF NOT EXISTS raw_data;
USE raw_data;


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    shipping_address VARCHAR(255),
    status ENUM('pending', 'completed', 'shipped', 'cancelled') NOT NULL,
    payment_method ENUM('credit_card', 'paypal', 'bank_transfer') NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO orders (customer_id, order_date, shipping_address, status, payment_method, total_amount)
VALUES
    (1, '2024-12-01', '123 Main St, Cityville', 'completed', 'credit_card', 120.50),
    (2, '2024-12-02', '456 Elm St, Townsville', 'shipped', 'paypal', 85.75),
    (3, '2024-12-03', '789 Oak St, Villageton', 'pending', 'bank_transfer', 45.00),
    (1, '2024-12-04', '123 Main St, Cityville', 'completed', 'credit_card', 99.99),
    (4, '2024-12-05', '321 Pine St, Hamlet', 'cancelled', 'paypal', 0.00),
    (5, '2024-12-06', '654 Maple St, Metropolis', 'shipped', 'credit_card', 250.00),
    (6, '2024-12-07', '987 Birch St, Citystate', 'completed', 'bank_transfer', 300.00),
    (2, '2024-12-08', '456 Elm St, Townsville', 'pending', 'paypal', 75.00),
    (3, '2024-12-09', '789 Oak St, Villageton', 'shipped', 'credit_card', 150.00),
    (7, '2024-12-10', '159 Cedar St, Uptown', 'completed', 'credit_card', 500.00),
    (8, '2024-12-11', '753 Walnut St, Downtown', 'completed', 'paypal', 120.00),
    (9, '2024-12-12', '852 Chestnut St, Midtown', 'completed', 'bank_transfer', 80.00),
    (10, '2024-12-13', '951 Spruce St, Suburbia', 'shipped', 'credit_card', 200.00),
    (1, '2024-12-14', '123 Main St, Cityville', 'pending', 'paypal', 45.50),
    (11, '2024-12-15', '111 Redwood St, Rural', 'completed', 'bank_transfer', 99.00),
    (12, '2024-12-16', '222 Sequoia St, Urban', 'shipped', 'credit_card', 150.75),
    (13, '2024-12-17', '333 Cypress St, Cosmopolis', 'completed', 'paypal', 60.00),
    (14, '2024-12-18', '444 Palm St, Coastline', 'pending', 'bank_transfer', 30.00),
    (15, '2024-12-19', '555 Fir St, Highlands', 'cancelled', 'credit_card', 0.00),
    (16, '2024-12-20', '666 Ash St, Lowlands', 'completed', 'paypal', 400.00);



CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    country_code CHAR(2), -- Nouvelle colonne ajoutée
    phone_number VARCHAR(20), -- Colonne ajoutée directement
    registration_date DATE, -- Colonne ajoutée directement
    created_at DATETIME NOT NULL,
    updated_at DATETIME DEFAULT NULL
);

INSERT INTO customers (first_name, last_name, email, country_code, phone_number, registration_date, created_at, updated_at)
VALUES
    ('Alice', 'Smith', 'alice.smith@example.com', 'US', '+1-555-1234', '2022-01-01', '2023-01-15 08:00:00', '2023-01-16 10:00:00'),
    ('Bob', 'Johnson', 'bob.johnson@example.com', 'CA', '+1-555-5678', '2022-02-01', '2023-02-20 09:30:00', '2023-02-21 11:30:00'),
    ('Charlie', 'Brown', 'charlie.brown@example.com', 'FR', '+33-1-2345-6789', '2022-03-01', '2023-03-12 12:00:00', NULL),
    ('Diana', 'Prince', 'diana.prince@example.com', 'GB', '+44-20-7946-0958', '2022-04-01', '2023-04-05 15:45:00', NULL),
    ('Ethan', 'Hunt', 'ethan.hunt@example.com', 'US', '+1-555-8765', '2022-05-01', '2023-05-01 10:20:00', '2023-05-02 12:00:00'),
    ('Fiona', 'Apple', 'fiona.apple@example.com', 'AU', '+61-2-9876-5432', '2022-06-01', '2023-06-18 13:00:00', NULL),
    ('George', 'Martin', 'george.martin@example.com', 'GB', '+44-20-7946-0959', '2022-07-01', '2023-07-25 09:00:00', '2023-07-26 11:00:00'),
    ('Hannah', 'Montana', 'hannah.montana@example.com', 'US', '+1-555-4321', '2022-08-01', '2023-08-10 11:15:00', NULL),
    ('Ivan', 'Drago', 'ivan.drago@example.com', 'RU', '+7-495-123-4567', '2022-09-01', '2023-09-05 14:30:00', NULL),
    ('Jane', 'Doe', 'jane.doe@example.com', 'FR', '+33-1-6789-4321', '2022-10-01', '2023-10-15 17:00:00', '2023-10-16 09:00:00'),
    ('Kevin', 'Hart', 'kevin.hart@example.com', 'US', '+1-555-3456', '2022-11-01', '2023-11-20 08:00:00', '2023-11-21 08:30:00'),
    ('Laura', 'Croft', 'laura.croft@example.com', 'GB', '+44-20-1234-5678', '2022-12-01', '2023-12-01 13:45:00', NULL),
    ('Michael', 'Scott', 'michael.scott@example.com', 'US', '+1-555-6789', '2023-01-01', '2023-12-25 18:00:00', '2023-12-26 19:00:00'),
    ('Nina', 'Williams', 'nina.williams@example.com', 'AU', '+61-2-8765-4321', '2023-02-01', '2023-12-30 20:30:00', NULL),
    ('Oscar', 'Wilde', 'oscar.wilde@example.com', 'IE', '+353-1-2345-678', '2023-03-01', '2024-01-03 09:00:00', NULL),
    ('Paul', 'Walker', 'paul.walker@example.com', 'US', '+1-555-8765', '2023-04-01', '2024-01-15 10:00:00', '2024-01-16 11:00:00'),
    ('Quinn', 'Fabray', 'quinn.fabray@example.com', 'FR', '+33-1-3456-7890', '2023-05-01', '2024-02-01 08:30:00', NULL),
    ('Rachel', 'Green', 'rachel.green@example.com', 'GB', '+44-20-9876-5432', '2023-06-01', '2024-02-18 12:15:00', NULL),
    ('Steve', 'Rogers', 'steve.rogers@example.com', 'US', '+1-555-6543', '2023-07-01', '2024-03-05 15:00:00', NULL),
    ('Tony', 'Stark', 'tony.stark@example.com', 'US', '+1-555-3210', '2023-08-01', '2024-03-20 18:45:00', '2024-03-21 19:00:00');
