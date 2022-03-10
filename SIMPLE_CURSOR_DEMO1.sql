
/* SIMPLE LOOP USING THE EXIT AND WHEN  AND IF AND ELSE BLOCK */

DECLARE 
    X NUMBER:=10 ;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE(X);
        X:=X+1;
        EXIT WHEN X=20 ;
    END LOOP ;

END ;

/* ALTERNATE APPROACH */

DECLARE 
    X NUMBER:=10 ;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE(X);
        X:=X+1;
        IF X > 20 THEN
            EXIT ;
        END IF ;
    END LOOP ;

END ;
