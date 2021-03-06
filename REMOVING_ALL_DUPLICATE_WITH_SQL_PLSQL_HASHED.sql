/* CREATING THE TABLE FOR THE STORES_EMPLOYEE FOR TESTING*/

BEGIN
    EXECUTE IMMEDIATE 
    'CREATE TABLE STORES_EMPLOYEE(STORES_ID NUMBER ,CITY VARCHAR2(50))';
    DBMS_OUTPUT.PUT_LINE('TABLE CREATED SUCCESSFULLY');
END;

/* INSERTING THE RECORDS IN TO THE STORES_EMPLOYEE  TABLE  FOR TESTING*/

DECLARE 
    STORES_ID   STORES_EMPLOYEE.STORES_ID%TYPE:=1002;
    CITY        STORES_EMPLOYEE.CITY%TYPE:='BHUBANESWAR';
BEGIN
    INSERT INTO STORES_EMPLOYEE (STORES_ID,CITY)
    VALUES (STORES_ID,CITY);
    DBMS_OUTPUT.PUT_LINE('DATA INSERTED SUCCESSFULLY');
END;

/* NOW LOOPING THROUGH IT SO THAT I CAN CREATE  FEW DUPLICATED RECORD AND LATER THEN REMOVE DUPLICATE */

DECLARE 
    STORES_ID   STORES_EMPLOYEE.STORES_ID%TYPE:=1004;
    CITY        STORES_EMPLOYEE.CITY%TYPE:='MUMBAI';
    ITER        NUMBER:=0;
BEGIN
    FOR ITER IN 1..3
    LOOP
        INSERT INTO STORES_EMPLOYEE (STORES_ID,CITY)
        VALUES (STORES_ID,CITY);
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('DATA INSERTED SUCCESSFULLY');
END;

/*NOW WE HAVE TO REMOVE THE DUPLICATE THE DUPLICATE USING THE  ROWID */

SELECT STORES_ID,CITY,COUNT(*) FROM STORES_EMPLOYEE GROUP BY STORES_ID,CITY ORDER BY COUNT(*) ;