-- Step 1: Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

-- Step 2: Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Step 3: Insert data into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'India', 1390000000, 3287263),
(3, 'Canada', 38000000, 9984670),
(4, 'UK', 67000000, 243610),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Brazil', 213000000, 8515767),
(9, 'Japan', 125800000, 377975),
(10, 'Russia', 146000000, 17098246);

-- Step 4: Insert data into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 1000000, 4.5, 1, 'USA'),
(2, 'Alice', 'Smith', 2000000, 3.8, 2, 'India'),
(3, 'Bob', 'Brown', 1500000, 4.7, 3, 'Canada'),
(4, 'Charlie', 'Davis', 800000, 4.2, 4, 'UK'),
(5, 'Diana', 'Evans', 1200000, 4.1, 5, 'Australia'),
(6, 'Eva', 'Johnson', 950000, 3.9, 6, 'Germany'),
(7, 'Frank', 'Miller', 500000, 4.6, 7, 'France'),
(8, 'George', 'Wilson', 2500000, 3.5, 8, 'Brazil'),
(9, 'Hannah', 'Lee', 1700000, 4.8, 9, 'Japan'),
(10, 'Ivan', 'Martinez', 850000, 4.0, 10, 'Russia');

-- Queries:
-- 1. List the distinct country names from the Persons table
SELECT DISTINCT Country_name FROM Persons;

-- 2. Select first names and last names from the Persons table with aliases
SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

-- 3. Find all persons with a rating greater than 4.0
SELECT * FROM Persons WHERE Rating > 4.0;

-- 4. Find countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;

-- 5. Find persons who are from 'USA' or have a rating greater than 4.5
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

-- 6. Find all persons where the country name is NULL
SELECT * FROM Persons WHERE Country_name IS NULL;

-- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

-- 8. Find all persons not from the countries 'India' and 'Australia'
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

-- 9. Find all countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

-- 10. Find all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
