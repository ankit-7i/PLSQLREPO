CREATE OR REPLACE PACKAGE BODY bonus_pkg AS

    -- Procedure: calculates and updates bonus
    PROCEDURE assign_bonus(p_emp_id IN NUMBER, p_month IN VARCHAR2) IS
        v_sales_amt NUMBER;
        v_bonus     NUMBER;
    BEGIN
        -- Fetch sales amount for given employee and month
        SELECT sales_amt INTO v_sales_amt
        FROM sales_bonus
        WHERE emp_id = p_emp_id
          AND UPPER(month) = UPPER(p_month);

        -- Calculate bonus based on sales amount
        IF v_sales_amt > 100000 THEN
            v_bonus := v_sales_amt * 0.15;
        ELSIF v_sales_amt BETWEEN 50000 AND 100000 THEN
            v_bonus := v_sales_amt * 0.10;
        ELSE
            v_bonus := v_sales_amt * 0.05;
        END IF;

        -- Update bonus column in the table
        UPDATE sales_bonus
        SET bonus = v_bonus
        WHERE emp_id = p_emp_id
          AND UPPER(month) = UPPER(p_month);

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Bonus assigned successfully for Emp ID ' || p_emp_id);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No record found for Employee ID ' || p_emp_id || ' and Month ' || p_month);
    END assign_bonus;


    -- Function: returns the bonus amount for an employee and month
    FUNCTION get_bonus_amount(p_emp_id IN NUMBER, p_month IN VARCHAR2)
        RETURN NUMBER
    IS
        v_bonus NUMBER;
    BEGIN
        SELECT bonus INTO v_bonus
        FROM sales_bonus
        WHERE emp_id = p_emp_id
          AND UPPER(month) = UPPER(p_month);

        RETURN v_bonus;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END get_bonus_amount;

END bonus_pkg;
/
