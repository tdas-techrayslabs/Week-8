-- Database university
create database university;

USE UNIVERSITY;

-- Instructor Table
create table Instructor (
ID numeric(5),
Name varchar(30),
Dept_name varchar(20),
Salary numeric(6)
);

describe Instructor;

-- Course Table
create table Course (
Course_id varchar(10),
Title varchar(30),
Dept_name varchar(20),
Credits numeric(2)
);

describe Course;

-- Prereq Table
create table Prereq (
Course_id varchar(10),
Prereq_id varchar(10)
);

describe Prereq;

-- Department Table
create table Department (
Dept_name varchar(20),
Building varchar(20),
Budget numeric(10)
);

describe Department;

-- Teaches Table
create table Teaches (
ID numeric(5),
Course_id varchar(10),
Sec_id numeric(2),
Semester varchar(10),
year numeric(4)
);

describe Teaches;


-- ------------------------------------------------------- 

-- Insertion of data in Instructor Table 
insert into Instructor values (10101, "Srinivasan", "Comp. Sci.", 65000);

select * from Instructor;

INSERT INTO Instructor (ID, name, dept_name, salary) VALUES (12121, 'Wu', 'Finance', 90000);
INSERT INTO Instructor VALUES (15151, 'Mozart', 'Music', 40000);
INSERT INTO Instructor VALUES (22222, 'Einstein', 'Physics', 95000);
INSERT INTO Instructor VALUES (32343, 'El Said', 'History', 60000);
INSERT INTO Instructor VALUES (33456, 'Gold', 'Physics', 87000);
INSERT INTO Instructor VALUES (45565, 'Katz', 'Comp. Sci.', 75000);
INSERT INTO Instructor VALUES (58583, 'Califieri', 'History', 62000);
INSERT INTO Instructor VALUES (76543, 'Singh', 'Finance', 80000);
INSERT INTO Instructor VALUES (76766, 'Crick', 'Biology', 72000);
INSERT INTO Instructor VALUES (83821, 'Brandt', 'Comp. Sci.', 92000);
INSERT INTO Instructor VALUES (98345, 'Kim', 'Elec. Eng.', 80000);

select * from Instructor;

-- Insertion of data in Course Table 
INSERT INTO Course VALUES ('BIO-101', 'Intro. to Biology', 'Biology', 4);
INSERT INTO Course VALUES ('BIO-301', 'Genetics', 'Biology', 4);
INSERT INTO Course VALUES ('BIO-399', 'Computational Biology', 'Biology', 3);
INSERT INTO Course VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
INSERT INTO Course VALUES ('CS-190', 'Game Design', 'Comp. Sci.', 4);
INSERT INTO Course VALUES ('CS-315', 'Robotics', 'Comp. Sci.', 3);
INSERT INTO Course VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', 3);
INSERT INTO Course VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3);
INSERT INTO Course VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3);
INSERT INTO Course VALUES ('FIN-201', 'Investment Banking', 'Finance', 3);
INSERT INTO Course VALUES ('HIS-351', 'World History', 'History', 3);
INSERT INTO Course VALUES ('MU-199', 'Music Video Production', 'Music', 3);
INSERT INTO Course VALUES ('PHY-101', 'Physical Principles', 'Physics', 4);

SELECT * FROM COURSE;

-- Insertion of data in Prereq Table 
INSERT INTO Prereq VALUES ('BIO-301', 'BIO-101');
INSERT INTO Prereq VALUES ('BIO-399', 'BIO-101');
INSERT INTO Prereq VALUES ('CS-190', 'CS-101');
INSERT INTO Prereq VALUES ('CS-315', 'CS-101');
INSERT INTO Prereq VALUES ('CS-319', 'CS-101');
INSERT INTO Prereq VALUES ('CS-347', 'CS-101');
INSERT INTO Prereq VALUES ('EE-181', 'PHY-101');

SELECT * FROM PREREQ;

-- Insertion of data in Department Table 
INSERT INTO Department VALUES ('Biology', 'Watson', 90000);
INSERT INTO Department VALUES ('Comp. Sci.', 'Taylor', 100000);
INSERT INTO Department VALUES ('Elec. Eng.', 'Taylor', 85000);
INSERT INTO Department VALUES ('Finance', 'Painter', 120000);
INSERT INTO Department VALUES ('History', 'Painter', 50000);
INSERT INTO Department VALUES ('Music', 'Packard', 80000);
INSERT INTO Department VALUES ('Physics', 'Watson', 70000);

SELECT * FROM DEPARTMENT;

-- Insertion of data in Teaches Table 
INSERT INTO Teaches VALUES (10101, 'CS-101', 1, 'Fall', 2009);
INSERT INTO Teaches VALUES (10101, 'CS-315', 1, 'Spring', 2010);
INSERT INTO Teaches VALUES (10101, 'CS-347', 1, 'Fall', 2009);
INSERT INTO Teaches VALUES (12121, 'FIN-201', 1, 'Spring', 2010);
INSERT INTO Teaches VALUES (15151, 'MU-199', 1, 'Spring', 2010);
INSERT INTO Teaches VALUES (22222, 'PHY-101', 1, 'Fall', 2009);
INSERT INTO Teaches VALUES (32343, 'HIS-351', 1, 'Fall', 2010);
INSERT INTO Teaches VALUES (45565, 'CS-101', 1, 'Spring', 2010);
INSERT INTO Teaches VALUES (45565, 'CS-319', 1, 'Spring', 2010);
INSERT INTO Teaches VALUES (76766, 'BIO-101', 1, 'Summer', 2009);
INSERT INTO Teaches VALUES (76766, 'BIO-301', 1, 'Summer', 2010);
INSERT INTO Teaches VALUES (83821, 'CS-190', 1, 'Spring', 2009);
INSERT INTO Teaches VALUES (83821, 'CS-190', 2, 'Spring', 2010);
INSERT INTO Teaches VALUES (83821, 'CS-319', 2, 'Spring', 2010);
INSERT INTO Teaches VALUES (98345, 'EE-181', 1, 'Spring', 2009);

SELECT * FROM TEACHES;

-- --------------------------------------------------------------

--  a) Display the structure of all the tables.
DESCRIBE INSTRUCTOR;

DESCRIBE COURSE;

DESCRIBE PREREQ;

DESCRIBE DEPARTMENT;

DESCRIBE TEACHES;

--  b) Display the contents of all the tables.
SELECT * FROM INSTRUCTOR;

SELECT * FROM COURSE;

SELECT * FROM PREREQ;

SELECT * FROM DEPARTMENT;

SELECT * FROM TEACHES;

--  c) Display the name and department of each instructor.alter
SELECT NAME, DEPT_NAME FROM INSTRUCTOR;

--  d) Display the name and salary of Comp. Sci. Instructors.
SELECT NAME, SALARY 
FROM INSTRUCTOR
WHERE DEPT_NAME = 'Comp. Sci.';

--  e) Display the records of instructor who belongs to Physics department and getting salary less than 90000
SELECT * FROM INSTRUCTOR
WHERE DEPT_NAME = 'Physics' AND SALARY < 90000;

--  f) Display the name of the instructors who do not belong to Comp. Sci. Department.
SELECT NAME 
FROM INSTRUCTOR
WHERE DEPT_NAME != 'Comp. Sci.';

-- g) Display the names of the different department distinctly available in Instructor table.
SELECT DISTINCT DEPT_NAME 
FROM INSTRUCTOR;

--  h) Display all Course_id‘s that are taught in Spring semester of 2009.
SELECT COURSE_ID 
FROM TEACHES 
WHERE SEMESTER = 'Spring' AND YEAR = 2009;

-- i) Display course titles that are taught in Comp. Sci. Department and do not have credit equals to 3.
SELECT TITLE 
FROM COURSE 
WHERE DEPT_NAME = 'Comp. Sci.' AND CREDITS != 3;

--  j) Display all columns of course table sorted in descending order of department names.
SELECT *
FROM COURSE
ORDER BY DEPT_NAME DESC;

--  k) Add a date_of_join column to instructor table.
CREATE TABLE INSTRUCTOR_Date AS 
SELECT * FROM INSTRUCTOR;

SELECT * FROM INSTRUCTOR_DATE;

ALTER TABLE INSTRUCTOR_DATE
ADD date_of_join Date;

DESCRIBE INSTRUCTOR_DATE;

SELECT * FROM INSTRUCTOR_DATE;

-- l) Insert date values to existing rows.
UPDATE INSTRUCTOR_DATE 
SET DATE_OF_JOIN = '2005-02-22'
WHERE ID = 10101;

SELECT * FROM INSTRUCTOR_DATE;

UPDATE INSTRUCTOR_DATE SET date_of_join = '2008-07-01' WHERE ID = 12121;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2010-01-10' WHERE ID = 15151;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2007-09-20' WHERE ID = 22222;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2009-06-25' WHERE ID = 32343;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2006-03-11' WHERE ID = 33456;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2005-11-17' WHERE ID = 45565;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2008-04-05' WHERE ID = 58583;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2011-02-01' WHERE ID = 76543;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2009-09-30' WHERE ID = 76766;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2012-12-15' WHERE ID = 83821;
UPDATE INSTRUCTOR_DATE SET date_of_join = '2013-03-20' WHERE ID = 98345;

SELECT * FROM INSTRUCTOR_DATE;

--  m) Change the name of dept_name to department in all the tables.
CREATE TABLE INSTRUCTOR_1 AS 
SELECT * FROM INSTRUCTOR;

CREATE TABLE COURSE_1 AS 
SELECT * FROM COURSE;

CREATE TABLE PREREQ_1 AS 
SELECT * FROM PREREQ;

CREATE TABLE DEPARTMENT_1 AS 
SELECT * FROM DEPARTMENT;

CREATE TABLE TEACHES_1 AS 
SELECT * FROM TEACHES;


ALTER TABLE INSTRUCTOR_1
RENAME COLUMN DEPT_NAME TO DEPARTMENT;

SELECT * FROM INSTRUCTOR_1;

ALTER TABLE COURSE_1
RENAME COLUMN DEPT_NAME TO DEPARTMENT;

SELECT * FROM COURSE_1;

ALTER TABLE DEPARTMENT_1
RENAME COLUMN DEPT_NAME TO DEPARTMENT;

SELECT * FROM DEPARTMENT_1;

-- n) Change the name of  “Prereq” table with new name “Prerequired”
ALTER TABLE PREREQ_1 
RENAME PREREQUIRED;

SELECT * FROM PREREQ_1;
SELECT * FROM PREREQUIRED;

--  o) Change Course_id column name to Sub_code.
ALTER TABLE COURSE_1
RENAME COLUMN COURSE_ID TO SUB_CODE;

SELECT * FROM COURSE_1; 

ALTER TABLE PREREQUIRED
RENAME COLUMN COURSE_ID TO SUB_CODE;

SELECT * FROM PREREQUIRED; 

ALTER TABLE TEACHES_1
RENAME COLUMN COURSE_ID TO SUB_CODE;

SELECT * FROM TEACHES_1; 

--  p) Change the data type of name to varchar2 (50).
DESCRIBE INSTRUCTOR_1;

ALTER TABLE INSTRUCTOR_1
MODIFY COLUMN NAME varchar(50);

DESCRIBE INSTRUCTOR_1;

-- q) Change the name of Instructor table to Faculty_Info.
ALTER TABLE INSTRUCTOR_1 
RENAME FACULTY_INFO;

SELECT * FROM INSTRUCTOR_1;
SELECT * FROM FACULTY_INFO;

-- r) Change the Column size of Course_id in Course table from 10 to 8.
DESCRIBE COURSE_1;

ALTER TABLE COURSE_1
MODIFY COLUMN SUB_CODE varchar(8);

DESCRIBE COURSE_1;

-- s) Delete the content of the table Prereq along with its description.
DROP TABLE PREREQUIRED;

SELECT * FROM PREREQUIRED;

--  t) Change the column name ‘Building’ of Department table by new column name ‘Builder’.
ALTER TABLE DEPARTMENT_1
RENAME COLUMN BUILDING TO BUILDER;

SELECT * FROM DEPARTMENT_1;

-- -------------------------------------------------------------

CREATE TABLE INSTRUCTOR_2 AS 
SELECT * FROM INSTRUCTOR;

SELECT * FROM INSTRUCTOR_2;

CREATE TABLE COURSE_2 AS 
SELECT * FROM COURSE;

SELECT * FROM COURSE_2;

CREATE TABLE DEPARTMENT_2 AS 
SELECT * FROM DEPARTMENT;

SELECT * FROM DEPARTMENT_2;

CREATE TABLE PREREQ_2 AS 
SELECT * FROM PREREQ;

SELECT * FROM PREREQ_2;

CREATE TABLE TEACHES_2 AS 
SELECT * FROM TEACHES;

SELECT * FROM TEACHES_2;

-- 1)
--  a) Display the Course_ids, Titles and Credits of course that are offered in any of the departments namely: Physics, Music, Finance and Biology.
SELECT COURSE_ID, TITLE, CREDITS 
FROM COURSE_2
WHERE DEPT_NAME IN ('Physics', 'Music', 'Finance', 'Biology');

-- b) Display records of the instructors whose name starts with “K” and who get salary more than 65000.
SELECT NAME 
FROM INSTRUCTOR_2
WHERE NAME LIKE "K%" AND SALARY > 65000;

-- c) Display name, department, gross salary and net salary of instructors with 105% DA, 20% HRA, 30% IT. (gross salary = salary + DA + HRA, net salary = gross salary – IT).
SELECT NAME, DEPT_NAME, 
SALARY + (SALARY * 1.05) + (SALARY * 0.20) AS Gross_Salary,
(SALARY + (SALARY * 1.05) + (SALARY * 0.20)) - (SALARY * 0.30) AS Net_Salary
FROM INSTRUCTOR_2;

--  d) Display records of the Instructors with salary range 60000 to 80000.
SELECT *
FROM INSTRUCTOR_2
WHERE SALARY BETWEEN 60000 AND 80000;

--  e) Display the records of the instructors having the second letter in their name as ‘r’.
SELECT *
FROM INSTRUCTOR_2
WHERE NAME LIKE "_r%";

-- f) Display the names of the instructors of Comp.Sci. Department in the descending order of their salary.
SELECT NAME
FROM INSTRUCTOR_2 
WHERE DEPT_NAME = 'Comp. Sci.' 
ORDER BY SALARY DESC;

--  g) Update all records of Instructor table with a salary hike of 15%.
SELECT * 
FROM INSTRUCTOR_2;

UPDATE INSTRUCTOR_2
SET SALARY = (SALARY * 1.15);

SELECT * 
FROM INSTRUCTOR_2;

-- h) Update all records of Instructor table with a salary hike of 15%;
SELECT * 
FROM INSTRUCTOR_2
WHERE DEPT_NAME = 'Comp. Sci.';

UPDATE INSTRUCTOR_2
SET SALARY = (SALARY *1.03)
WHERE DEPT_NAME = 'Comp. Sci.' AND SALARY < 70000;

SELECT * 
FROM INSTRUCTOR_2
WHERE DEPT_NAME = 'Comp. Sci.';

-- i) Display the annual salary of each instructor.
SELECT NAME, (SALARY * 12) AS Annual_Salary 
FROM INSTRUCTOR_2;

-- j) Update the title of the course having title 'Game Design' to 'Game Theory'.
SELECT * FROM COURSE_2;

UPDATE COURSE_2
SET TITLE = 'Game Theory'
WHERE TITLE = 'Game Design';

SELECT * FROM COURSE_2;

--  k) Delete the instructor records of History department.
CREATE TABLE INSTRUCTOR_temp AS
SELECT * FROM INSTRUCTOR_2;

SELECT * FROM INSTRUCTOR_temp;

DELETE FROM INSTRUCTOR_temp
WHERE DEPT_NAME = 'History';

SELECT * FROM INSTRUCTOR_temp;

--  l) Delete the course records of the courses having course_id starting with 'BIO'.
CREATE TABLE COURSE_temp AS
SELECT * FROM COURSE_2;

SELECT * FROM COURSE_temp;

DELETE FROM COURSE_temp
WHERE COURSE_ID LIKE 'BIO%';

SELECT * FROM COURSE_temp; 


-- 2)
-- a) Display the Avg. salary of instructors of Physics department.
SELECT * 
FROM INSTRUCTOR_2
WHERE DEPT_NAME = 'Physics';

SELECT AVG(SALARY)
FROM INSTRUCTOR_2
WHERE DEPT_NAME = 'Physics';

--  b) Display the Dept_ name and Average salary paid to instructor of each department.
SELECT DEPT_NAME, AVG(SALARY) AS AVERAGE_SALARY
FROM INSTRUCTOR_2
GROUP BY DEPT_NAME;

-- c) Display the ID, Name & Department of the instructor drawing the highest salary.
SELECT * FROM INSTRUCTOR_2;

SELECT ID, NAME, DEPT_NAME
FROM INSTRUCTOR_2
WHERE SALARY = (SELECT MAX(SALARY)
FROM INSTRUCTOR_2);

--  d) Display the number of instructors available in Comp. Sci. Department.
SELECT COUNT(*) AS No_of_Instructors
FROM INSTRUCTOR_2
WHERE DEPT_NAME = 'Comp. Sci.';

--  e) Display the total credits of all courses offered in Comp.Sci. Department.
SELECT SUM(CREDITS) AS Total_Credits
FROM COURSE_2
WHERE DEPT_NAME = 'Comp. Sci.';

-- f) Display the number of instructors and total salary drawn by Physics and Comp.Sci. departments.
SELECT DEPT_NAME, COUNT(*) AS No_of_instructors, SUM(SALARY) AS Total_salary
FROM INSTRUCTOR_2 
GROUP BY DEPT_NAME
HAVING DEPT_NAME IN ('Comp. Sci.', 'Physics');

--  g) Display the total credits of Comp.Sci. and Biology departments from course table.
SELECT DEPT_NAME, SUM(CREDITS) AS Total_credits
FROM COURSE_2
GROUP BY DEPT_NAME
HAVING DEPT_NAME IN ('Comp. Sci.', 'Biology');

-- h) Display building wise total budget values.
SELECT BUILDING, SUM(BUDGET) AS Total_budget
FROM DEPARTMENT
GROUP BY BUILDING;

-- i) Display the number of instructors of each department.
SELECT DEPT_NAME, COUNT(*) AS No_of_instructors
FROM INSTRUCTOR_2
GROUP BY DEPT_NAME;

--  j) Display the number of instructors of each department sorted in high to low.
SELECT DEPT_NAME, COUNT(*) AS No_of_instructors
FROM INSTRUCTOR_2
GROUP BY DEPT_NAME
ORDER BY No_of_instructors DESC;

-- k) Display the number of courses offered semester wise.
SELECT SEMESTER, COUNT(*) AS No_of_courses
FROM TEACHES_2
GROUP BY SEMESTER;

SELECT * FROM TEACHES_2;

-- l) Display the name of departments having number of instructors less than 2.
SELECT DEPT_NAME, COUNT(*) AS No_of_instructors
FROM INSTRUCTOR_2
GROUP BY DEPT_NAME
HAVING No_of_instructors < 2;

--  m) List the number of instructors of each department having 2 or more than 2 instructors except Finance department, sorted in high to low order of their number.
SELECT DEPT_NAME, COUNT(*) AS No_of_instructors
FROM INSTRUCTOR_2
GROUP BY DEPT_NAME
HAVING No_of_instructors >= 2 AND DEPT_NAME != 'Finance'
ORDER BY No_of_instructors DESC;

--  n) Display the Dept_name that has paid total salary more than 50000.
SELECT DEPT_NAME, SUM(SALARY) AS Total_salary
FROM INSTRUCTOR_2
GROUP BY DEPT_NAME
HAVING Total_salary > 50000;

-- o) Display the total budget for the building built by Watson.
SELECT SUM(BUDGET) AS Total_Budget
FROM DEPARTMENT_2
GROUP BY BUILDING
HAVING BUILDING = 'Watson';

--  p) Display the highest salary of the instructor of Comp.Sci. Department.
SELECT NAME, SALARY
FROM INSTRUCTOR_2
WHERE SALARY = (
SELECT MAX(SALARY) 
FROM INSTRUCTOR_2 
GROUP BY DEPT_NAME
HAVING DEPT_NAME = 'Comp. Sci.');

-- 3)
--  a) Display your name with first letter being capital, where the entered name is in lower case.
SELECT CONCAT(UCASE(LEFT('tanmoy', 1)), SUBSTRING('tanmoy', 2)) 
AS Capitalized_name; 

-- b) Display 2nd- 6th characters of your name.
SELECT SUBSTRING('TanmoyDas', 2, 5) AS Name;

--  c) Find length of your full university name.
SELECT LENGTH('SOA UNIVERSITY') AS Length;

-- d) Display all the Instructor names with its first letter in upper case.
SELECT CONCAT(UCASE(LEFT(NAME, 1)), SUBSTRING(NAME, 2)) AS New_name
FROM INSTRUCTOR_2;

-- e) List the department name of each instructor as a three letter code.
SELECT NAME, DEPT_NAME, SUBSTRING(DEPT_NAME,1,3) AS CODE
FROM INSTRUCTOR_2;

--  f) Display the month of the joining of each instructor.
SELECT * FROM INSTRUCTOR_Date; 

SELECT NAME, date_of_join, MONTHNAME(date_of_join) AS MONTH_NAME
FROM INSTRUCTOR_Date;

-- g) Display the date of joining of each instructor in dd/mm/yy format.
SELECT NAME, date_of_join, DATE_FORMAT(date_of_join, "%d/%m/%y") AS NEW_DATE
FROM INSTRUCTOR_DATE;

--  h) Display the experience of each instructor in terms of months.
SELECT NAME, date_of_join, TIMESTAMPDIFF(MONTH, date_of_join, CURRENT_DATE()) AS Experience_in_months
FROM INSTRUCTOR_DATE;

--  i) Display the experience of each instructor in term of years and months.
SELECT NAME, date_of_join, 
CONCAT(
TIMESTAMPDIFF(YEAR, date_of_join, CURRENT_DATE()), 
' years ', 
MOD(
TIMESTAMPDIFF(MONTH, date_of_join, CURRENT_DATE()), 12), 
' months ')
AS Experience_in_years_months
FROM INSTRUCTOR_DATE;

-- j) Display the day of joining of each instructor.
SELECT NAME, date_of_join, DAY(date_of_join) AS DAY, 
DAYNAME(date_of_join) AS DAY_NAME
FROM INSTRUCTOR_DATE;

-- k) Display the date corresponding to 15 days after today's date.
SELECT DATE_ADD(CURRENT_DATE(), INTERVAL 15 DAY) AS DAY_AFTER_15_DAYS;

-- l) Display the value 94204.27348 truncated up to 2 digits after decimal point.
SELECT TRUNCATE(94204.27348, 2) as Truncated_value;

--  m) Display the value of the expression 5 + 8^9
SELECT 5 + POW(8, 9) AS Expressional_value;

-- n) Find out the square root of 6464312.
SELECT SQRT(6464312) AS SquareRoot_value;

-- o) Display the string “HELLO ITER” in lower case with a column heading lower case.
SELECT LCASE("HELLO ITER") AS lower_case;

