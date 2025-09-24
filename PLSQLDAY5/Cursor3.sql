DECLARE
    CURSOR c1 IS
        SELECT ENAME, PROCESSED, BONUS_AMOUNT
        FROM EMPLOYEE_BONUS
        WHERE PROCESSED = 'N';

    v_name   EMPLOYEE_BONUS.ENAME%TYPE;
    v_proc   EMPLOYEE_BONUS.PROCESSED%TYPE;
    v_bonus  EMPLOYEE_BONUS.BONUS_AMOUNT%TYPE;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v_name, v_proc, v_bonus;
        EXIT WHEN c1%NOTFOUND;

    
        IF v_bonus < 1000 THEN
            v_bonus := v_bonus + (v_bonus * 0.20);
        ELSE
            v_bonus := v_bonus + (v_bonus * 0.10);
        END IF;

    
        UPDATE EMPLOYEE_BONUS
        SET BONUS_AMOUNT = v_bonus,
            PROCESSED    = 'Y'
        WHERE ENAME = v_name;
        
        --DBMS_OUTPUT.PUT_LINE(v_name || '   '|| v_proc);
        DBMS_OUTPUT.PUT_LINE(v_name || ' updated bonus = ' || v_bonus);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(c1%ROWCOUNT || ' rows processed.');

    CLOSE c1;


    --DELETE FROM EMPLOYEE_BONUS
    --WHERE BONUS_AMOUNT > 5000;

    --DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' rows deleted with bonus > 5000.');
END;
/
