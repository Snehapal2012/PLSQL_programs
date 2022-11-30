select * from aaacompany;
begin 
delete from aaacompany where id=106;
end;
/
begin
insert into aaacompany(id,name,age,salary,address) VALUES('107','Santhosh',26,42000,'Hyderabad');
end;
/
set SERVEROUTPUT on;
declare 
cursor c3 is
SELECT id,name,age,salary,address from aaacompany order by salary asc;
c_id aaacompany.id%type;
c_name aaacompany.name%type;
c_age aaacompany.age%type;
c_salary aaacompany.salary%type;
c_address aaacompany.address%type;
begin
  open c3;
  loop
  fetch c3 into c_id,c_name,c_age,c_salary,c_address;
  exit when (c3%rowcount <9) or (c3%notfound);
  dbms_output.put_line('| '||c_id||' | '||c_name||' | '||c_age||' | '||c_salary||' | '||c_address||' |');
  end loop;
  close c3;
end;
/
SELECT * FROM aaacompany;


set SERVEROUTPUT on;
declare
begin
update aaacompany set salary=salary+5000;
if sql%notfound then
dbms_output.put_line('not found');
elsif sql%found then
dbms_output.put_line('updated');
end if;
end;
/



set SERVEROUTPUT on;
declare
 total_rows NUMBER(2);
begin
 update aaacompany
 set salary=salary;
  if sql%found then
  total_rows:=sql%rowcount;
  dbms_output.put_line('count of rows are= '||total_rows);
  else
  dbms_output.put_line('not found');
  end if;
end;
/
select count(*) from aaacompany;

set server
