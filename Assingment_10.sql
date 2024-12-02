-- Create the teachers table
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,  -- Experience in years
    salary DECIMAL(10, 2) -- Salary in monetary format
);

-- Insert 8 rows into the teachers table
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES
(1, 'Alice Johnson', 'Mathematics', 10, 60000.00),
(2, 'Brian Carter', 'Physics', 8, 55000.00),
(3, 'Catherine Lee', 'Chemistry', 12, 62000.00),
(4, 'Daniel Kim', 'Biology', 5, 50000.00),
(5, 'Eva Smith', 'English', 15, 70000.00),
(6, 'Franklin White', 'History', 7, 53000.00),
(7, 'Grace Park', 'Computer Science', 9, 58000.00),
(8, 'Henry Davis', 'Physical Education', 6, 48000.00);

-- Query to verify data
SELECT * FROM teachers;


DELIMITER $$

-- Create the BEFORE INSERT trigger
CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    -- Check if the salary is less than zero
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;

-- Test Case 1: Valid salary
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (11, 'Ivy Brown', 'Geography', 4, 45000.00);

-- Test Case 2: Invalid salary (negative value)
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (10, 'Jack Green', 'Art', 3, -1000.00);


-- Create the teacher_log table
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    action VARCHAR(50),
    log_timestamp DATETIME
);
DELIMITER //

-- Create the AFTER INSERT trigger
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    -- Insert a log entry into the teacher_log table
    INSERT INTO teacher_log (teacher_id, action, log_timestamp)
    VALUES (NEW.id, 'NEW ENTRY', NOW());
END;
//

DELIMITER ;

-- Insert a new teacher into the teachers table
INSERT INTO teachers (id, name, subject, experience, salary)
VALUES (13, 'Liam Wright', 'Economics', 6, 52000.00);

-- Verify the log entry
SELECT * FROM teacher_log;


DELIMITER $$
CREATE TRIGGER  before_delete_teachers
before delete on teachers
FOR EACH ROW
BEGIN
if old.experience >10 then 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'cannot delet';
END IF;
END$$

DELIMITER ;       

-- Test Case 1: Attempt to delete a row with experience <= 10
DELETE FROM teachers WHERE id = 4;

-- Test Case 2: Attempt to delete a row with experience > 10
DELETE FROM teachers WHERE id = 3;
DELIMITER $$
DELIMITER //

-- Create the AFTER DELETE trigger
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    -- Insert a log entry into the teacher_log table
    INSERT INTO teacher_log (teacher_id, action, log_timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;
//

DELIMITER ;

-- Delete a teacher with id = 4
DELETE FROM teachers WHERE id = 6;
-- Query the teacher_log table to verify the log entry
SELECT * FROM teacher_log;

