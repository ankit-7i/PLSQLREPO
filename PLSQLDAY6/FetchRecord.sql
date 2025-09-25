DECLARE 
        c1 SYS_REFCURSOR;
        r1 emp%rowtype;
BEGIN 

    OPEN c1 FOR SELECT * FROM emp;
    LOOP 
        FETCH c1 into r1 ;
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(r1.empno ||'   ' ||  r1.ename || '   ' || r1.sal ||'   ' ||r1.job ||'   '||r1.hiredate);
        END LOOP;
END;
/
