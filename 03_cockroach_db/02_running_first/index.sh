



cockroach start-single-node --insecure --http-addr=localhost:8080
cockroach sql --insecure --host=localhost:26257

-- 1. Create a database to play in
CREATE DATABASE test_db;

-- 2. Switch into that database
USE test_db;

-- 3. Create a table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name STRING,
    grade INT
);

-- 4. Add some data
INSERT INTO students (id, name, grade) VALUES (1, 'Alex', 95), (2, 'Sam', 88);

-- 5. See your SQL table
SELECT * FROM students;