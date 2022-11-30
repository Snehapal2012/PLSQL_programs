create table bankdetails (N_accnumber number(10), name varchar(10), gender varchar(7),address varchar(25));
INSERT INTO bankdetails VALUES ('1001','Sneha','female','chennai');
create or replace PROCEDURE InsertBank(
p_accnumber in bankdetails.N_accnumber%type,
p_name in bankdetails.name%type,
p_gen in CustomerTable.Gender%type,
p_address in CustomerTable.Address%type
)
is 
begin
insert into bankdetails(N_accnumber,name,gender,address) values(p_accnumber,p_name,p_gen,p_address);
commit;
end;
exec InsertBank('1003','Sangita','female','Kolkata');
select * from bankdetails;
SET SERVEROUTPUT ON;
declare
N_accnumber number;
begin
select n_accnumber into N_accnumber from bankdetails where bankdetails.n_accnumber=1001;
dbms_output.put_line(N_accnumber);
end;

SET SERVEROUTPUT ON;
declare
type accountList is Varray(10) of number;
N_accnumber accountList;
begin
select n_accnumber bulk collect into N_accnumber from bankdetails;
dbms_output.put_line(N_accnumber(3));
end;
/



SET SERVEROUTPUT ON;
declare
type accountNameList is Varray(10) of varchar(7);
N_name accountNameList;
begin
select name bulk collect into N_name from bankdetails;
dbms_output.put_line(N_name(3));
end;
/

Declare
total_rows number(2);
begin 
update bankdetails
set bankdetails.address='Hyderabad';
if sql%notfound then
dbms_output.put_line('nothing found.........');
ELSIF sql%found then
total_rows:=sql%rowcount;
dbms_output.put_line(total_rows||'updated');
end if;
end;
/
select count(*) from bankdetails where bankdetails.address='Hyderabad';
set SERVEROUTPUT on;
declare
cursor c_bankdetails IS
     select name from bankdetails;
  c_id bankdetails.N_accnumber%type;
  c_name bankdetails.name%type;
begin
  open c_bankdetails;
  Loop
    fetch c_bankdetails into c_name;
    exit when c_bankdetails%notfound;
    dbms_output.put_line(c_name);
  end loop;
  close c_bankdetails;
end;
/


