DECLARE
        E_sal number(7,2);
BEGIN 
        SELECT max(sal) INTO E_sal FROM emp;
        dbms_output.put_line('MAX SAL '|| E_sal);
END;
/