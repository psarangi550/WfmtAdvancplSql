
DECLARE 

    COUNTER NUMBER:=10;
    LOOPVAL NUMBER:=1;

BEGIN

    WHILE ( LOOPVAL <= 10)  
    LOOP
        DBMS_OUTPUT.PUT_LINE('COUNTER IS' || (COUNTER+LOOPVAL ));
        LOOPVAL:=LOOPVAL+1;
    END LOOP;

END;



/*
FOR LOOP
*/


DECLARE 
    COUNTER NUMBER :=10;
    ITER NUMBER:=0;

BEGIN

    FOR ITER  IN  10..1
    LOOP
        DBMS_OUTPUT.PUT_LINE('COUNTER IS ' || (COUNTER+ITER) );
    END LOOP;

END;

/*
SELECTING DATA AND ASSIGNING TO VARIABLE 
*/

DECLARE 
    C_NUMBER NUMBER ;
    C_NAME VARCHAR2(50);
BEGIN
    SELECT E.EMPNO,E.ENAME INTO C_NUMBER,C_NAME
    FROM EMP E 
    WHERE EMPNO=7839;
    DBMS_OUTPUT.PUT_LINE(C_NUMBER);
    DBMS_OUTPUT.PUT_LINE(C_NAME);
END;

/*
USING THE % DATA TYPE
*/


DECLARE 
    C_NUMBER EMP.EMPNO%TYPE ;
    C_NAME EMP.ENAME%TYPE;
BEGIN
    SELECT E.EMPNO,E.ENAME INTO C_NUMBER,C_NAME
    FROM EMP E 
    WHERE EMPNO=7839;
    DBMS_OUTPUT.PUT_LINE(C_NUMBER);
    DBMS_OUTPUT.PUT_LINE(C_NAME);
END;






