exec aa_insert_company('109','Priyabrata',30,95000,'Bangalore');
SELECT * FROM aaacompany;

set SERVEROUTPUT on;
declare
type employee is VARRAY(20) of number(5);
emp employee;
i number(2);
begin
select salary bulk collect into emp from aaacompany order by salary;
i :=emp.first;
while i is not null
  loop
   dbms_output.put_line(i||') id:-- '||emp(i));
   i:=emp.next(i);
  end loop;
end;
/

set SERVEROUTPUT on;
declare
type namearray is varray(10) of varchar(20);
type grades is VARRAY(10) of integer;
names namearray;
marks grades;
i integer;
total integer;
begin
names:=namearray('Sneha','Mahesh','Nilesh','Sangita','Nishant','Dipali','Rahul','Souvik','Saurabh','Deep');
marks:=grades(89,78,90,65,83,34,57,60,69,79);
total:=names.count;
dbms_output.put_line('total '||total||' students are there!');
  for i in 1..total
    loop
      dbms_output.put_line('name: '||names(i)||' marks: '||marks(i));
    end loop;
end;
/