CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE ecommerce_orders (
    Order_Date DATE,
    Time TIME,
    Aging INT NULL,
    Customer_Id INT,
    Gender VARCHAR(10),
    Device_Type VARCHAR(10),
    Customer_Login_type VARCHAR(20),
    Product_Category VARCHAR(50),
    Product VARCHAR(100),
    Sales INT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT,
    Shipping_Cost FLOAT,
    Order_Priority VARCHAR(20),
    Payment_method VARCHAR(20)
);


DROP TABLE IF EXISTS ecommerce_orders;

CREATE TABLE ecommerce_orders (
    Order_Date VARCHAR(20),   
    Time TIME,
    Aging INT NULL,
    Customer_Id INT,
    Gender VARCHAR(10),
    Device_Type VARCHAR(10),
    Customer_Login_type VARCHAR(20),
    Product_Category VARCHAR(50),
    Product VARCHAR(100),
    Sales INT,
    Quantity INT,
    Discount FLOAT,
    Profit FLOAT,
    Shipping_Cost FLOAT,
    Order_Priority VARCHAR(20),
    Payment_method VARCHAR(20)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/E-commerce Dataset.csv'
INTO TABLE ecommerce_orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

1. View Sample Data

SELECT * FROM ecommerce_orders LIMIT 10;

2. Filter by Gender

SELECT * FROM ecommerce_orders WHERE Gender = 'Male';

3. Average Shipping Cost by Gender (similar to SpendingScore example)

SELECT Gender, AVG(Shipping_Cost) AS AvgShippingCost
FROM ecommerce_orders
GROUP BY Gender;

4. Customers with Sales Above Average

SELECT * FROM ecommerce_orders
WHERE Sales > (
    SELECT AVG(Sales) FROM ecommerce_orders
);



