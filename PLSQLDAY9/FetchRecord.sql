-- Prompt user to enter Account No
ACCEPT accno_input NUMBER PROMPT 'Enter Account Number: '

-- Declare a PL/SQL block that uses the input
DECLARE
    v_result VARCHAR2(200);
BEGIN
    SELECT 'Account No: ' || ACCNO || ', Name: ' || NAME || ', Balance: ' || BAL
    INTO v_result
    FROM BANK
    WHERE ACCNO = &accno_input;

    DBMS_OUTPUT.PUT_LINE(v_result);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No account found for Account No: ' || &accno_input);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
