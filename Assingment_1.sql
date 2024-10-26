# 1. Create the database "School"
create database SCHOOL;
use SCHOOL;

# 2. Create the STUDENT Table
CREATE TABLE STUDENT (
    Roll_No INT ,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

# 3. Insert Data into the STUDENT Table

INSERT INTO STUDENT(Roll_No, Name, Marks, Grade) VALUES
(1, 'NABEEL', 85, 'A'),
(2, 'SHAMIL', 92, 'A'),
(3, 'SHAFIN', 76, 'B'),
(4, 'NABIL', 89, 'A');

# 4. Use the SELECT Command to Display the Table
SELECT * FROM STUDENT;




#5. Add a Column Named Contact to the STUDENT Table
ALTER TABLE STUDENT
ADD Contact VARCHAR(15);

#6.  Remove the Grade Column from the STUDENT Table
ALTER TABLE STUDENT
DROP COLUMN Grade;

#7. Rename the Table to CLASSTEN
ALTER TABLE STUDENT
RENAME TO CLASSTEN;

SELECT * FROM CLASSTEN;

#8.  Delete All Rows from the Table
TRUNCATE TABLE CLASSTEN;

#9. Remove the Table from the Database
DROP TABLE CLASSTEN;

#THE TABLE WERE DELETED...!
