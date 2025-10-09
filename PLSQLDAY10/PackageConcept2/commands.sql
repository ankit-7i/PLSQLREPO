set lines 200 pages 200;

set SERVEROUTPUT ON;

set VERIFY OFF;



create table sales_bonus
(
emp_id number(10),
month varchar2(10),
sales_amt number(10),
bonus number(10)
);


INSERT INTO SALES_BONUS VALUES (101, 'JANUARY', 120000, NULL);
INSERT INTO SALES_BONUS VALUES (102, 'JANUARY', 95000, NULL);
INSERT INTO SALES_BONUS VALUES (103, 'JANUARY', 45000, NULL);
INSERT INTO SALES_BONUS VALUES (104, 'FEBRUARY', 70000, NULL);
INSERT INTO SALES_BONUS VALUES (105, 'FEBRUARY', 30000, NULL);
commit;

SELECT * FROM SALES_BONUS;



-- Assign bonuses for all employees
BEGIN
    bonus_pkg.assign_bonus(101, 'JANUARY');
    bonus_pkg.assign_bonus(102, 'JANUARY');
    bonus_pkg.assign_bonus(103, 'JANUARY');
    bonus_pkg.assign_bonus(104, 'FEBRUARY');
    bonus_pkg.assign_bonus(105, 'FEBRUARY');
END;
/

-- Display the updated data
SELECT * FROM sales_bonus;

-- Test the function
DECLARE
    v_bonus NUMBER;
BEGIN
    v_bonus := bonus_pkg.get_bonus_amount(101, 'JANUARY');
    DBMS_OUTPUT.PUT_LINE('Bonus for Employee 101 (January): ' || v_bonus);
END;
/
