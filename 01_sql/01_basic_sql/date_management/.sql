CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    dob DATE,
    email VARCHAR(100)
);

INSERT INTO students (name, age, dob, email)
VALUES
    ('John Doe', 20, '2006-05-15', 'john.doe@example.com'),
    ('Jane Smith', 22, '2004-09-30', 'jane.smith@example.com'),
    ('Alice Brown', 21, '2005-02-25', 'alice.brown@example.com'),
    ('Bob Johnson', 23, '2003-11-12', 'bob.johnson@example.com'),
    ('Charlie Lee', 19, '2007-01-10', 'charlie.lee@example.com');

CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,      -- Auto-increment for unique attendance record
    student_id INT,                         -- Foreign key to reference the student
    attendance_date DATE,                   -- Date of attendance
    status ENUM('Present', 'Absent', 'Late') NOT NULL, -- Attendance status
    FOREIGN KEY (student_id) REFERENCES students(id) -- Foreign key constraint
);
