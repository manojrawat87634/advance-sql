create table students (
    id bigint primary key auto_increment,
    name varchar(50),
    email varchar(200) not null unique,
    index email_idx(email));

CREATE TABLE marks (
     id bigint PRIMARY KEY auto_increment,
     student_id bigint,
     test_id INT,
     marks INT,
     FOREIGN KEY (student_id) REFERENCES students(id),
     INDEX idx_student (student_id),
     INDEX idx_test (test_id),
     INDEX idx_marks (marks)
 );

INSERT INTO students (name, email) VALUES
('Rahul Sharma', 'rahul@gmail.com'),
('Amit Verma', 'amit@gmail.com'),
('Neha Singh', 'neha@gmail.com'),
('Priya Gupta', 'priya@gmail.com'),
('Karan Mehta', 'karan@gmail.com'),
('Anjali Roy', 'anjali@gmail.com');

INSERT INTO marks (student_id, test_id, marks) VALUES
-- Test 1
(1, 101, 78),
(2, 101, 85),
(3, 101, 91),
(4, 101, 76),
(5, 101, 88),
(6, 101, 82),

-- Test 2
(1, 102, 84),
(2, 102, 80),
(3, 102, 89),
(4, 102, 79),
(5, 102, 92),
(6, 102, 86);


-- Row Number
 SELECT
   *, 
    ROW_NUMBER() OVER (
        PARTITION BY m.test_id
        ORDER BY m.marks DESC
    ) as rank
FROM marks m 
JOIN students s ON s.id = m.student_id;


-- rank 
UPDATE marks 
SET marks = 85 
WHERE student_id = 5 AND test_id = 101;


/* 
E-COMMERCE: Top spending users per day
- Group data by each day
- Rank users based on amount spent (highest first)
- Used for daily leaderboards or offers
*/

/* 
FOOD DELIVERY: Top restaurants per city
- Group data by city
- Rank restaurants based on total orders
- Used to show trending/popular restaurants
*/

/* 
FINANCE APP: Largest transaction per account
- Group data by account
- Rank transactions based on amount
- Used for fraud detection or financial insights
*/

/* 
ATTENDANCE SYSTEM: Most regular students per batch
- Group data by batch
- Rank students based on attendance count
- Used for rewards or performance tracking
*/

/* 
GENERAL WINDOW FUNCTION LOGIC
- PARTITION BY → divides data into groups
- ORDER BY → sorts data inside each group
- RANK() → assigns ranking with ties (same value = same rank)
- Outer WHERE → used to filter top N results
*/