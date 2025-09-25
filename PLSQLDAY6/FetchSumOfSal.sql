declare
cursor c1 is select * from emp;
totalsal number(10):=0;
begin
for i in c1
loop
totalsal:=totalsal+i.sal;
end loop;
dbms_output.put_line('Total salary is:'||totalsal);
end;
/





