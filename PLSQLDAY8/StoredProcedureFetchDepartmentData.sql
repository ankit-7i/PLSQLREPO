CREATE OR REPLACE PROCEDURE FetchDeptData (
    p_deptno   IN  NUMBER,
    p_dname    OUT VARCHAR2,
    p_loc      OUT VARCHAR2
)
AS
BEGIN
    -- Fetch department details
    SELECT dname, loc
    INTO p_dname, p_loc
    FROM dept
    WHERE deptno = p_deptno;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No department found with DeptNo: ' || p_deptno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END FetchDeptData;
/


-- Call the procedure and display results
--SET SERVEROUTPUT ON;


DECLARE
    v_deptno  NUMBER := &deptno;  
    v_dname   VARCHAR2(30);
    v_loc     VARCHAR2(30);
BEGIN
    -- Call the procedure
    FetchDeptData(v_deptno, v_dname, v_loc);

    -- Display results
    DBMS_OUTPUT.PUT_LINE('Department No: ' || v_deptno);
    DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_dname);
    DBMS_OUTPUT.PUT_LINE('Location: ' || v_loc);
END;
/
