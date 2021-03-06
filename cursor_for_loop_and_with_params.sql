/* CURSOR WITH FOR LOOPS CAB BE DEFINED AS BELOW */

DECLARE 
    CURSOR FOR_CUR IS SELECT STORES_ID,CITY FROM STORES_EMPLOYEE;
BEGIN
    FOR I IN FOR_CUR
    LOOP
        DBMS_OUTPUT.PUT_LINE(I.STORES_ID ||'===========>>' || I.CITY);
    END LOOP;
END


/* FOR LOOP CURSOR WITH POARAMETER VALUE */

SELECT * FROM EMP;

DECLARE 
    CURSOR PARA_LOOP_CUR (DEPT_NO NUMBER:=10) IS SELECT EMPNO,ENAME,SAL FROM EMP WHERE DEPTNO=DEPT_NO;
BEGIN
    FOR I IN PARA_LOOP_CUR(DEPT_NO=>20)
    LOOP
        DBMS_OUTPUT.PUT_LINE(I.EMPNO || '===>' || I.ENAME ||'===>'|| I.SAL );
    END LOOP;
END;
