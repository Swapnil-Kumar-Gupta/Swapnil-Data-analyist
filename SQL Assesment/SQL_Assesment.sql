create database DA_SQL;
use DA_SQl;
CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Nihanka', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

-- Q.1  Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker order by FIRST_NAME asc, DEPARTMENT desc; 

-- Q.2 Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table. 
select * from  Worker where FIRST_NAME in  ("Vipul","Satish");

-- Q.3 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 

select * from Worker where FIRST_NAME like "%h";
-- Q.4 Write an SQL query to print details of the Workers whose SALARY lies between 1
select * from Worker where SALARY between 1 and 

-- Q.5 Write an SQL query to fetch duplicate records having matching data in some fields of a table.


-- Q.6. Write an SQL query to show the top 6 records of a table

select * from Worker order by salary desc limit 6;

-- Q.7. Write an SQL query to fetch the departments that have less than five people in them.
select department from Worker  group by department having <5;
-- Q.8  Write an SQL query to show all departments along with the number of people in there.
-- Q.9 Write an SQL query to print the name of employees having the highest salary in each department.



