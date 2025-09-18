DECLARE 
        V_empno number (4);
        V_ename varchar2(10);
        V_sal number(7,2);

BEGIN 
        V_empno := &empno;
        SELECT ename,sal INTO V_ename,V_sal from emp WHERE empno = V_empno;

        dbms_output.put_line(V_ename || '   ' ||V_sal);
END;
/