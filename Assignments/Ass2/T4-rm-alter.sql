--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-rm-alter.sql

--Student ID: 32229070
--Student Name: SENG WEI HAN 
--Unit Code: FIT3171
--Applied Class No: TUTORIAL 7

/* Comments for your marker:




*/

--4(a)

ALTER TABLE entry ADD entry_elapsed_time NUMBER(6,2);

COMMENT ON COLUMN entry.entry_elapsed_time IS 'runner''s elapsed time in an event';

UPDATE entry
SET
    entry_elapsed_time = nvl((entry_finishtime - entry_starttime) * 1440, 0);

COMMIT;
--4(b)



        
--4(c)
