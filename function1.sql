create or replace function TotalCount
return number is 
total number:=0;
begin
select count(*) into total from customertable;
return total;
end;
/

set SERVEROUTPUT on;
declare
n number;
begin
n:=TotalCount();
dbms_output.put_line('total number of customer is '||n);
end;
/