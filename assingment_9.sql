CREATE TABLE Worker (
    Worker_Id INT NOT NULL PRIMARY KEY,
    FirstName CHAR(25) NOT NULL,
    LastName CHAR(25) NOT NULL,
    Salary INT NOT NULL,
    JoiningDate DATETIME NOT NULL,
    Department CHAR(25) NOT NULL
);
select * from worker;
-- SELECT Salary
-- FROM Worker
-- WHERE Worker_Id = 101;


# 1.stored procedure to add a new record to the Worker table and invoke the procedure call.
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_WorkerId INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_WorkerId, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

-- Procedure call example
CALL AddWorker(101, 'John', 'Doe', 50000, '2024-11-26 10:00:00', 'HR');
CALL AddWorker(102, 'Jony', 'mew', 2000, '2024-11-26 10:00:00', 'finance');
#---------------------------------------------------------
# 2. Write a stored procedure to retrieve the salary of a worker by their Worker_ID.

DELIMITER $$

CREATE PROCEDURE GetSalaryByWorkerId(
    IN p_WorkerId INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_WorkerId;
END $$

DELIMITER ;

CALL GetSalaryByWorkerId(101, @salary);
SELECT @salary;
#-------------------------------------------------


# 3 Create a stored procedure to update the department of a worker by their Worker_ID.

DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_WorkerId INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_WorkerId;
END $$

DELIMITER ;


CALL UpdateWorkerDepartment(101, 'Finance');

#--------------------------------------------------------------------------------

#4: Write a stored procedure to retrieve the number of workers in a given department
DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;


CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount;
#-------------------------------------------------------------------------

 #5: Write a stored procedure to calculate the average salary of workers in a given department.
 
 DELIMITER $$

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary DECIMAL(15,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM Worker
    WHERE Department = p_Department;
END $$

DELIMITER ;


CALL GetAvgSalaryByDepartment('finance', @avgSalary);
SELECT @avgSalary;
