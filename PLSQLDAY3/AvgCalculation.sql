 DECLARE 
        S_id STUDENT222.sid%type;
        r STUDENT222%rowtype;
        total Number (7,2);
        average NUMBER(7,2);
        res VARCHAR2(4);
BEGIN   
        S_id := &sid;
        SELECT *
        INTO r
        FROM STUDENT222
        WHERE SID = S_id;

        total := r.SUB1 +r.SUB2 +r.SUB3;
        average  := total/3;
        IF (r.SUB1 >= 35 AND r.SUB2 >= 35 AND r.SUB3 >= 35) THEN
        res := 'PASS';
        ELSE
        res := 'FAIL';
        END IF;

                
         INSERT INTO RESULTS (SID, TOTAL, AVG, RESULT)
         VALUES (r.SID, total, average, res);

    COMMIT;
END;
/

        