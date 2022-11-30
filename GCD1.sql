set SERVEROUTPUT on;
declare
x number(3);
y number(3);
z number(3);
begin 
x:=&x;
y:=&y;
z:=x+y;
dbms_output.put_line('Total value= '||z);
end;
/
select * from customertable;

create or replace procedure InsertCust(
p_name in CustomerTable.name%type,
p_gen in CustomerTable.Gender%type,
p_address in CustomerTable.Address%type
)
is
begin
insert into CustomerTable(name,Gender,Address) values(p_name,p_gen,p_address);
Commit;
end;

begin 
insert into customertable (name,gender,address) VALUES('Priyabrata','male','Bangalore');
end;
/
set SERVEROUTPUT on;
declare
total number(3);
begin
select count(*) into total FROM customertable;
dbms_output.put_line('total person = '||total);
end;
/


set SERVEROUTPUT on;
declare
type totalCustomer is VARRAY(20) of varchar(25);
vn totalCustomer;
i number(2);
begin
select name bulk collect into vn FROM customertable;
 i := vn.FIRST;
while i is not null loop
dbms_output.put_line(' person name -- '||i||' -- '||vn(i));
i:=vn.next(i);
end loop;
end;
/

set SERVEROUTPUT on;
declare
type ctable is table of number index by VARCHAR2(64);
address ctable;
i varchar2(64);
begin
address('Bangalore'):='2000';
address('Kolkata'):='3000';
address('Hyderabad'):='1000';
address('Delhi'):='6000';
address('Pune'):='4000';
i:=address.first;
while i is not null 
  loop
   dbms_output.put_line('Address of '||i||' is : '||address(i));
   i:=address.next(i);
  end loop;
end;
/


