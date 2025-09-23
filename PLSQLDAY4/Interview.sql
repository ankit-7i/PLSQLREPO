BEGIN

    FOR i IN REVERSE 1 .. 10
    LOOP 
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/

 SET SERVEROUTPUT ON;

 CREATE TABLE EMPLOYEE (
    EMPLOYEEID     NUMBER(4) PRIMARY KEY,
    NAME           VARCHAR2(10),
    ROLE           VARCHAR2(25),
    DEPARTMENT     VARCHAR2(15),
    JOINING_YEAR   NUMBER(5),
    COMPUTERID     NUMBER(4)
   );

INSERT INTO EMPLOYEE VALUES(103,'Tirumala','Web Developer','Support',2022, 526);
INSERT INTO EMPLOYEE VALUES(104,'Varsha','Full Stack Developer','Installation', 2021, 105);
INSERT INTO EMPLOYEE VALUES (105,'Narendra','Front End Developer','Enhancement',  2023, 104);
INSERT INTO EMPLOYEE VALUES (106,'Sonia','Web Developer','Support',2020, 530);

COMMIT;

CREATE TABLE COMPUTER (
    COMPUTERID        NUMBER(10) PRIMARY KEY,
    YEAROFPURCHASE    NUMBER(4),
    BRAND             VARCHAR2(10),
    OPERATINGSYSTEM   VARCHAR2(15),
    STATUS            VARCHAR2(15)
);

INSERT INTO COMPUTER VALUES (104, 2021, 'Dell', 'Windows', 'Working');
INSERT INTO COMPUTER VALUES (530, 2023, 'Dell', 'Windows', 'Not Working');
INSERT INTO COMPUTER VALUES (526, 2023, 'Mac',  'Windows', 'Working');
INSERT INTO COMPUTER VALUES (105, 2022, 'HP',   'Linux',   'Working');
COMMIT;
 

 SELECT * FROM COMPUTER;

 SELECT * FROM EMPLOYEE;


--1 
 SELECT * FROM COMPUTER where STATUS ='Not Working';
--2

 select DEPARTMENT , COUNT(*) AS EMPCOUNT from EMPLOYEE GROUP BY DEPARTMENT;

 --3
    SELECT ROLE from EMPLOYEE;

--4 
SELECT BRAND FROM COMPUTER where OPERATINGSYSTEM = 'Linux';


--1
SELECT COUNT(*) AS NotWorkingComputers
FROM Computer
WHERE YearOfPurchase >= YEAR(CURDATE()) - 2
  AND Status = 'Not Working';

--2
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department;

--3
SELECT DISTINCT Role
FROM Employee;

--4
SELECT *
FROM Computer
WHERE Brand = 'Dell'
  AND OperatingSystem = 'Linux'
  AND Status = 'Working';

--5
SELECT E.Name
FROM Employee E
JOIN Computer C ON E.ComputerID = C.ComputerID
WHERE C.Status = 'Not Working';


--6
SELECT E.Name, C.OperatingSystem
FROM Employee E
JOIN Computer C ON E.ComputerID = C.ComputerID;






--9
SELECT E.Name
FROM Employee E
JOIN Computer C ON E.ComputerID = C.ComputerID
WHERE (2025 - E.JoiningYear) < (2025 - C.YearOfPurchase);

