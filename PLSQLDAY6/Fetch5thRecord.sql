DECLARE
      cursor c2 is select * from emp;
BEGIN  
      
    FOR i in c2 
    LOOP
        IF c2%ROWCOUNT = 5 then 

        DBMS_OUTPUT.PUT_LINE(i.empno ||'   ' ||  i.ename || '   ' || i.sal ||'   ' ||i.job ||'   '||i.hiredate);
        END IF;
        END LOOP;
END;
/