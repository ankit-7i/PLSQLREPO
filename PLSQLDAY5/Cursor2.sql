DECLARE

        CURSOR sumcurs1 is SELECT sal from emp;
        E_sal emp.sal%type;
        sumcount number(8,2);

BEGIN 
        OPEN sumcurs1;
            sumcount := 0;
        Loop 
            
            FETCH sumcurs1 INTO E_sal;
            EXIT WHEN sumcurs1%notfound;
            sumcount := sumcount+E_sal;
            END LOOP;

            DBMS_OUTPUT.PUT_LINE('Total Sum =' || sumcount);
            CLOSE sumcurs1;
END;
/