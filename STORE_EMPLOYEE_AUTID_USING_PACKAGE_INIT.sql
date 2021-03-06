
/* TACKING THE DELETION USING PACKAGE INTIALISATION*/

/* FETCHING THE ERROR PLS-00323: subprogram or cursor IF THE PACKAGE HEADER PROCEDURE DECLARATION DIFFER FROM PACKAGE BODY */

/*CREATING THE TRACLER TABLE */

CREATE TABLE SALES_AUDIT(
    USERNAME VARCHAR2(255),
    SYS_DATE DATE,
    SALE_ID NUMBER
);

/*DEFINING THE TABLE */
SELECT * FROM STORES_EMPLOYEE;

/* DEFINING THE  PACKAGE HEADER */

CREATE OR REPLACE PACKAGE STORE_PKG IS 
        PROCEDURE DEL_STORE_VAL(
            STORES_ID IN NUMBER
        );
    END STORE_PKG ;

/*DEFINING THE PACKAGE BODY */

CREATE OR REPLACE PACKAGE BODY STORE_PKG IS
    UNAME SALES_AUDIT.USERNAME%TYPE;
    SYSD SALES_AUDIT.SYS_DATE%TYPE ;
    PROCEDURE SALES_AUDIT_PROC 
    (
        USER_NAME IN SALES_AUDIT.USERNAME%TYPE,
        SYSTEM_DATE IN SALES_AUDIT.SYS_DATE%TYPE,
        STORE_ID_VAL IN NUMBER
    )
    IS 
    BEGIN
        INSERT INTO SALES_AUDIT(USERNAME,SYS_DATE,SALE_ID) VALUES (USER_NAME,SYSTEM_DATE,STORE_ID_VAL);
    END SALES_AUDIT_PROC ;

    PROCEDURE DEL_STORE_VAL
    (
        STORES_ID IN NUMBER
    )
    IS
    BEGIN
        DELETE FROM STORES_EMPLOYEE WHERE STORES_ID=STORES_ID;
        IF SQL%ROWCOUNT !=0 THEN
            SALES_AUDIT_PROC(UNAME,SYSD,STORES_ID);
        ELSE
            DBMS_OUTPUT.PUT_LINE('SOMETHING WENT WRONG');
        END IF ;
    END DEL_STORE_VAL;

    BEGIN
        SELECT USER,SYSDATE INTO UNAME,SYSD
        FROM DUAL;
END STORE_PKG ;

/*CALLING THE PACKAGE */

BEGIN

STORE_PKG.DEL_STORE_VAL(1003);

END

/* CHECKING THE AUDIT DATA */

SELECT * FROM SALES_AUDIT;