DECLARE 

    TOTAL_SALE NUMBER:=100;
    DISCOUNT NUMBER:=0;
    RESULT_VAR NUMBER:=0;

BEGIN

    IF TOTAL_SALE>90 THEN
        RESULT_VAR:=TOTAL_SALE*0.2;
        DBMS_OUTPUT.PUT_LINE('RESULT IS ' || RESULT_VAR);
    ELSE
        RESULT_VAR:=TOTAL_SALE*0.1;
        DBMS_OUTPUT.PUT_LINE('RESULT IS ' || RESULT_VAR);
    END IF;
END;


DECLARE 

    TOTAL_SALE NUMBER:=100;
    DISCOUNT NUMBER:=0;
    RESULT_VAR NUMBER:=0;

BEGIN

    CASE 
    WHEN TOTAL_SALE>90 THEN
        RESULT_VAR:=TOTAL_SALE*0.2;
        DBMS_OUTPUT.PUT_LINE('RESULT IS ' || RESULT_VAR);
    WHEN TOTAL_SALE<90 THEN
        RESULT_VAR:=TOTAL_SALE*0.1;
        DBMS_OUTPUT.PUT_LINE('RESULT IS ' || RESULT_VAR);
    END CASE;
END;


    