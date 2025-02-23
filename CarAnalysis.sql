-- 1. Cars Table (Stores car specifications)
CREATE TABLE Cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    mileage INT NOT NULL,
    engine_power INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    fuel_type VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample records into Cars table
INSERT INTO Cars (make, model, year, mileage, engine_power, price, fuel_type) VALUES
('Toyota', 'Camry', 2020, 15000, 203, 24000.00, 'Gasoline'),
('Honda', 'Civic', 2019, 20000, 158, 20000.00, 'Gasoline'),
('Ford', 'Mustang', 2021, 5000, 450, 55000.00, 'Gasoline'),
('Tesla', 'Model 3', 2021, 10000, 283, 45000.00, 'Electric'),
('Chevrolet', 'Bolt', 2020, 12000, 200, 37000.00, 'Electric');

-- 2. Users Table (Stores user information)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample records into Users table
INSERT INTO Users (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3'),
('user4', 'user4@example.com', 'password4'),
('user5', 'user5@example.com', 'password5');

-- 3. UserPreferences Table (Stores user preferences for car recommendations)
CREATE TABLE UserPreferences (
    preference_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    budget DECIMAL(10, 2) NOT NULL,
    preferred_make VARCHAR(50),
    preferred_model VARCHAR(50),
    preferred_fuel_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert sample records into UserPreferences table
INSERT INTO UserPreferences (user_id, budget, preferred_make, preferred_model, preferred_fuel_type) VALUES
(1, 25000.00, 'Toyota', 'Camry', 'Gasoline'),
(2, 30000.00, 'Honda', 'Civic', 'Gasoline'),
(3, 60000.00, 'Ford', 'Mustang', 'Gasoline'),
(4, 50000.00, 'Tesla', 'Model 3', 'Electric'),
(5, 40000.00, 'Chevrolet', 'Bolt', 'Electric');

-- 4. CarComparisons Table (Stores comparisons between cars)
CREATE TABLE CarComparisons (
    comparison_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id_1 INT,
    car_id_2 INT,
    performance_comparison TEXT,
    cost_comparison TEXT,
    feature_comparison TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (car_id_1) REFERENCES Cars(car_id),
    FOREIGN KEY (car_id_2) REFERENCES Cars(car_id)
);

-- Insert sample records into CarComparisons table
INSERT INTO CarComparisons (car_id_1, car_id_2, performance_comparison, cost_comparison, feature_comparison) VALUES
(1, 2, 'Camry has better engine power', 'Civic is more affordable', 'Both have similar features'),
(3, 4, 'Mustang has higher engine power', 'Model 3 is more expensive', 'Model 3 has advanced features'),
(4, 5, 'Model 3 has better performance', 'Bolt is more affordable', 'Both are electric vehicles');

-- 5. CarResalePredictions Table (Stores predicted resale values of cars)
CREATE TABLE CarResalePredictions (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    predicted_resale_value DECIMAL(10, 2) NOT NULL,
    prediction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

-- Insert sample records into CarResalePredictions table
INSERT INTO CarResalePredictions (car_id, predicted_resale_value) VALUES
(1, 20000.00),
(2, 17000.00),
(3, 50000.00),
(4, 40000.00),
(5, 35000.00);

-- 6. DataVisualization Table (Stores data for visualization purposes)
CREATE TABLE DataVisualization (
    visualization_id INT AUTO_INCREMENT PRIMARY KEY,
    car_id INT,
    visualization_type VARCHAR(50) NOT NULL,
    visualization_data TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);

-- Insert sample records into DataVisualization table
INSERT INTO DataVisualization (car_id, visualization_type, visualization_data) VALUES
(1, 'Price Trend', '...'), -- Visualization data would be binary or JSON, represented here as '...'
(2, 'Fuel Efficiency', '...'),
(3, 'Price Trend', '...'),
(4, 'Fuel Efficiency', '...'),
(5, 'Price Trend', '...');