
DECLARE 
    TOTAL_AMOUNT NUMBER:=47;
    DISCOUNT NUMBER:=0;
    OUTPUT NUMBER :=0;
BEGIN
    CASE
    WHEN ( TOTAL_AMOUNT > 100 ) THEN
    DISCOUNT:=0.5;
    OUTPUT:=TOTAL_AMOUNT*DISCOUNT;
    DBMS_OUTPUT.PUT_LINE(OUTPUT);
    WHEN ( TOTAL_AMOUNT> 50 AND TOTAL_AMOUNT < 100 ) THEN
    DISCOUNT:=0.7;
    OUTPUT:=TOTAL_AMOUNT*DISCOUNT;
    DBMS_OUTPUT.PUT_LINE(OUTPUT);
    ELSE
    DISCOUNT:=0.9;
    OUTPUT:=TOTAL_AMOUNT*DISCOUNT;
    DBMS_OUTPUT.PUT_LINE(OUTPUT);
    END CASE;
END;