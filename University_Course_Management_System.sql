-- STEP 1 : CREATE THE DATABASE

CREATE DATABASE IF NOT EXISTS UniversityCMS;
USE UniversityCMS;

-- STEP 2 : CREATE ALL TABLES

-- 1. Departments Table (create first – other tables reference it)
CREATE TABLE IF NOT EXISTS Departments (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- 2. Students Table
CREATE TABLE IF NOT EXISTS Students (
    StudentID      INT PRIMARY KEY,
    FirstName      VARCHAR(50)  NOT NULL,
    LastName       VARCHAR(50)  NOT NULL,
    Email          VARCHAR(100) UNIQUE NOT NULL,
    BirthDate      DATE         NOT NULL,
    EnrollmentDate DATE         NOT NULL
);

-- 3. Courses Table
CREATE TABLE IF NOT EXISTS Courses (
    CourseID     INT PRIMARY KEY,
    CourseName   VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Credits      INT          NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 4. Instructors Table
CREATE TABLE IF NOT EXISTS Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName    VARCHAR(50)  NOT NULL,
    LastName     VARCHAR(50)  NOT NULL,
    Email        VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,
    Salary       DECIMAL(10,2) NOT NULL DEFAULT 50000.00,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 5. Enrollments Table
CREATE TABLE IF NOT EXISTS Enrollments (
    EnrollmentID   INT PRIMARY KEY,
    StudentID      INT,
    CourseID       INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Courses(CourseID)
);

-- STEP 3 : INSERT SAMPLE DATA (30+ rows per table)


INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1,  'Computer Science'),
(2,  'Mathematics'),
(3,  'Physics'),
(4,  'Chemistry'),
(5,  'Biology'),
(6,  'English Literature'),
(7,  'History'),
(8,  'Economics'),
(9,  'Mechanical Engineering'),
(10, 'Civil Engineering');

INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate) VALUES
(1,  'John',    'Doe',       'john.doe@email.com',       '2000-01-15', '2022-08-01'),
(2,  'Jane',    'Smith',     'jane.smith@email.com',     '1999-05-25', '2021-08-01'),
(3,  'Alice',   'Brown',     'alice.brown@email.com',    '2001-03-10', '2023-08-01'),
(4,  'Bob',     'Johnson',   'bob.johnson@email.com',    '2000-07-22', '2022-01-15'),
(5,  'Charlie', 'Williams',  'charlie.w@email.com',      '1998-11-05', '2019-08-01'),
(6,  'Diana',   'Jones',     'diana.jones@email.com',    '2001-09-18', '2023-01-10'),
(7,  'Edward',  'Garcia',    'edward.garcia@email.com',  '1999-02-28', '2020-08-01'),
(8,  'Fiona',   'Martinez',  'fiona.m@email.com',        '2002-06-14', '2024-01-15'),
(9,  'George',  'Hernandez', 'george.h@email.com',       '2000-12-30', '2022-08-01'),
(10, 'Hannah',  'Lopez',     'hannah.l@email.com',       '1997-04-17', '2018-08-01'),
(11, 'Ivan',    'Wilson',    'ivan.wilson@email.com',    '2001-08-05', '2023-08-01'),
(12, 'Julia',   'Anderson',  'julia.a@email.com',        '2000-03-21', '2022-01-10'),
(13, 'Kevin',   'Thomas',    'kevin.t@email.com',        '1999-07-09', '2021-08-01'),
(14, 'Laura',   'Taylor',    'laura.t@email.com',        '2002-01-25', '2024-08-01'),
(15, 'Mike',    'Moore',     'mike.moore@email.com',     '1998-09-13', '2019-01-15'),
(16, 'Nancy',   'Jackson',   'nancy.j@email.com',        '2001-05-07', '2023-01-10'),
(17, 'Oscar',   'White',     'oscar.white@email.com',    '2000-10-19', '2022-08-01'),
(18, 'Paula',   'Harris',    'paula.h@email.com',        '1999-12-03', '2020-08-01'),
(19, 'Quinn',   'Martin',    'quinn.martin@email.com',   '2002-04-11', '2024-01-15'),
(20, 'Rachel',  'Thompson',  'rachel.t@email.com',       '2001-06-29', '2023-08-01'),
(21, 'Sam',     'Garcia',    'sam.garcia@email.com',     '1997-08-16', '2017-08-01'),
(22, 'Tina',    'Martinez',  'tina.m@email.com',         '2000-02-08', '2022-01-10'),
(23, 'Uma',     'Robinson',  'uma.robinson@email.com',   '2001-11-24', '2023-08-01'),
(24, 'Victor',  'Clark',     'victor.c@email.com',       '1999-03-15', '2021-01-15'),
(25, 'Wendy',   'Rodriguez', 'wendy.r@email.com',        '2002-07-02', '2024-08-01'),
(26, 'Xavier',  'Lewis',     'xavier.l@email.com',       '1998-10-20', '2019-08-01'),
(27, 'Yara',    'Lee',       'yara.lee@email.com',       '2001-01-12', '2023-01-10'),
(28, 'Zack',    'Walker',    'zack.walker@email.com',    '2000-05-27', '2022-08-01'),
(29, 'Amy',     'Hall',      'amy.hall@email.com',       '1999-09-08', '2021-08-01'),
(30, 'Brian',   'Allen',     'brian.allen@email.com',    '2002-12-14', '2024-01-15');

-- ── Courses (30 rows) ─────────────────────────────────────
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES
(101, 'Introduction to SQL',        1, 3),
(102, 'Data Structures',            1, 4),
(103, 'Calculus I',                 2, 4),
(104, 'Linear Algebra',             2, 3),
(105, 'Classical Mechanics',        3, 4),
(106, 'Organic Chemistry',          4, 4),
(107, 'Cell Biology',               5, 3),
(108, 'British Literature',         6, 3),
(109, 'World History',              7, 3),
(110, 'Microeconomics',             8, 3),
(111, 'Machine Learning',           1, 4),
(112, 'Operating Systems',          1, 4),
(113, 'Calculus II',                2, 4),
(114, 'Statistics',                 2, 3),
(115, 'Quantum Mechanics',          3, 4),
(116, 'Inorganic Chemistry',        4, 3),
(117, 'Genetics',                   5, 4),
(118, 'American Literature',        6, 3),
(119, 'Modern History',             7, 3),
(120, 'Macroeconomics',             8, 3),
(121, 'Web Development',            1, 3),
(122, 'Computer Networks',          1, 4),
(123, 'Discrete Mathematics',       2, 3),
(124, 'Thermodynamics',             3, 4),
(125, 'Biochemistry',               4, 4),
(126, 'Ecology',                    5, 3),
(127, 'Creative Writing',           6, 3),
(128, 'Ancient History',            7, 3),
(129, 'International Economics',    8, 3),
(130, 'Structural Engineering',     10,4);

INSERT INTO Instructors (InstructorID, FirstName, LastName, Email, DepartmentID, Salary) VALUES
(1,  'Alice',   'Johnson',  'alice.johnson@univ.com',   1, 75000.00),
(2,  'Bob',     'Lee',      'bob.lee@univ.com',         2, 68000.00),
(3,  'Carol',   'King',     'carol.king@univ.com',      3, 72000.00),
(4,  'David',   'Wright',   'david.wright@univ.com',    4, 69000.00),
(5,  'Eva',     'Scott',    'eva.scott@univ.com',       5, 65000.00),
(6,  'Frank',   'Adams',    'frank.adams@univ.com',     6, 62000.00),
(7,  'Grace',   'Baker',    'grace.baker@univ.com',     7, 63000.00),
(8,  'Henry',   'Carter',   'henry.carter@univ.com',    8, 70000.00),
(9,  'Irene',   'Davis',    'irene.davis@univ.com',     9, 71000.00),
(10, 'Jack',    'Evans',    'jack.evans@univ.com',      10,73000.00),
(11, 'Karen',   'Foster',   'karen.foster@univ.com',    1, 80000.00),
(12, 'Liam',    'Green',    'liam.green@univ.com',      2, 67000.00),
(13, 'Mona',    'Harris',   'mona.harris@univ.com',     3, 74000.00),
(14, 'Nate',    'Irving',   'nate.irving@univ.com',     4, 66000.00),
(15, 'Olivia',  'James',    'olivia.james@univ.com',    5, 64000.00),
(16, 'Paul',    'Kelly',    'paul.kelly@univ.com',      6, 61000.00),
(17, 'Queen',   'Long',     'queen.long@univ.com',      7, 60000.00),
(18, 'Ryan',    'Morgan',   'ryan.morgan@univ.com',     8, 69500.00),
(19, 'Sara',    'Nelson',   'sara.nelson@univ.com',     9, 72500.00),
(20, 'Tom',     'Owen',     'tom.owen@univ.com',        10,74000.00),
(21, 'Uma',     'Parker',   'uma.parker@univ.com',      1, 82000.00),
(22, 'Vince',   'Quinn',    'vince.quinn@univ.com',     2, 65000.00),
(23, 'Wendy',   'Reed',     'wendy.reed@univ.com',      3, 71000.00),
(24, 'Xander',  'Stone',    'xander.stone@univ.com',    4, 68500.00),
(25, 'Yolanda', 'Turner',   'yolanda.t@univ.com',       5, 63500.00),
(26, 'Zane',    'Underwood','zane.u@univ.com',           6, 60500.00),
(27, 'Abby',    'Vance',    'abby.vance@univ.com',      7, 62500.00),
(28, 'Ben',     'Walsh',    'ben.walsh@univ.com',       8, 71500.00),
(29, 'Cathy',   'Xavier',   'cathy.xavier@univ.com',    9, 73500.00),
(30, 'Dan',     'Young',    'dan.young@univ.com',       10,75500.00);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1,  1,  101, '2022-08-01'),
(2,  2,  102, '2021-08-01'),
(3,  3,  101, '2023-08-01'),
(4,  4,  103, '2022-01-15'),
(5,  5,  104, '2019-08-01'),
(6,  6,  102, '2023-01-10'),
(7,  7,  105, '2020-08-01'),
(8,  8,  106, '2024-01-15'),
(9,  9,  101, '2022-08-01'),
(10, 10, 107, '2018-08-01'),
(11, 11, 102, '2023-08-01'),
(12, 12, 108, '2022-01-10'),
(13, 13, 109, '2021-08-01'),
(14, 14, 110, '2024-08-01'),
(15, 15, 111, '2019-01-15'),
(16, 16, 101, '2023-01-10'),
(17, 17, 112, '2022-08-01'),
(18, 18, 113, '2020-08-01'),
(19, 19, 114, '2024-01-15'),
(20, 20, 102, '2023-08-01'),
(21, 21, 115, '2017-08-01'),
(22, 22, 116, '2022-01-10'),
(23, 23, 101, '2023-08-01'),
(24, 24, 117, '2021-01-15'),
(25, 25, 118, '2024-08-01'),
(26, 26, 119, '2019-08-01'),
(27, 27, 102, '2023-01-10'),
(28, 28, 120, '2022-08-01'),
(29, 29, 121, '2021-08-01'),
(30, 30, 122, '2024-01-15');

-- STEP 4 : CRUD OPERATIONS  (Query 1)

-- ── CREATE (INSERT) ──────────────────────────────────────
-- Add a new student
INSERT INTO Students (StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES (31, 'New', 'Student', 'new.student@email.com', '2003-01-01', '2025-08-01');

-- Add a new course
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits)
VALUES (131, 'Artificial Intelligence', 1, 4);

-- ── READ (SELECT) ────────────────────────────────────────
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM Enrollments;
SELECT * FROM Departments;

-- ── UPDATE (INCREMENT & DECREMENT) ──────────────────────
-- INCREMENT: Increase credits by 1 for all CS courses
UPDATE Courses
SET Credits = Credits + 1          -- INCREMENT ➕
WHERE DepartmentID = 1;

-- DECREMENT: Reduce credits by 1 for History courses
UPDATE Courses
SET Credits = Credits - 1          -- DECREMENT ➖
WHERE DepartmentID = 7;

-- INCREMENT: Give all CS instructors a $5000 salary raise
UPDATE Instructors
SET Salary = Salary + 5000         -- INCREMENT ➕
WHERE DepartmentID = 1;

-- DECREMENT: Reduce salary of instructors earning above $80000 by $2000
UPDATE Instructors
SET Salary = Salary - 2000         -- DECREMENT ➖
WHERE Salary > 80000;

-- ── DELETE ───────────────────────────────────────────────
-- Remove the newly added test student
DELETE FROM Students WHERE StudentID = 31;

-- QUERY 2 : Retrieve students who enrolled AFTER 2022
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate
FROM Students
WHERE EnrollmentDate > '2022-12-31'   -- only dates after year 2022
ORDER BY EnrollmentDate;

-- QUERY 3 : Courses by Mathematics dept, limit 5
SELECT
    CourseID,
    CourseName,
    Credits
FROM Courses
WHERE DepartmentID = 2               -- 2 = Mathematics
ORDER BY CourseID
LIMIT 5;

-- QUERY 4 : Number of students per course, only courses
--           with MORE than 5 students
SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS TotalStudents   -- count enrollments per course
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5            -- filter: more than 5 students
ORDER BY TotalStudents DESC;

-- QUERY 5 : Students enrolled in BOTH courses 101 AND 102
--           (INTERSECT using INNER JOIN)
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName
FROM Students s
-- enrolled in course 101
JOIN Enrollments e1 ON s.StudentID = e1.StudentID AND e1.CourseID = 101
-- AND also enrolled in course 102
JOIN Enrollments e2 ON s.StudentID = e2.StudentID AND e2.CourseID = 102;

-- QUERY 6 : Students enrolled in EITHER course 101 OR 102
--           (UNION)
SELECT s.StudentID, s.FirstName, s.LastName, 'Intro to SQL' AS CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID = 101

UNION

SELECT s.StudentID, s.FirstName, s.LastName, 'Data Structures' AS CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID = 102
ORDER BY StudentID;

-- QUERY 7 : Average number of credits across all courses
SELECT
    AVG(Credits) AS AverageCredits    -- simple average function
FROM Courses;

-- QUERY 8 : Maximum salary of instructors in Computer Science
SELECT
    MAX(Salary) AS MaxSalary          -- MAX aggregate function
FROM Instructors
WHERE DepartmentID = 1;              -- 1 = Computer Science

-- QUERY 9 : Count of students enrolled in each department
SELECT
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS StudentCount
FROM Departments d
JOIN Courses     c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID     = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY StudentCount DESC;

-- QUERY 10 : INNER JOIN – Students with their courses
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName,
    e.EnrollmentDate
FROM Students    s
INNER JOIN Enrollments e ON s.StudentID  = e.StudentID
INNER JOIN Courses     c ON e.CourseID   = c.CourseID
ORDER BY s.StudentID;

-- QUERY 11 : LEFT JOIN – All students + their courses (if any)
SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName            -- NULL if student has no enrollment
FROM Students    s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses     c ON e.CourseID  = c.CourseID
ORDER BY s.StudentID;

-- QUERY 12 : SUBQUERY – Students in courses with > 10 students
SELECT
    StudentID,
    FirstName,
    LastName
FROM Students
WHERE StudentID IN (
    -- inner query: find all students enrolled in popular courses
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN (
        -- innermost: courses that have more than 10 enrollments
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 10
    )
);

-- QUERY 13 : Extract YEAR from EnrollmentDate
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    YEAR(EnrollmentDate) AS EnrollmentYear   -- extract year part
FROM Students
ORDER BY EnrollmentYear;

-- QUERY 14 : Concatenate instructor First + Last name
SELECT
    InstructorID,
    CONCAT(FirstName, ' ', LastName) AS FullName,   -- join two strings
    Email,
    DepartmentID
FROM Instructors
ORDER BY InstructorID;

-- QUERY 15 : Running total of students enrolled in courses
--            (Window Function)
SELECT
    e.EnrollmentID,
    e.CourseID,
    c.CourseName,
    e.StudentID,
    e.EnrollmentDate,
    -- SUM over all rows ordered by EnrollmentID = running total
    SUM(1) OVER (ORDER BY e.EnrollmentID) AS RunningTotalStudents
FROM Enrollments e
JOIN Courses     c ON e.CourseID = c.CourseID
ORDER BY e.EnrollmentID;

-- QUERY 16 : Label students as 'Senior' or 'Junior'
--            Senior  → enrolled more than 4 years ago
--            Junior  → enrolled within last 4 years
SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,
    CASE
        -- if enrollment was more than 4 years from today → Senior
        WHEN DATEDIFF(CURDATE(), EnrollmentDate) > (4 * 365)
            THEN 'Senior'
        -- otherwise → Junior
        ELSE 'Junior'
    END AS StudentLevel
FROM Students
ORDER BY StudentID;

