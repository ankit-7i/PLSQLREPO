DECLARE
    Calendor DATE := TO_DATE('01-JAN-2025', 'DD-MON-YYYY');
BEGIN
    FOR i IN 1 .. 365 
    LOOP
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(Calendor, 'DD-MON-YY'));
        Calendor := Calendor + 1;
    END LOOP;
END;
/