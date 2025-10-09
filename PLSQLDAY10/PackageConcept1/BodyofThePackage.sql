
CREATE Or REPLACE Package BODY emp_pkg AS

    FUNCTION add_bonus (p_emp_id IN NUMBER, p_bonus IN NUMBER) Return NUMBER IS
        v_salary NUMBER;
        BEGIN
    
        SELECT sal INTO v_salary FROM emp WHERE empno = p_emp_id;
        v_salary := v_salary + p_bonus;
        RETURN v_salary;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END add_bonus;

END emp_pkg;
/