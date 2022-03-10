SELECT * FROM EMP;
SELECT * FROM DEPT;

/*REMEMBER THAT WE CAN'T ASSIGN THE VALUE TO THE IN OUT / IN MODE / OUT MNODE */

CREATE OR REPLACE PROCEDURE NEW_PROC_EMP
(
    X IN NUMBER,
    Y IN NUMBER,
    Z OUT NUMBER
)
IS 
BEGIN
    Z:=X+Y;
    -- DBMS_OUTPUT.PUT_LINE(Z);
END NEW_PROC_EMP;

/* CALLING FOR THE OUT DEFINED PROCEDURE */

DECLARE 

RESULT_VAR NUMBER ;

BEGIN

NEW_PROC_EMP(X=>10,Y=>20,Z=>RESULT_VAR);

DBMS_OUTPUT.PUT_LINE(RESULT_VAR);

END;


/* USAGE OF IN OUT PARAMETER */

CREATE OR REPLACE PROCEDURE NEW_PROC_EMP
(
    X IN NUMBER,
    Y IN NUMBER,
    Z IN OUT NUMBER
)
IS 
BEGIN
    Z:=X+Y+Z;
    -- DBMS_OUTPUT.PUT_LINE(Z);
END NEW_PROC_EMP;


DECLARE 

RESULT_VAR NUMBER:=10;

BEGIN

NEW_PROC_EMP(X=>10,Y=>20,Z=>RESULT_VAR);

DBMS_OUTPUT.PUT_LINE(RESULT_VAR);

END