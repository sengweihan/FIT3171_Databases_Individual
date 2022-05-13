--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-rm-schema.sql

--Student ID: 32229070
--Student Name: SENG WEI HAN
--Unit Code: FIT3171
--Applied Class No: TUTORIAL 7

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- COMPETITOR
CREATE TABLE competitor (
    comp_no              NUMBER(5) NOT NULL,
    comp_fname           VARCHAR2(30),
    comp_lname           VARCHAR2(30),
    comp_gender          CHAR(1) NOT NULL,
    comp_dob             DATE NOT NULL,
    comp_email           VARCHAR2(50) NOT NULL,
    comp_unistatus       CHAR(1) NOT NULL,
    comp_phone           CHAR(10) NOT NULL,
    comp_ec_relationship CHAR(1) NOT NULL,
    ec_phone             CHAR(10) NOT NULL
);

COMMENT ON COLUMN competitor.comp_no IS
    'Unique identifier for a competitor';

COMMENT ON COLUMN competitor.comp_fname IS
    'Competitor''s first name';

COMMENT ON COLUMN competitor.comp_lname IS
    'Competitor''s last name';

COMMENT ON COLUMN competitor.comp_gender IS 'Competitor''s gender (''M'' for male, ''F'' for female, or ''U'' for
''Undisclosed'')'; 

COMMENT ON COLUMN competitor.comp_dob IS 
    'Competitor''s date of birth';

COMMENT ON COLUMN competitor.comp_email IS 
    'Competitor''s email';

COMMENT ON COLUMN competitor.comp_unistatus IS
    'Competitor''s university student/staff status (''Y'' for Yes or ''N'' for No)';

COMMENT ON COLUMN competitor.comp_phone IS 
    'Competitor''s phone number';
    
COMMENT ON COLUMN competitor.comp_ec_relationship IS
    'Emergency contact relationship to competitor (''P'' for Parent, ''G'' for Guardian, ''T'' for Partner, or ''F'' for Friend)';


COMMENT ON COLUMN competitor.ec_phone IS 
    'Emergency contact''s phone number (unique identifier)';

  
ALTER TABLE competitor ADD CONSTRAINT competitor_pk PRIMARY KEY(comp_no);

ALTER TABLE competitor ADD CONSTRAINT chk_comp_gender CHECK (comp_gender IN ('M', 'F', 'U'));

ALTER TABLE competitor ADD CONSTRAINT chk_comp_unistatus CHECK (comp_unistatus IN ('Y', 'N'));

ALTER TABLE competitor ADD CONSTRAINT chk_comp_ec_relationship CHECK(comp_ec_relationship IN ('P', 'G', 'T', 'F'));



-- EMERCONTACT
CREATE TABLE emercontact (
    ec_phone CHAR(10) NOT NULL,
    ec_fname VARCHAR2(30),
    ec_lname VARCHAR2(30)
);

COMMENT ON COLUMN emercontact.ec_phone IS
    'Emergency contact''s phone number (unique identifier)';

COMMENT ON COLUMN emercontact.ec_fname IS
    'Emergency contact''s first name';

COMMENT ON COLUMN emercontact.ec_lname IS
    'Emergency contact''s last name';

ALTER TABLE emercontact ADD CONSTRAINT emercontact_pk PRIMARY KEY(ec_phone);
    
    

--ENTRY



--TEAM



-- Add all missing FK Constraints below here
ALTER TABLE competitor ADD CONSTRAINT emercontact_competitor_fk FOREIGN KEY (ec_phone) REFERENCES emercontact (ec_phone);

