SET SERVEROUTPUT ON;
declare
n NUMBER;
temp NUMBER;
reminder NUMBER;
m NUMBER:=0;
BEGIN
n := &n;
temp := n;
WHILE n>0 
LOOP
reminder := MOD(n,10);
m := (m*10)+reminder;
n := trunc(n/10);
END LOOP;
IF (m=temp) 
THEN
dbms_output.put_line('the number is pallindrome');
ELSE
dbms_output.put_line('the number is not pallindrome');
END IF;
END;
/