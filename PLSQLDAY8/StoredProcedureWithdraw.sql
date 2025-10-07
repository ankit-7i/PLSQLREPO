
CREATE OR REPLACE PROCEDURE WithdrawAmount (
    p_accno  IN  NUMBER,
    p_amount IN  NUMBER
)
AS
    v_balance  NUMBER;
BEGIN
    -- Get the current balance
    SELECT bal INTO v_balance
    FROM bank
    WHERE accno = p_accno;

    -- Check if sufficient balance
    IF p_amount > v_balance THEN
        DBMS_OUTPUT.PUT_LINE('Insufficient funds');
    ELSE
        -- Deduct the amount and update balance
        UPDATE bank
        SET bal = bal - p_amount
        WHERE accno = p_accno;

        DBMS_OUTPUT.PUT_LINE('Transaction successful');
        DBMS_OUTPUT.PUT_LINE('Amount withdrawn: ' || p_amount);
        DBMS_OUTPUT.PUT_LINE('Remaining balance: ' || (v_balance - p_amount));
    END IF;

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account number ' || p_accno || ' not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END WithdrawAmount;
/
-- Call the procedure and display results
SET SERVEROUTPUT ON;
DECLARE
    v_accno  NUMBER := &accno;  -- 👈 user will be prompted to enter accno
    v_amount NUMBER := &amount;  -- 👈 user will be prompted to enter amount
BEGIN
    WithdrawAmount(v_accno, v_amount);
END;
/
