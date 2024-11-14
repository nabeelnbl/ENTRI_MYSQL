select * from country;
select * from persons; 

#remove the unnecessary coloumn named country in persons table 
-- ALTER TABLE persons DROP COLUMN Country_name;
-- ALTER TABLE persons ADD COLUMN country_name VARCHAR(100);
-- UPDATE persons SET country_name = 'USA' WHERE id = 1;
-- UPDATE persons SET country_name = 'Canada' WHERE id = 2;
-- UPDATE persons SET country_name = 'UK' WHERE id = 3;
-- UPDATE persons SET country_name = 'Australia' WHERE id = 4;
-- UPDATE persons SET country_name = 'India' WHERE id = 5;		
-- UPDATE persons SET country_name = 'Germany' WHERE id = 6;
-- UPDATE persons SET country_name = 'France' WHERE id = 7;
-- UPDATE persons SET country_name = 'Japan' WHERE id = 8;
-- UPDATE persons SET country_name = 'China' WHERE id = 9;
-- UPDATE persons SET country_name = 'Brazil' WHERE id = 10;



# 1 INNER JOINTS
SELECT 
    Persons.Id AS Person_Id,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS Person_Population,
    Persons.Rating,
    Country.Country_name,
    Country.Population AS Country_Population,
    Country.Area
FROM 
    Persons
INNER JOIN 
    Country ON Persons.Country_Id = Country.Id;
    
    
#left join
SELECT 
    Persons.Id AS Person_Id,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS Person_Population,
    Persons.Rating,
    Country.Country_name,
    Country.Population AS Country_Population,
    Country.Area
FROM 
    Persons
LEFT JOIN 
    Country ON Persons.Country_Id = Country.Id;    
    
#right join
SELECT 
    Persons.Id AS Person_Id,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS Person_Population,
    Persons.Rating,
    Country.Country_name,
    Country.Population AS Country_Population,
    Country.Area
FROM 
    Persons
RIGHT JOIN 
    Country ON Persons.Country_Id = Country.Id;     
    
    
# 2 List all distinct country names from both the Country and Persons tables    

SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT country_name AS Country_name FROM Persons;
 # 3 List all country names from both the Country and Persons tables, including duplicate

 SELECT DISTINCT Country_name FROM Country
UNION ALL
SELECT DISTINCT country_name AS Country_name FROM Persons;


# 4 Round the ratings of all persons to the nearest integer in the Persons table.
SELECT 
    Id,
    Fname,
    Lname,
    Population,
    ROUND(Rating) AS Rounded_Rating,
    Country_Id 
    FROM 
    Persons;



