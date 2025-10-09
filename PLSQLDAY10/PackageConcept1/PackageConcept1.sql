

CREATE Or REPLACE PACKAGE emp_pkg  AS  
    FUNCTION add_bonus (p_emp_id IN NUMBER, p_bonus IN NUMBER) Return NUMBER;

END;
/