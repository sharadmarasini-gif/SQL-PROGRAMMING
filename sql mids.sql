DROP TABLE IF EXISTS Works_On;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
USE TechSolutionsDb;

CREATE TABLE Department (
    deptID INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE Employee (
    empID INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    salary DECIMAL(10,2),
    hire_date DATE,
    deptID INT,
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

CREATE TABLE Project (
    projectID INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    deptID INT,
    FOREIGN KEY (deptID) REFERENCES Department(deptID)
);

CREATE TABLE Works_On (
    empID INT,
    projectID INT,
    hours_worked INT,
    PRIMARY KEY (empID, projectID),
    FOREIGN KEY (empID) REFERENCES Employee(empID),
    FOREIGN KEY (projectID) REFERENCES Project(projectID)
);
INSERT INTO Department (deptID, dept_name, location) VALUES
(1, 'IT', 'Kathmandu'),
(2, 'HR', 'Pokhara'),
(3, 'Finance', 'Lalitpur'),
(4, 'Marketing', 'Bhaktapur'),
(5, 'Research', 'Kathmandu');

INSERT INTO Employee (empID, first_name, last_name, gender, salary, hire_date, deptID) VALUES
(101, 'Ram', 'Shrestha', 'M', 50000, '2023-01-10', 1),
(102, 'Sita', 'Adhikari', 'F', 55000, '2023-02-15', 2),
(103, 'Hari', 'Thapa', 'M', 60000, '2023-03-20', 3),
(104, 'Maya', 'Koirala', 'F', 58000, '2023-04-05', 1),
(105, 'Ramesh', 'Gurung', 'M', 62000, '2023-05-12', 4);

INSERT INTO Project (projectID, project_name, start_date, end_date, deptID) VALUES
(1, 'Website Development', '2023-01-15', '2023-03-15', 1),
(2, 'Recruitment System', '2023-02-01', '2023-04-01', 2),
(3, 'Finance Audit', '2023-03-05', '2023-05-05', 3),
(4, 'Marketing Campaign', '2023-04-10', '2023-06-10', 4),
(5, 'AI Research', '2023-05-01', '2023-07-01', 5);

UPDATE Employee
SET salary = salary * 1.10
WHERE empID = 102;

SELECT *
FROM Employee
WHERE Salary > 50000;
-----------
SELECT d.dept_name, COUNT(e.empID) AS total_employees
FROM Employee e
JOIN Department d ON e.deptID = d.deptID
GROUP BY d.dept_name;
------------




-------------
SELECT empID, first_name, last_name, hire_date
FROM Employee
WHERE hire_date > '2022-01-01';
-----------


---------------
SELECT e.first_name, e.last_name, d.dept_name
FROM Employee e
JOIN Department d ON e.deptID = d.deptID;
--------------



INSERT INTO Works_On (empID, projectID, hours_worked) VALUES
(101, 1, 120),
(102, 2, 100),
(103, 3, 150),
(104, 1, 80),
(105, 4, 90);

SELECT e.first_name, e.last_name, p.project_name, w.hours_worked
FROM Works_On w
JOIN Employee e ON w.empID = e.empID
JOIN Project p ON w.projectID = p.projectID;



SELECT 
    p.project_name,
    SUM(w.hours_worked) AS total_hours
FROM Works_On w
JOIN Project p ON w.projectID = p.projectID
GROUP BY p.project_name;





