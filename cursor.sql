create table aaacompany (id number(10),name varchar(10),salary number(7),address varchar(20));
drop table aaacompany;
create or replace PROCEDURE aaa_insert_company(
p_id in aaacompany.id%type,
p_name in aaacompany.name%type,
p_salary in aaacompany.salary%type,
p_address in aaacompany.address%type
)
is 
BEGIN
INSERT INTO aaacompany(id,name,salary,address) VALUES (p_id,p_name,p_salary,p_address);
commit;
end;
/
select * from aaacompany;
begin
insert into aaacompany values('1005','Shubhom',35000,'Assam');
end;
/

set SERVEROUTPUT on;
declare
CURSOR c1 is
select id,name, salary from aaacompany where salary>30000;
c_id aaacompany.id%type;
c_name aaacompany.name%type;
c_salary aaacompany.salary%type;
begin
  open c1;
  loop
    fetch c1 into c_id,c_name,c_salary;
    exit when c1%notfound;
    dbms_output.put_line('| '||c_id||' | '||c_name||' | '||c_salary);
  end loop;
  close c1;
end;
/