DECLARE 
        age number(3);

BEGIN 
        age := &age;
        If (age >= 18) THEN  
            DBMS_OUTPUT.PUT_LINE('You are elgible For voting');
        END IF;
        IF (age < 18) THEN 
            DBMS_OUTPUT.PUT_LINE('Sorry You are not Eligible For Voting');
        END IF;
END;
/