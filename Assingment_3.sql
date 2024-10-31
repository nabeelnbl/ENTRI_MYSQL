
#1. Creating the Managers Table
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age >= 18),  -- Check constraint only on Age
    Last_update TIMESTAMP,      -- No constraint here
    Gender CHAR(1),             -- No constraint here
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

#2. Inserting 10 Rows into Managers Table
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary) VALUES
(1, 'John', 'Doe', '1980-01-15', 44, CURRENT_TIMESTAMP, 'M', 'IT', 30000),
(2, 'Aaliya', 'Singh', '1985-02-20', 39, CURRENT_TIMESTAMP, 'F', 'Finance', 35000),
(3, 'Mark', 'Taylor', '1978-05-10', 46, CURRENT_TIMESTAMP, 'M', 'HR', 27000),
(4, 'Emily', 'Clark', '1990-09-25', 34, CURRENT_TIMESTAMP, 'F', 'Marketing', 22000),
(5, 'James', 'Brown', '1982-03-30', 42, CURRENT_TIMESTAMP, 'M', 'IT', 40000),
(6, 'Olivia', 'Williams', '1989-07-15', 35, CURRENT_TIMESTAMP, 'F', 'Finance', 32000),
(7, 'Michael', 'Smith', '1975-11-05', 49, CURRENT_TIMESTAMP, 'M', 'IT', 28000),
(8, 'Sophia', 'Johnson', '1988-06-22', 36, CURRENT_TIMESTAMP, 'F', 'HR', 29000),
(9, 'David', 'Lee', '1977-04-19', 47, CURRENT_TIMESTAMP, 'M', 'Marketing', 26000),
(10, 'Emma', 'Jones', '1992-12-01', 32, CURRENT_TIMESTAMP, 'F', 'IT', 34000);

SELECT * FROM managers;

#3. Query to Retrieve Name and Date of Birth of the Manager with Manager_Id 1
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;

#4. Query to Display Annual Income of All Managers
SELECT First_name, Last_Name, Salary * 12 AS Annual_Income FROM Managers;

#5. Query to Display Records of All Managers Except 'Aaliya'
SELECT *
FROM Managers
WHERE First_name != 'Aaliya';

#6. Query to Display Details of Managers Whose Department is IT and Earn More Than 25000 per Month
-- SELECT first_name,Last_name from managers where department = "it" and salary > 25000;
SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

#7. Query to Display Details of Managers Whose Salary is Between 10000 and 35000
SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;


