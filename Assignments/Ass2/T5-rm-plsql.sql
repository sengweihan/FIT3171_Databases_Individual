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
    

CREATE OR REPLACE TRIGGER update_eventtype_trigger BEFORE
    UPDATE OF entry_finishtime ON entry
FOR EACH ROW 

DECLARE 
    elapsedtime   entry.entry_elapsed_time%type;
    eventtypecode eventtype.eventtype_code%type;
    currenttime   eventtype.eventtype_record%type;
    competitor    entry.comp_no%type;

BEGIN

    SELECT eventtype_code INTO eventtypecode FROM event WHERE event_id = :new.event_id;
    
   -- SELECT TRUNC((:new.entry_finishtime - :old.entry_starttime)*1440,2) INTO elapsedtime 
    --FROM event JOIN entry ON event.event_id = entry.event_id WHERE entry.event_id = :old.event_id AND entry_no = :old.entry_no;
    
    --SELECT :old.comp_no INTO competitor
    --FROM event JOIN entry ON event.event_id = entry.event_id WHERE entry.event_id = :old.event_id AND entry_no = :old.entry_no;
    
    --SELECT TRUNC((:new.entry_finishtime - :new.entry_starttime)*1440,2) INTO elapsedtime FROM entry
    -- WHERE event_id = :old.event_id AND entry_no = :old.entry_no;
    
    IF (:new.entry_finishtime IS NOT NULL) THEN
        elapsedtime := TRUNC((:new.entry_finishtime - :new.entry_starttime)*1440,2);
    END IF;
    
    IF (:new.entry_finishtime IS NOT NULL) THEN
        competitor := :new.comp_no;
    END IF;
    
    :new.entry_elapsed_time := elapsedtime;
    
   -- SELECT comp_no INTO competitor FROM entry
    --WHERE event_id = :old.event_id AND entry_no = :old.entry_no;
    
   -- UPDATE entry SET entry_elapsed_time = elapsedtime WHERE event_id = :old.event_id AND entry_no = :old.entry_no;
    
    SELECT eventtype_record INTO currenttime FROM eventtype WHERE eventtype_code = eventtypecode;
    
    IF (currenttime IS NULL ) THEN 
    UPDATE eventtype SET eventtype_record = elapsedtime , eventtype_recordholder = competitor
    WHERE eventtype_code = eventtypecode;
    
    ELSIF (currenttime IS NOT NULL AND elapsedtime < currenttime) THEN 
    UPDATE eventtype SET eventtype_record = elapsedtime , eventtype_recordholder = competitor
    WHERE eventtype_code = eventtypecode;
    
    END IF;
    
END;
/


-- Test harness for 5(b)
SELECT * FROM entry;

INSERT INTO entry VALUES (
    14,
    4,
    NULL,
    NULL,
    1,
    NULL,
    NULL,
    NULL
);

SELECT * FROM entry;

UPDATE entry SET entry_finishtime = TO_DATE('11:35:30', 'HH24:MI:SS'), entry_starttime = TO_DATE('08:30:10', 'HH24:MI:SS')
WHERE event_id = 14 AND entry_no =4 AND comp_no =1;

select * from entry;

INSERT INTO entry VALUES (
    14,
    4,
    NULL,
    NULL,
    2,
    NULL,
    NULL,
    NULL
);
rollback;
--5(c)

-- Test Harness for 5(c)

