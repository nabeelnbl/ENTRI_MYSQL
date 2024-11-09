-- Step 1: Creating the Country table
CREATE TABLE Country_2 (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

-- Step 2: Creating the Persons table
CREATE TABLE Persons_2 (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Step 3: Inserting 10 rows into the Country table
INSERT INTO Country_2 (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'India', 1380000000, 3287263),
(3, 'China', 1441000000, 9596961),
(4, 'Brazil', 213000000, 8515767),
(5, 'Nigeria', 206000000, 923768),
(6, 'Russia', 146000000, 17098242),
(7, 'Japan', 125800000, 377975),
(8, 'Germany', 83100000, 357022),
(9, 'UK', 67200000, 243610),
(10, 'France', 65200000, 551695);

-- Step 4: Inserting 10 rows into the Persons table
INSERT INTO Persons_2 (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 3000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 2500000, 4.7, 2, 'India'),
(3, 'Li', 'Wang', 3500000, 4.2, 3, 'China'),
(4, 'Carlos', 'Silva', 1500000, 3.9, 4, 'Brazil'),
(5, 'Amina', 'Garba', 2000000, 4.0, 5, 'Nigeria'),
(6, 'Yuri', 'Ivanov', 1200000, 3.8, 6, 'Russia'),
(7, 'Takumi', 'Matsuo', 1600000, 4.1, 7, 'Japan'),
(8, 'Hans', 'Müller', 1300000, 4.6, 8, 'Germany'),
(9, 'Emily', 'Clark', 1100000, 4.3, 9, 'UK'),
(10, 'Pierre', 'Dubois', 1400000, 4.4, 10, 'France');

select * from country_2;
select * from persons_2;

-- Queries

-- 1. Print the first three characters of Country_name from the Country table.
SELECT LEFT(Country_name, 3) AS Country_prefix FROM Country_2;

-- 2. Concatenate first name and last name from Persons table.
SELECT CONCAT(Fname, ' ', Lname) AS Full_Name FROM Persons_2;

-- 3. Count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT Country_name) AS Unique_Country_Count FROM Persons_2;

-- 4. Print the maximum population from the Country table.
SELECT MAX(Population) AS Max_Population FROM Country_2;

-- 5. Print the minimum population from Persons table.
SELECT MIN(Population) AS Min_Population FROM Persons_2;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL.
INSERT INTO Persons_2 (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(11, 'Alex', NULL, 800000, 3.5, 1, 'USA'),
(12, 'Ravi', NULL, 900000, 3.6, 2, 'India');

-- Then count non-NULL Lname entries.
SELECT COUNT(Lname) AS Count_Lname FROM Persons_2;

-- 7. Find the number of rows in the Persons table.
SELECT COUNT(*) AS Row_Count FROM Persons_2;

-- 8. Show the population of the Country table for the first 3 rows.
SELECT Population FROM Country_2 LIMIT 3;

-- 9. Print 3 random rows of countries.
SELECT * FROM Country_2 ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order.
SELECT * FROM Persons_2persons ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table.
SELECT Country_name, SUM(Population) AS Total_Population
FROM Persons_2
GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000.
SELECT Country_name
FROM Persons_2
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 13. List the total number of persons and average rating for each country,
--     only for countries with more than 2 persons, ordered by average rating in ascending order.
SELECT Country_name, COUNT(Id) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons_2
GROUP BY Country_name
HAVING COUNT(Id) > 2
ORDER BY Avg_Rating ASC;
