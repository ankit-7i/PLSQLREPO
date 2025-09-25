DECLARE
    CURSOR c5 is select * from emp order by sal desc;
BEGIN 
    FOR i in c5
    LOOP
        if c5%ROWCOUNT = 5 then 
        
    DBMS_OUTPUT.PUT_LINE(i.empno ||'   ' ||  i.ename || '   ' || i.sal ||'   ' ||i.job ||'   '||i.hiredate);
    END IF;
    END LOOP;
END;
/

