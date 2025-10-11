create or replace trigger tr1
before insert or update or delete on emp
begin
if to_char(sysdate,'DY') in('SAT','SUN') then
raise_application_error(-20143,'we can not perform dmls on sat,sundays'); 
end if;
end;
/