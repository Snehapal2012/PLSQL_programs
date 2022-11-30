SET SERVEROUTPUT ON;
DECLARE
x number;
y number;
gcd number:=0;
BEGIN
x:=&x;
y:=&y;
while (y!=0) loop
gcd:= y;
y:=mod(x,y);
x:=gcd;
end loop;
gcd:=x;
dbms_output.put_line('gcd = '||gcd);
end;
/
