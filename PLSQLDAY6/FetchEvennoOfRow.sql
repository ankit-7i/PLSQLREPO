DECLARE
    CURSOR c4 is select * from emp;
BEGIN 
    FOR i in c4

    LOOP 
        If MOD(c4%ROWCOUNT,2)=0  then
                  DBMS_OUTPUT.PUT_LINE(i.empno ||'   ' ||  i.ename || '   ' || i.sal ||'   ' ||i.job ||'   '||i.hiredate);
        END IF;
    END LOOP;
END;
/

