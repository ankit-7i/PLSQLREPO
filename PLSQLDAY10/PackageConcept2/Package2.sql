CREATE OR REPLACE PACKAGE bonus_pkg AS
    -- Procedure to assign bonus
    PROCEDURE assign_bonus(p_emp_id IN NUMBER, p_month IN VARCHAR2);

    -- Function to get bonus amount
    FUNCTION get_bonus_amount(p_emp_id IN NUMBER, p_month IN VARCHAR2)
        RETURN NUMBER;
END bonus_pkg;
/
