set SERVEROUTPUT on;
declare 
cursor c1 is
SELECT id,name,age,salary,address from aaacompany order by salary;
c_id aaacompany.id%type;
c_name aaacompany.name%type;
c_age aaacompany.age%type;
c_salary aaacompany.salary%type;
c_address aaacompany.address%type;
begin
  open c1;
  loop
  fetch c1 into c_id,c_name,c_age,c_salary,c_address;
  exit when c1%notfound;
  dbms_output.put_line('| '||c_id||' | '||c_name||' | '||c_age||' | '||c_salary||' | '||c_address||' |');
  end loop;
  close c1;
end;
/