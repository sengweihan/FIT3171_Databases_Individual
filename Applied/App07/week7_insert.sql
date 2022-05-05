SET ECHO ON

SPOOL week7_insert_output.txt

-- 7.3.1 Basic INSERT statement

INSERT INTO student VALUES 
(11111111,    'Bloggs',      'Fred',        to_date('1-Jan-2003', 'dd-Mon-yyyy'));

INSERT INTO student VALUES 
(11111112,    'Nice',        'Nick',        to_date('10-Oct-2004','dd-Mon-yyyy'));

INSERT INTO student VALUES 
(11111113,    'Wheat',       'Wendy',       to_date('5-May-2005','dd-Mon-yyyy' ));

INSERT INTO student VALUES 
(11111114,    'Sheen',       'Cindy',       to_date('25-Dec-2004','dd-Mon-yyyy'));




INSERT INTO unit VALUES
('FIT9999'   , 'FIT Last Unit');

INSERT INTO unit VALUES
('FIT9132'     ,'Introduction to Databases');

INSERT INTO unit VALUES
('FIT9161'     ,'Project');

INSERT INTO unit VALUES
('FIT5111'     ,'Student''s Life');



INSERT INTO enrolment VALUES
(11111111,    'FIT9132',     2020,        '1',               35,          'N');

INSERT INTO enrolment VALUES
(11111111,    'FIT9161',     2020,        '1',               61,          'C');

INSERT INTO enrolment VALUES
(11111111,    'FIT9132',     2020,        '2',               42,          'N');

INSERT INTO enrolment VALUES
(11111111,    'FIT5111',     2020,        '2',               76,          'D');


commit;


-- 7.3.2 Using SEQUENCEs in an INSERT statement
drop sequence student_seq ;
create sequence student_seq start with 11111115 increment by 1;

INSERT INTO student VALUES 
(student_seq.nextval ,    'John',      'Doe',        to_date('1-Jan-2003', 'dd-Mon-yyyy'));



INSERT INTO enrolment VALUES
(student_seq.currval ,    (SELECT unit_code from unit where unit_name = 'Introduction to Databases'),     2021,        '1',               76,          'D');

commit; 

-- 7.3.4 Creating a table and inserting data as a single SQL statement.

DROP TABLE FIT5111_STUDENT;

CREATE TABLE FIT5111_STUDENT 
as select * 
from enrolment 
where unit_code = 'FIT5111';


SPOOL OFF
SET ECHO OFF

