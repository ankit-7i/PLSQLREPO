DECLARE 
        E_Empno emp.empno%type;
        r1 EMP%rowtype;
BEGIN   
        E_Empno := &empno;

        SELECT * into r1 from emp where empno = E_Empno;
        dbms_output.put_line(r1.ename ||'   '|| r1.sal || '   '|| r1.hiredate);
END;
/