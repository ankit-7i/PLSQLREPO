DECLARE
    E_empno emp.empno%type;
    E_amount NUMBER(7,2);
    E_sal emp.sal%type;
BEGIN 
    E_empno := &empno;
    E_amount := &amount;

    Update  emp 
    set sal = sal + E_amount 
    where empno = E_empno;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('salary is increased');
    SELECT sal into E_sal FROM emp where empno = E_empno;
    DBMS_OUTPUT.PUT_LINE('Salary is '||E_sal);
END;
/
