
DECLARE 
        CURSOR cus1 is SELECT  ename,sal from emp;
        E_ename emp.ename%type;
        E_sal emp.sal%type;
BEGIN 
        OPEN cus1;

        LOOP 
            FETCH  cus1 INTO E_ename,E_sal;
            EXIT WHEN cus1%notfound;

            

            DBMS_OUTPUT.PUT_LINE(E_ename || '  '||E_sal);

            END LOOP;


            DBMS_OUTPUT.PUT_LINE(cus1%rowcount || ' Rows Fetched');
            CLOSE cus1;

END;
/