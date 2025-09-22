DECLARE 
        S_SID STUDENT111.SID%type;
        S_marks STUDENT111.MARKS%type;

BEGIN 
        S_SID := &sid;
        SELECT MARKS into S_marks from STUDENT111 Where SID =S_SID;
        if(S_marks>=90) THEN 
         DBMS_OUTPUT.PUT_LINE('Grade - A');
        ELSIF (S_marks >= 80) THEN  
         DBMS_OUTPUT.PUT_LINE('Grade - B');
        ELSIF (S_marks >= 70) THEN 
         DBMS_OUTPUT.PUT_LINE('Grade - C');
        ELSIF (S_marks >= 40)THEN 
         DBMS_OUTPUT.PUT_LINE('Grade - D');
        ELSE
          DBMS_OUTPUT.PUT_LINE('Fail');
        END IF;
END;
/
    