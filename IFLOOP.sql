
-------------------------------------count total member present in the table------------------------------------

set SERVEROUTPUT on;
declare
total number(3);
begin
select count(*) into total from customertable;
dbms_output.put_line('total = '||total);
end;
/

-------------------------------bigger number in between 2 numbers--------------------------------

set SERVEROUTPUT on;
declare
num1 number(3);
num2 number(3);
begin
num1:=&num1;
num2:=&num2;
 if num1>num2 then
   dbms_output.put_line('bigger is = '||num1);
 else
   dbms_output.put_line('bigger is = '||num2);
 end if;
end;
/

-------------------bigger number in between 3 numbers------------------------------

set SERVEROUTPUT on;
declare
num1 number(3);
num2 number(3);
num3 number(3);
begin
num1:=&num1;
num2:=&num2;
num3:=&num3;
 if (num1>num2 and num1>num3) then
   dbms_output.put_line('bigger is 1st number = '||num1);
 elsif (num2>num1 and num2>num3) then
   dbms_output.put_line('bigger is 2nd number = '||num2);
 else
   dbms_output.put_line('bigger is 3rd number = '||num3);
 end if;
end;
/

---------------------case statement--------------------------

set SERVEROUTPUT on;
declare
grade char(1);
begin
grade:='Y';
case grade
when 'A' then dbms_output.put_line('grade is A');
when 'B' then dbms_output.put_line('grade is B');
when 'C' then dbms_output.put_line('grade is C');
when 'D' then dbms_output.put_line('grade is D');
when 'E' then dbms_output.put_line('grade is E');
else 
dbms_output.put_line('default statement');
end case;
end;
/

------------------------------------print 1 to 10 using for loop---------------------------------

set SERVEROUTPUT on;
declare
x number(2):=0;
begin
 while x is not null loop
  x:=x+1;
    if(x<11) then
     dbms_output.put_line('x = '||x);
    else
     exit;
    end if;
 end loop;
end;
/
  
-----------------------------------print multiplication table of any number---------------------------

set SERVEROUTPUT on;
declare
n number(3);
r number(3);
i number(1);
begin
n:=&n;
  for i in 1..10 
   loop
     r:=i*n;
     dbms_output.put_line(n||' * '||i||' = '||r);
   end loop;
end;
/
  
------------------------------------------print pattern triangle-----------------------------------

set SERVEROUTPUT on;
declare 
x NUMBER(2);
i number(2);
j number(2);
begin
x:=&x;
 for i in 1..x
  loop
   for j in 1..i
    loop
      dbms_output.put('*');
    end loop;
    dbms_output.put_line('');
  end loop;
end;
/

------------------------------------------print pattern reverse triangle-----------------------------------

set SERVEROUTPUT on;
declare 
x NUMBER(2);
i number(2);
j number(2);
begin
x:=&x;
 for i in 1..x
  loop
   for j in 1..((x-i)+1)
    loop
      dbms_output.put('*');
    end loop;
    dbms_output.put_line('');
  end loop;
end;
/
  



