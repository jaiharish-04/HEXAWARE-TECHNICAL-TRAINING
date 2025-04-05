-- 1. The following statement executes successfully (True/False)
SELECT ename, job, sal AS Sal FROM emp;  -- TRUE

-- 2. The following statement executes successfully (True/False)
SELECT * FROM Dept;  -- TRUE

-- 3. Fix the errors in this statement:
-- Original: SELECT empno, ename Sal x 12 ANNUAL SALARIES FROM emp;
-- Corrected Version:
SELECT empno, ename, sal * 12 AS "ANNUAL SALARIES" FROM emp;

-- 4. Show the structure of the DEPT table and all its data
EXEC sp_help DEPT;
SELECT * FROM DEPT;

-- 5. Show structure of EMP table and query employee details with an alias for HIREDATE
SELECT EMPNO AS "EMP #", 
       ENAME AS "Employee", 
       JOB AS "Job Title", 
       MGR, 
       HIREDATE AS "STARTDATE", 
       SAL, 
       COMM, 
       DEPTNO 
FROM EMP;

-- 6. Display unique job titles
SELECT DISTINCT JOB FROM EMP;

-- 7. Reformat column headers from Question 5
SELECT EMPNO AS "EMP #", 
       ENAME AS "Employee", 
       JOB AS "Job Title", 
       HIREDATE AS "Hire Date" 
FROM EMP;


-- RESTRICTING AND SORTING


-- 1. Employees earning more than 2000
SELECT ENAME, SAL FROM EMP WHERE SAL > 2000;

-- 2. Employee name and department number for employee 7902
SELECT ENAME, DEPTNO FROM EMP WHERE EMPNO = 7902;

-- 3. Employees whose salary is NOT in the range 2000-5000
SELECT ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 2000 AND 5000;

-- 4. Employees hired between February 20, 1981, and May 1, 1981, sorted by HIREDATE
SELECT ENAME, JOB, HIREDATE 
FROM EMP 
WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01' 
ORDER BY HIREDATE ASC;

-- 5. Employees from departments 10 and 30 sorted alphabetically by name
SELECT ENAME, DEPTNO 
FROM EMP 
WHERE DEPTNO IN (10, 30) 
ORDER BY ENAME;

-- 6. Employees earning between 2000 and 3000 in department 10 or 30
SELECT ENAME AS "Employee", SAL AS "Monthly Salary" 
FROM EMP 
WHERE SAL BETWEEN 2000 AND 3000 
AND DEPTNO IN (10, 30);

-- 7. Employees hired in the year 1981
SELECT ENAME, HIREDATE 
FROM EMP 
WHERE YEAR(HIREDATE) = 1981;

-- 8. Employees who do not have a manager
SELECT ENAME, JOB FROM EMP WHERE MGR IS NULL;

-- 9. Employees who earn commissions, sorted by salary and commission in descending order
SELECT ENAME, SAL, COMM 
FROM EMP 
WHERE COMM IS NOT NULL 
ORDER BY SAL DESC, COMM DESC;

-- 10. Employees whose third letter in the name is 'A'
SELECT ENAME 
FROM EMP 
WHERE ENAME LIKE '__A%';

-- 11. Employees whose last name contains both 'A' and 'E'
SELECT ENAME 
FROM EMP 
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';

-- 12. Employees who are either SALESMAN or CLERK and salary is NOT 1600, 8000, or 1300
SELECT ENAME, JOB, SAL 
FROM EMP 
WHERE JOB IN ('SALESMAN', 'CLERK') 
AND SAL NOT IN (1600, 8000, 1300);

-- 13. Employees whose commission is greater than 20% of their salary
SELECT ENAME, SAL, COMM 
FROM EMP 
WHERE COMM > (SAL * 0.2);
