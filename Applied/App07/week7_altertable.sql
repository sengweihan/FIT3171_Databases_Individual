-- 7.4. ALTERing the structure of a database table

ALTER TABLE unit 
    ADD unit_credits number(2) default 6;
    

desc unit;

select * from unit;