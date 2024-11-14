select * from country;
select * from persons;   

ALTER TABLE Persons ADD COLUMN DOB DATE;
UPDATE Persons SET DOB = '1990-01-15' WHERE id = 1;
UPDATE Persons SET DOB = '1985-06-22' WHERE id = 2;
UPDATE Persons SET DOB = '1992-03-10' WHERE id = 3;
UPDATE Persons SET DOB = '1988-11-30' WHERE id = 4;
UPDATE Persons SET DOB = '1995-07-19' WHERE id = 5;
UPDATE Persons SET DOB = '1983-09-08' WHERE id = 6;
UPDATE Persons SET DOB = '1991-05-27' WHERE id = 7;
UPDATE Persons SET DOB = '1989-04-14' WHERE id = 8;
UPDATE Persons SET DOB = '1994-02-25' WHERE id = 9;
UPDATE Persons SET DOB = '1987-12-05' WHERE id = 10;

#2  Write a user-defined function to calculate age using DOB
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN age;
END //

DELIMITER ;

#3 Write a select query to fetch the Age of all persons using the function that has been created.
SELECT id, DOB, CalculateAge(DOB) AS age FROM Persons;

#4. Find the length of each country name in the Country table.
SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;

#5. Extract the first three characters of each country's name in the Country table
SELECT Country_name, LEFT(Country_name, 3) AS First_Three_Chars
FROM Country;

#6Convert all country names to uppercase and lowercase in the Country table
SELECT Country_name, UPPER(Country_name) AS Country_Uppercase, LOWER(Country_name) AS Country_Lowercase
FROM Country;

