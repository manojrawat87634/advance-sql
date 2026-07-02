CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2)
);

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'Finance');


INSERT INTO employees (id, name, department_id, salary) VALUES
(1, 'Alice',   1, 120000),
(2, 'Bob',     1,  90000),
(3, 'Charlie', 1, 150000),
(4, 'David',   2,  70000),
(5, 'Eva',     2,  80000),
(6, 'Frank',   2,  60000),
(7, 'Grace',   3,  50000),
(8, 'Henry',   3,  45000),
(9, 'Ivy',     4, 110000),
(10,'Jack',    4, 100000);