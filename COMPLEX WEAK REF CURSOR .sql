/* COMPLEX WEAK REF  CURSOR EXAMPLE */

SELECT * FROM EMP ;

SELECT * FROM DEPT;


CREATE OR REPLACE PROCEDURE OPEN_CUR_PROC
(
    DEPT_NO IN EMP.DEPTNO%TYPE,
    EMP_CUR_SET OUT Sys_RefCursor
)
IS
BEGIN
    OPEN EMP_CUR_SET FOR SELECT EMPNO,SAL FROM EMP WHERE DEPTNO=DEPT_NO ;
END;
/

/* FETCHING AND CLOSING THE CURSOR */

CREATE OR REPLACE PROCEDURE  GET_PROC
(
    GET_DEPT_NO IN EMP.DEPTNO%TYPE
)
IS
    GET_CUR Sys_RefCursor ;
    EMP_NO  EMP.EMPNO%TYPE ;
    E_SAL   EMP.SAL%TYPE ;

BEGIN
    OPEN_CUR_PROC(GET_DEPT_NO,GET_CUR);--CALLING THE FIRST ROCEDURE TO GET THE CURSOR AS OUT VALUE
    LOOP
        FETCH GET_CUR INTO EMP_NO,E_SAL ;
        EXIT WHEN GET_CUR%NOTFOUND ;
        DBMS_OUTPUT.PUT_LINE(EMP_NO || '=======>' ||E_SAL );
    END LOOP;
    CLOSE GET_CUR ;


END

/*CALLING THE 2ND PROCEDURE */

BEGIN

GET_PROC(10);

END
