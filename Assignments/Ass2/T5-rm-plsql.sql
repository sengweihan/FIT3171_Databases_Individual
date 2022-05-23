--****PLEASE ENTER YOUR DETAILS BELOW****
--T5-rm-alter.sql

--Student ID: 32229070
--Student Name: SENG WEI HAN
--Unit Code: FIT3171
--Applied Class No: TUTORIAL 7 

/* Comments for your marker:




*/

--5(a)
CREATE OR REPLACE TRIGGER comp_event_check BEFORE
    INSERT ON entry 
    FOR EACH ROW
DECLARE
    chk_date DATE;
    competitor_event_count NUMBER;
    
BEGIN
    SELECT carn_date INTO chk_date FROM event WHERE event_id = :new.event_id; 
    
    SELECT
    COUNT(*)
INTO competitor_event_count
FROM
         event
    JOIN entry
    ON event.event_id = entry.event_id
WHERE
        comp_no = :new.comp_no
    AND carn_date = chk_date;
    
    IF( competitor_event_count <> 0 ) THEN
    raise_application_error(-20000,'Competitor cannot enroll in multiple events in the same carnival');
    
    ELSE 
        dbms_output.put_line('Record is successfully inserted');
    
    END IF;

END;
/


-- Test Harness for 5(a) --
-- TEST CASE 1
-- BEFORE
SELECT * FROM entry;

-- EXECUTING TRIGGER 
-- FAIL
INSERT INTO entry VALUES (
    2,
    100,
    NULL,
    NULL,
    1,
    NULL,
    3,
    NULL
);

-- AFTER
SELECT * FROM entry;


-- TEST 2 
-- BEFORE 
SELECT * FROM entry;

-- EXECUTING THE TRIGGER
-- SUCCESS
INSERT INTO entry VALUES (
    14,
    100,
    NULL,
    NULL,
    1,
    NULL,
    2,
    NULL
);

-- AFTER 
SELECT * FROM entry;

rollback;
--5(b)

-- ADD TWO NEW ATTRIBUTES IN EVENTTYPE NAMED eventtype_record and eventtype_recordholder.

ALTER TABLE eventtype ADD eventtype_record NUMBER(6,2) ;

ALTER TABLE eventtype ADD eventtype_recordholder NUMBER(5);

COMMENT ON COLUMN eventtype.eventtype_record IS
    'fastest elapsed time for each event type';
    
COMMENT ON COLUMN eventtype.eventtype_recordholder IS
    'competitor (competitor number) who holds the record';
    


-- Test harness for 5(b)
--BEGIN 




--5(c)

-- Test Harness for 5(c)

