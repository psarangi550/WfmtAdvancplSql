-- set serveroutput on
-- set linesize 100
-- set pagesize 100

create table stores_emp2(
    store_id number,
    city varchar2(50)
);

insert all
    into stores_emp2(store_id,city) values(1001,'cuttack')
    into stores_emp2(store_id,city) values(1002,'bhubaneswar')
    into stores_emp2(store_id,city) values(1003,'banglore')
    into stores_emp2(store_id,city) values(1004,'mumbai')
    into stores_emp2(store_id,city) values(1005,'goa')
select * from dual;


select * from stores_emp2 ;

create or replace trigger STOPTGR1
before update on stores_emp2

declare
    time_up date:=to_date('17:00','hh24:mi');
    curr_time date:=to_date(to_char(sysdate, 'hh24:mi'),'hh24:mi');
begin
    if curr_time > time_up then
        raise_application_error(2000,'your time is up');
    end if ;

exception 
    when others then
        dbms_output.put_line('Something went wrong');
end;
/

update stores_emp2 set city='bhubaneswar' where store_id=1004;

select * from stores_emp2;

alter trigger STOPTGR1 enable;

ALTER TABLE stores_emp2 ENABLE ALL TRIGGERS


drop trigger STOPTGR;
select * from STORES_EMP;

describe STORES_EMP ;

update STORES_EMP set city='bhubaneswar' where stores_id=6;


select * from user_tab_cols where TABLE_NAME LIKE 'STORES_E%';


-- set serveroutput on
-- set linesize 100
-- set pagesize 100
create or replace trigger PRINTGR
after update on stores_emp2 
for each row
enable 
declare
    v_user varchar2(20) ;
begin
    select user into  v_user
    from dual ;
    dbms_output.put_line('updated by User ' || v_user);
end;
/

/*updating record checking */

update stores_emp2 set city='banglore' where store_id=1004;
