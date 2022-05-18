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


DROP TABLE team_charity CASCADE CONSTRAINTS;

CREATE TABLE team_charity (
    char_id                 NUMBER(3),
    team_id                 NUMBER(3) NOT NULL,
    team_charity_percentage NUMBER(3)
);

Comment ON COLUMN team_charity.char_id IS 
    'Charity unique identifier';
    
COMMENT ON COLUMN team_charity.team_id IS
    'Team identifier (unique)';

COMMENT ON COLUMN team_charity.team_charity_percentage IS
    'Percentage (0 to 100) of total raised funds that goes to each charity';
    
ALTER TABLE team_charity ADD CONSTRAINT team_charity_pk PRIMARY KEY ( char_id,
                                                                      team_id );
                                                                    

ALTER TABLE team_charity
    ADD CONSTRAINT charity_team_charity_fk FOREIGN KEY ( char_id )
        REFERENCES charity ( char_id );

ALTER TABLE team_charity
    ADD CONSTRAINT team_team_charity_fk FOREIGN KEY ( team_id )
        REFERENCES team ( team_id );


INSERT INTO team_charity VALUES (
    4,
    1,
    100
);

INSERT INTO team_charity VALUES (
    1,
    2,
    100
);

INSERT INTO team_charity VALUES (
    2,
    3,
    100
);

INSERT INTO team_charity VALUES (
    3,
    4,
    100
);

INSERT INTO team_charity VALUES (
    4,
    5,
    100
);

ALTER TABLE team DROP CONSTRAINT charity_team_fk;

ALTER TABLE team DROP COLUMN char_id;


COMMIT;


     
--4(c)


