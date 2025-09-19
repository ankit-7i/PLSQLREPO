DECLARE 
        E_Empno emp.empno%type;
        E_hiredate emp.hiredate%type;
        E_exp INT;
BEGIN 
        E_Empno := &empno;
        SELECT hiredate into E_hiredate from emp WHERE empno = E_Empno;
        E_exp  := TRUNC((sysdate - E_hiredate)/365);
        dbms_output.put_line('EXPERIENCE = '||E_exp ||'YEARS');
END;
/ 