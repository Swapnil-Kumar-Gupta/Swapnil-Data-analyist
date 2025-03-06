Create database MarketCo;
use MarketCo;

-- Statement to create company table
create  table company(
companyid int primary key ,
companyname varchar(45),
street varchar(45),
city varchar(45),
state varchar(10),
zip varchar(10)
);

-- statement to create contact table
create table conact(
contactid int primary key,
companyid int,
firstname varchar(45),
lastname varchar (45),
street varchar(20),
city varchar(20),
state varchar(20),
zip varchar(20),
isMain boolean,
phone varchar(12),
foreign key(companyid) references company(companyid));

ALTER TABLE conact 
ADD COLUMN email VARCHAR(45);  


-- statement to create employee
create table employee(
employeeid int primary key,
firstname varchar(45),
lastname varchar (45),
salary decimal(10,2),
hiredate date,
jobTitle varchar(45),
email varchar(45),
phone varchar(12));

-- statement to create table Contactemployee

create table contactemployee(
contactemployeeid int primary key,
contactid int,
employeeid int,
contactdate date,
description varchar(100),
foreign key(contactid) references conact(contactid),
foreign key(employeeid) references employee(employeeid));

-- insert the data in company table 
INSERT INTO company (companyid, companyname, street, city, state, zip) VALUES
(1, 'Urban Outfitters, Inc.', '5000 South Broad St', 'Philadelphia', 'PA', '19112'),
(2, 'Toll Brothers', '1140 Virginia Dr', 'Fort Washington', 'PA', '19034'),
(3, 'Apple Inc.', '1 Apple Park Way', 'Cupertino', 'CA', '95014'),
(4, 'Microsoft Corp.', 'One Microsoft Way', 'Redmond', 'WA', '98052'),
(5, 'Google LLC', '1600 AmphitheatrePkwy', 'Mountain View', 'CA', '94043'),
(6, 'Amazon.com, Inc.', '410 Terry Ave N', 'Seattle', 'WA', '98109'),
(7, 'Facebook, Inc.', '1 Hacker Way', 'Menlo Park', 'CA', '94025'),
(8, 'Tesla, Inc.', '3500 Deer Creek Rd', 'Palo Alto', 'CA', '94304'),
(9, 'Netflix, Inc.', '121 Albright Way', 'Los Gatos', 'CA', '95032'),
(10, 'Nike, Inc.', 'One Bowerman Dr', 'Beaverton', 'OR', '97005');

-- insert the data in conact table
INSERT INTO conact (contactid, companyid, firstname, lastname, street, city, state, zip, isMain, email, phone) VALUES
(1, 1, 'John', 'Doe', '5000 South Broad St', 'Philadelphia', 'PA', '19112', TRUE, 'johndoe@urban.com', '2155551234'),
(2, 2, 'Alice', 'Smith', '1140 Virginia Dr', 'Fort Washington', 'PA', '19034', TRUE, 'alice@tollbrothers.com', '2155555678'),
(3, 3, 'Steve', 'Jobs', '1 Apple Park Way', 'Cupertino', 'CA', '95014', FALSE, 'steve@apple.com', '4085551234'),
(4, 4, 'Bill', 'Gates', 'One Microsoft Way', 'Redmond', 'WA', '98052', TRUE, 'bill@microsoft.com', '4255555678'),
(5, 5, 'Larry', 'Page', '1600 Amphitheatre Pkwy', 'MountainView', 'CA', '94043', TRUE, 'larry@google.com', '6505559101'),
(6, 6, 'Jeff', 'Bezos', '410 Terry Ave N', 'Seattle', 'WA', '98109', TRUE, 'jeff@amazon.com', '2065557654'),
(7, 7, 'Mark', 'Zuckerberg', '1 Hacker Way', 'Menlo Park', 'CA', '94025', FALSE, 'mark@facebook.com', '6505551023'),
(8, 8, 'Elon', 'Musk', '3500 Deer Creek Rd', 'Palo Alto', 'CA', '94304', TRUE, 'elon@tesla.com', '6505556789'),
(9, 9, 'Reed', 'Hastings', '121 Albright Way', 'Los Gatos', 'CA', '95032', TRUE, 'reed@netflix.com', '4085553210'),
(10, 10, 'Phil', 'Knight', 'One Bowerman Dr', 'Beaverton', 'OR', '97005', TRUE, 'phil@nike.com', '5035558765');

ALTER TABLE conact  
MODIFY COLUMN street VARCHAR(50);

-- insert the data in employee table
insert INTO employee (employeeid, firstname, lastname, salary, hiredate, jobtitle, email, phone) VALUES
(1, 'Lesley', 'Bland', 75000.00, '2019-05-15', 'Manager', 'lesley.bland@example.com', '2155559901'),
(2, 'Jack', 'Lee', 62000.00, '2018-03-22', 'Engineer', 'jack.lee@example.com', '4155553311'),
(3, 'Dianne', 'Connor', 67000.00, '2020-01-12', 'Analyst', 'dianne.connor@example.com', '3125552255'),
(4, 'Sundar', 'Pichai', 150000.00, '2015-10-02', 'CEO', 'sundar.pichai@google.com', '6505552001'),
(5, 'Tim', 'Cook', 180000.00, '2011-08-24', 'CEO', 'tim.cook@apple.com', '4085553002'),
(6, 'Satya', 'Nadella', 175000.00, '2014-02-04', 'CEO', 'satya.nadella@microsoft.com', '4255554003'),
(7, 'Andy', 'Jassy', 160000.00, '2021-07-05', 'CEO', 'andy.jassy@amazon.com', '2065555004'),
(8, 'Sheryl', 'Sandberg', 130000.00, '2008-03-24', 'COO', 'sheryl@facebook.com', '6505556005'),
(9, 'Elon', 'Musk', 250000.00, '2004-02-01', 'CEO', 'elon.musk@tesla.com', '3105557006'),
(10, 'Reed', 'Hastings', 140000.00, '1997-08-29', 'CEO', 'reed.hastings@netflix.com', '4085558007');


-- insert the data in contactemployee table
INSERT INTO contactemployee (contactemployeeid, contactid, employeeid, contactdate, description) VALUES
(1, 1, 1, '2024-01-01', 'Initial business meeting with Google.'),
(2, 2, 2, '2024-01-03', 'Follow-up discussion with Apple on product collaboration.'),
(3,
 3, 3, '2024-01-05', 'Meeting with Microsoft on cloud services.'),
(4, 4, 4, '2024-01-08', 'Amazon partnership discussion for AWS integration.'),
(5, 5, 5, '2024-01-10', 'Meta advertising strategy collaboration.'),
(6, 6, 6, '2024-01-12', 'Tesla supply chain and logistics discussion.'),
(7, 7, 7, '2024-01-14', 'Netflix content licensing agreement meeting.'),
(8, 8, 8, '2024-01-16', 'Nike product launch and branding collaboration.'),
(9, 9, 9, '2024-01-18', 'Intel hardware procurement negotiation.'),
(10, 10, 10, '2024-01-20', 'IBM cloud service and AI solutions discussion.');

-- Q.4  In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 
SET SQL_SAFE_UPDATES = 0;
update employee 
set phone  = 215-555-8800
where  firstname = "Lesley"  and lastname = "Bland's";

-- Q.5 In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters”
set SQL_SAFE_UPDATES = 0;
update company
set companyname = "Urban Outfitters"
where companyname = "Urban Outfitters, Inc";

-- Q.6  In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).
delete from contactemployee
where contactid = (select contactid from conact where firstname = "Dianne" and lastname = "Connor's")
and employeeid = (select employeeid from employee where firstname = "Jack" and lastname = "Lee");


 -- Q.7 Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in MySQL Workbench. Copy the results below as well
 select  e.firstname, e.lastname  
from employee e  
join contactemployee ce ON e.employeeid = ce.employeeid  
join conact c ON ce.contactid = c.contactid  
join company co ON c.companyid = co.companyid  
where co.companyname = 'Toll Brothers';
-- copy of the result  firstname Jack, lastname Lee

-- Q.8  What is the significance of “%” and “_” operators in the LIKE statement? 
-- In the **`LIKE`** statement, **`%`** and **`_`** are wildcard operators used for pattern matching in SQL:
-- % (Percent Sign)** → Represents **zero, one, or multiple** characters.  
  -- Example:  
   -- sql
    -- SELECT * FROM employees WHERE name LIKE 'A%';
    --  Finds names **starting with 'A'** (e.g., **"Alice", "Alex", "Aaron"**).
-- _ (Underscore)** → Represents **exactly one** character.  
  -- Example:  
    -- sql
   --  SELECT * FROM employees WHERE name LIKE 'J_hn';
    --  Finds names like **"John", "Jahn", "Juhn"**, etc.

-- Q.9 Explain normalization in the context of databases. 
-- Normalization in Databases  
-- Normalization is the process of organizing a database to eliminate redundancy and ensure data integrity. 
-- It involves dividing large tables into smaller related tables to optimize storage and retrieval.  
-- Forms of Normalization:
-- 1NF (First Normal Form) - Ensures atomicity (no multiple values in a single column) and a **unique primary key.  
 -- 2NF (Second Normal Form) - Must be in 1NF and remove partial dependencies (every column must depend on the whole primary key).  
 -- 3NF (Third Normal Form) - Must be in 2NF and remove transitive dependencies (non-key columns must not depend on other non-key columns).
 -- BCNF (Boyce-Codd Normal Form)** → Stronger **3NF**, ensures **every determinant is a candidate key**.  
-- Benefits:  
-- Eliminates redundancy 
-- Ensures data consistency  
-- Improves query efficiency  

-- Q.10 What does a join in MySQL mean?
-- A JOIN in MySQL is used to combine data from two or more tables based on a related column. It helps retrieve meaningful data by establishing relationships between tables.
-- Types of JOINs:
-- INNER JOIN → Returns matching records from both tables.
-- LEFT JOIN → Returns all records from the left table and matching records from the right.
-- RIGHT JOIN → Returns all records from the right table and matching records from the left.
-- FULL JOIN → Returns all records from both tables (Not directly supported in MySQL, can be

-- Q.11 What do you understand about DDL, DCL, and DML in MySQL? 
-- DDL (Data Definition Language) → Defines database structure.
-- Commands: CREATE, ALTER, DROP, TRUNCATE
-- DML (Data Manipulation Language) → Manages data inside tables.
-- Commands: INSERT, UPDATE, DELETE, SELECT
-- DCL (Data Control Language) → Controls user access.
-- Commands: GRANT, REVOKE

-- Q.12 What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 
-- Role of MySQL JOIN Clause
-- The JOIN clause in MySQL is used to combine data from multiple tables based on a related column, making data retrieval more efficient.
-- Common Types of JOINs:
-- INNER JOIN → Returns only matching records from both tables.
-- LEFT JOIN → Returns all records from the left table + matching records from the right.
-- RIGHT JOIN → Returns all records from the right table + matching records from the left.
-- FULL JOIN → Returns all records from both tables (Not directly supported in MySQL, use UNION).








 
