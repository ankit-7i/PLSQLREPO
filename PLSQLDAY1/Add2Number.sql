DECLARE 
        x NUMBER(3);
        y NUMBER(3);
        z NUMBER(3);
BEGIN 
        x := &x;
        y := &y;
        z := x+y;
        dbms_output.put_line('Sum '||z);
END;
/