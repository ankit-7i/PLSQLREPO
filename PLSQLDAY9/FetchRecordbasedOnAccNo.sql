CREATE OR REPLACE FUNCTION FetchBANKACCDETAILS (ACCOUNTNO IN NUMBER)
RETURN VARCHAR2
IS
    result VARCHAR2(200);
BEGIN
    SELECT 'Account No: ' || ACCNO || ', Name: ' || NAME || ', Balance: ' || BAL
    INTO result
    FROM BANK
    WHERE ACCNO = ACCOUNTNO;

    RETURN result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No account found for Account No: ' || ACCOUNTNO;
    WHEN OTHERS THEN
        RETURN 'An error occurred: ' || SQLERRM;
END;
/



