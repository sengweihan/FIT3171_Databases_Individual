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
    
    IF ( competitor_event_count <> 0 ) THEN
    raise_application_error(-20000,'Competitor cannot enroll in multiple events in the same carnival');
    
    END IF ;

END;
/


-- Test Harness for 5(a) --
SELECT * FROM entry;

INSERT INTO entry VALUES (
    2,
    100,
    NULL,
    NULL,
    1,
    NULL,
    3,
    0
);

SELECT * FROM entry;

rollback;
--5(b)


-- Test harness for 5(b)

--5(c)

-- Test Harness for 5(c)

