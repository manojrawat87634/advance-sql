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
    s.name,
    m.test_id,
    m.marks,
    LAG(m.marks) OVER (
        PARTITION BY m.student_id
        ORDER BY m.test_id
    ) AS prev_marks
FROM marks m
JOIN students s ON s.id = m.student_id;

-- rank 
UPDATE marks 
SET marks = 85 
WHERE student_id = 5 AND test_id = 101;


/*
ROW_NUMBER()
- Assigns unique rank even if values are same
- Used when strict ordering is needed
- Example: Showing top 10 latest orders, pagination, unique leaderboard positions
*/


/*
RANK()
- Same values get same rank, but next rank is skipped
- Used when fairness matters but gaps are acceptable
- Example: Sports rankings, competition results, sales leaderboard with ties
*/


/*
DENSE_RANK()
- Same values get same rank, no gaps
- Used when you want continuous ranking
- Example: Product ranking, employee performance tiers, category rankings
*/


/*
PERCENT_RANK()
- Gives relative position between 0 and 1
- Used to understand distribution or percentile
- Example: Top 10% customers, salary distribution, performance benchmarking
*/


/*
LAG()
- Access previous row value
- Used for comparison with past data
- Example: Previous day sales, last transaction amount, price change tracking
*/


/*
LEAD()
- Access next row value
- Used for forward comparison
- Example: Next scheduled event, upcoming price, next status change
*/


/*
FIRST_VALUE()
- Gets first value in a group (based on ordering)
- Used to compare current value with best/starting value
- Example: Highest sale in a day, first price of a stock, initial order value
*/


/*
LAST_VALUE()
- Gets last value in a group (requires full window frame)
- Used to compare with final or lowest value
- Example: Lowest price in a period, final balance, last recorded metric
*/


/*
GENERAL USE OF WINDOW FUNCTIONS
- Used when you need row-level data + aggregated insight together
- Avoids complex joins and multiple queries
- Common in dashboards, analytics, reporting systems
*/