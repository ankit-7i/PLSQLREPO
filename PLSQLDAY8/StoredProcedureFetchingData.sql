-- Step 1: Create the procedure
CREATE OR REPLACE PROCEDURE FetchEmployeeData (
    p_emp_id     IN  NUMBER,
    p_emp_name   OUT VARCHAR2,
    p_emp_salary OUT NUMBER
)
AS
BEGIN
    -- Fetch employee details from the table
    SELECT ename, sal
    INTO p_emp_name, p_emp_salary
    FROM emp
    WHERE empno = p_emp_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || p_emp_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END FetchEmployeeData;
/


--
-- Step 2: Call the procedure and display results
--SET SERVEROUTPUT ON;

DECLARE
    v_emp_id    NUMBER := &empid;  -- 👈 user will be prompted to enter empid
    v_name      VARCHAR2(50);
    v_salary    NUMBER;
BEGIN
    FetchEmployeeData(v_emp_id, v_name, v_salary);

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_salary);
END;
/
 