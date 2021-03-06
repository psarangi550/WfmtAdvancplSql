SELECT * FROM ADMIN.EMP;

SELECT * FROM DEPT;

DELETE FROM EMP WHERE DEPTNO IN (50,60);

DELETE  FROM DEPT WHERE DEPTNO IN (50,60);

SELECT E.*,D.DNAME,D.LOC
FROM EMP E, DEPT D 
WHERE E.DEPTNO=40;

DELETE FROM EMP WHERE ENAME='PRATIK';

DELETE FROM EMPDEPTVIEW WHERE DNAME='ACCOUNTING' ;

SELECT * FROM USER_TRIGGERS;

ALTER TRIGGER EMPDEPT_TGR DISABLE

SELECT * FROM EMPDEPTVIEW

/*CREATING THE INSTEAD OF TRIGGER */
CREATE OR REPLACE TRIGGER EMPDEPT_NEW_TGR
INSTEAD OF INSERT ON ADMIN.EMPDEPTVIEW
FOR EACH ROW
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('TRIGGER STARTED');
    BEGIN
        SELECT DEPTNO INTO  V_DEPTNO
        FROM ADMIN.DEPT WHERE DEPTNO=:NEW.DEPTNO;
        DBMS_OUTPUT.PUT_LINE('TRIGGER STARTED' || V_DEPTNO);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            INSERT INTO DEPT(DEPTNO,DNAME,LOC)VALUES(:NEW.DEPTNO,:NEW.DNAME,:NEW.LOC);
    END;
INSERT INTO  ADMIN.EMP (EMPNO,ENAME,SAL,DEPTNO) VALUES (:NEW.EMPNO,:NEW.ENAME,:NEW.SAL,:NEW.DEPTNO);
DBMS_OUTPUT.PUT_LINE('TRIGGER ENDED');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20000,'DUPLICATED PRIMARY KEY REFERENCE ');
END;

DROP TRIGGER EMPDEPT_NEW_TGR;

DROP TRIGGER EMPDEPT_TGR;

INSERT INTO EMPDEPTVIEW (EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC) VALUES(7200,'PRATIK',2500,20,'RESEARCH','DALLAS');

INSERT INTO EMPDEPTVIEW (EMPNO,ENAME,SAL,DEPTNO,DNAME,LOC) VALUES(7300,'RIKA',2500,50,'TRAINING','BANGALORE');

SELECT * FROM DEPT;

DELETE  FROM EMP  WHERE ENAME='PRATIK';

SELECT * FROM EMPDEPTVIEW

DELETE FROM DEPT WHERE DNAME='ACCOUNT';

DESC ADMIN.EMP;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP' ; 

ALTER TABLE ADMIN.EMP MODIFY EMPNO NUMBER PRIMARY KEY;











