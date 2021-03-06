
CREATE OR REPLACE PACKAGE FORWARD_PKG IS
FUNCTION CALLING_FUNC(
    INPUT_VAL IN NUMBER
)RETURN NUMBER ;
END FORWARD_PKG ;

CREATE OR REPLACE PACKAGE BODY FORWARD_PKG IS 
FUNCTION CALLED_FUNC(
    X IN NUMBER
)RETURN NUMBER;
FUNCTION CALLING_FUNC(
    INPUT_VAL IN NUMBER
)RETURN NUMBER
IS
    OUTPUT_VAL NUMBER ;
    FETCH_VAL NUMBER ;
BEGIN
    FETCH_VAL:=CALLED_FUNC(INPUT_VAL);
    OUTPUT_VAL:=FETCH_VAL*10;
    DBMS_OUTPUT.PUT_LINE(OUTPUT_VAL);
    RETURN OUTPUT_VAL ;
END CALLING_FUNC ;

FUNCTION CALLED_FUNC(
    X IN NUMBER
)RETURN NUMBER
IS 
    OUT_VAL NUMBER ;
BEGIN
    OUT_VAL:=X*10;
    DBMS_OUTPUT.PUT_LINE(OUT_VAL);
    RETURN OUT_VAL;
END CALLED_FUNC ;

END FORWARD_PKG ;

DECLARE

    RESULT_VAR NUMBER;

BEGIN

RESULT_VAR:=FORWARD_PKG.CALLING_FUNC(5);

END;


