select * from country;
select * from persons;

SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name;

SELECT Country_name, COUNT(*) AS Number_of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_of_Persons DESC;

SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

SELECT DISTINCT Country_name 
FROM Persons 
WHERE Rating = (
    SELECT Rating
    FROM Persons
    WHERE Country_name = 'USA'
);

SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50),
	Number_of_Customers INT
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country, Number_of_Customers)
VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', '1234567890', '123 Main St', 'New York', 'NY', '10001', 'USA',10),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '2345678901', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA',5),
(3, 'Rohith', 'Raj', 'rohithraj143.me@gmail.com', '8891570965', 'chiyyaram', 'Thrissur', 'KERALA', '680699', 'INDIA',4),
(4, 'Bob', 'Brown', 'bob.brown@gmail.com', '4567890123', '101 Pine St', 'Houston', 'California', '77001', 'USA',6),
(5, 'Charlie', 'Davis', 'charlie.davis@gmail.com', '5678901234', '202 Maple St', 'Phoenix', 'AZ', '85001', 'USA',12),
(6, 'Emily', 'Wilson', 'emily.wilson@gmail.com', '6789012345', '303 Cedar St', 'Philadelphia', 'PA', '19103', 'USA',100),
(7, 'Frank', 'Thomas', 'frank.thomas@gmail.com', '7890123456', '404 Birch St', 'San Diego', 'CA', '92101', 'USA',1400),
(8, 'Grace', 'Taylor', 'grace.taylor@gmail.com', '8901234567', '505 Spruce St', 'Dallas', 'TX', '75201', 'USA',28),
(9, 'Henry', 'Lee', 'henry.lee@gmail.com', '9012345678', '606 Ash St', 'San Francisco', 'CA', '94101', 'USA',32),
(10, 'Isabella', 'Moore', 'isabella.moore@gmail.com', '0123456789', '707 Willow St', 'Austin', 'TX', '73301', 'USA',1);


CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

UPDATE Customer
SET Phone_no = '9990023554'
WHERE State = 'California' AND Customer_id=4;
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 1;
SELECT * 
FROM Customer_details
WHERE state = 'California';

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Number_of_Customers
FROM Customer
GROUP BY State;

SELECT *
FROM Customer_details
ORDER BY State ASC;

