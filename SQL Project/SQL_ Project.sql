CREATE DATABASE SQL_PROJECT;
use SQL_PROJECT;
create table DEPT (
    Deptno int not null  primary key default 0,
    Dname varchar(14) default null,
    Loc varchar(13) default null
);
select*from DEPT;

create table  EMP (
    Empno int not null primary key default 0,
    Ename varchar(10) default null,
    Job varchar(9) default null,
    Mgr int default null,
    Hiredate date default null,
    Sal decimal(7,2) default null,
    Comm decimal(7,2) default null,
    Deptno int default null,
    foreign key(Deptno) references DEPT(Deptno)
);
select * from EMP;

INSERT INTO DEPT (Deptno, dname, loc) VALUES 
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP (Empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-06-11', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-08-09', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-03-12', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-03-12', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);

-- Q.1. Select unique job from EMP table.
select distinct job from EMP;
-- Q.2. List the details of the emps in asc order of the Dptnos and desc of Jobs? 
select * from EMP order by Deptno asc, job desc  ;
-- Q.3. Display all the unique job groups in the descending order? 
select distinct job from EMP order by job desc;
-- Q.4. List the emps who joined before 1981. 
select * from EMP where hiredate<"1981-01-01";
-- Q.5.List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal. 
select Empno, ename, sal,(sal/30) as Daily_sal, (sal*12) as Annual_sal from Emp
order by Annual_sal asc;
-- Q.6.List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369. 
select Empno, ename, sal, DATEDIFF(CURDATE(), hiredate)from EMP as EXP where mgr=7369;
-- Q.7.Display all the details of the emps who’s Comm. Is more than their Sal?
select * from EMP where comm > sal;
-- Q.8.List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
select * from EMP where job="CLERK" or job= "ANALYST" order by ename;
-- Q.9.List the emps Who Annual sal ranging from 22000 and 45000.
select * from EMP where (sal*12) between 22000 and 45000; 
-- Q.10.List the Enames those are starting with ‘S’ and with five characters. 
select ename from EMp where ename like "S%";
select ename from EMp where ename like "S____";
-- Q.11.List the emps whose Empno not starting with digit78.
select * from EMP where Empno not like  "78%";
-- Q.12. List all the Clerks of Deptno 20. 
select * from EMP where job="Clerk" and Deptno=20;
-- Q.13.List the Emps who are senior to their own MGRS.
select emp.Empno,emp.Ename,emp.Mgr,emp.Hiredate as HireDate_Emp,Manager.Mgr,Manager.Ename as manager_name,Manager.Hiredate as Hiredate_manager from emp

join emp as Manager 
on emp.Empno=Manager.Mgr
where emp.Hiredate < Manager.Hiredate;


-- Q.14. List the Emps of Deptno 20 who’s Jobs are same as Deptno10.
select * from EMP where Deptno=20 and job in(select distinct job from EMP where Deptno=10);
-- Q.15. List the Emps who’s Sal is same as FORD or SMITH in desc order of Sal.
select * from EMP where sal in (select sal from EMP where  ename in ("SMITH","FORD")) order by sal desc;
-- Q.16.List the emps whose jobs same as SMITH or ALLEN.
select * from EMP where job in(select job from EMP where ename in ("SMITH","ALLEN"));
-- Q.17.Any jobs of deptno 10 those that are not found in deptno 20. 
select distinct job from EMP where Deptno =10 and job not in(select distinct job from EMP where Deptno=20);
-- Q.18. Find the highest sal of EMP table. 
select max(sal) from EMP;
-- Q.19. Find details of highest paid employee.
select * from EMP where sal in(select max(sal) from EMP);
-- Q.20. Find the total sal given to the MGR.
select sum(sal) from EMP where job="MANAGER";
-- Q.21. List the emps whose names contains ‘A’. 
select * from EMP where ename like "%A%";
-- Q.22. Find all the emps who earn the minimum Salary for each job wise in ascending order.
select Empno, ename, job, deptno, sal from EMP e1 where sal = (select min(sal) from  EMP e2 where e1.job = e2.job)
order by job asc, sal asc;
-- Q.23. List the emps whose sal greater than Blake’s sal.
select * from EMP where sal>(select sal from EMP where ename="Blake");
-- Q.24. Create view v1 to select ename, job, dname, loc whose deptno are same
create view v1 as
select e.ename, e.job, d.Dname, d.loc from EMP e
join DEPT d on e.deptno=d.deptno;
select*from v1
-- Q.25.Create a procedure with dno as input parameter to fetch ename and dname.
CALL EMPDATA(20);
-- Q.26. Add column Pin with bigint data type in table student
CREATE TABLE STUDENT (
    Rno INT NOT NULL PRIMARY KEY DEFAULT 0,
    Sname VARCHAR(14) DEFAULT NULL,
    City VARCHAR(20) DEFAULT NULL,
    State VARCHAR(20) DEFAULT NULL
);
alter table STUDENT add column Pin bigint;
-- Q.27.Modify the student table to change the sname length from 14 to 40. Create trigger to insert data in emp_log table whenever any update of sal  
-- in EMP table. You can set action as ‘New Salary’.
alter table STUDENT modify  Sname varchar(40);
CREATE TABLE EMP_LOG (
    Emp_id INT NOT NULL,
    Log_date DATE DEFAULT NULL,
    New_salary INT DEFAULT NULL,
    Action VARCHAR(20) DEFAULT NULL
);

delimiter //
create trigger New_salary 
after update on emp
for each row 
Begin
if old.Sal <> New.Sal then
insert into emp_log(Emp_id,Log_Date,New_salary,Action) values(old.Empno,Now(),new.Sal,'New_Salary');
End if ; 

End //
delimiter ;








