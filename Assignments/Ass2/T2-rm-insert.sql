--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-rm-insert.sql

--Student ID: 32229070
--Student Name: SENG WEI HAN
--Unit Code: FIT 3171
--Applied Class No: TUTORIAL 7

/* Comments for your marker:




*/

-- Task 2 Load the EMERCONTACT, COMPETITOR, ENTRY and TEAM tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- EMERCONTACT
-- =======================================
INSERT INTO emercontact VALUES ('0320705213','Columbine','Addilyn');

INSERT INTO emercontact VALUES ('0193000882','Rosamond','Briana');

INSERT INTO emercontact VALUES ('0341061549','Lacey','Chad');

INSERT INTO emercontact VALUES ('0387368668','Laurie','Brooklynn');

INSERT INTO emercontact VALUES ('6072364379','Wren','Catherine');


-- =======================================
-- COMPETITOR
-- Have at least 10 competitors who are Monash student/staff
-- Have at least 2 competitors who are not Monash student/staff
-- Included at least 2 competitors who are under 18 years of age
-- =======================================
INSERT INTO competitor VALUES (
    1,
    'Briscoe',
    'Camellia',
    'F',
    TO_DATE('02-Aug-2005', 'dd-Mon-yyyy'),
    'BriscoeCamellia@gmail.com',
    'Y',
    '8265727590',
    'F',
    '0320705213'
);

INSERT INTO competitor VALUES (
    2,
    'Charlee',
    'Kaylie',
    'F',
    TO_DATE('04-Sep-2004', 'dd-Mon-yyyy'),
    'CharleeKaylie@gmail.com',
    'Y',
    '8288433577',
    'F',
    '0320705213'
);

INSERT INTO competitor VALUES (
    3,
    'Alonzo',
    'Boniface',
    'M',
    TO_DATE('17-Jan-2003', 'dd-Mon-yyyy'),
    'AlonzoBoniface@gmail.com',
    'Y',
    '0216495474',
    'T',
    '0193000882'
);

INSERT INTO competitor VALUES (
    4,
    'Augustine',
    'Biff',
    'U',
    TO_DATE('12-Mar-2006', 'dd-Mon-yyyy'),
    'AugustineBiff@gmail.com',
    'Y',
    '0356337980',
    'G',
    '0193000882'
);

INSERT INTO competitor VALUES (
    5,
    'Kegan',
    'Stuart',
    'M',
    TO_DATE('26-Nov-1997', 'dd-Mon-yyyy'),
    'KeganStuart@gmail.com',
    'Y',
    '6072364379',
    'P',
    '0341061549'
);


INSERT INTO competitor VALUES (
    6,
    'Dutch',
    'Davis',
    'U',
    TO_DATE('28-Apr-1992', 'dd-Mon-yyyy'),
    'DutchDavis@gmail.com',
    'Y',
    '0331684445',
    'F',
    '0341061549'
);

INSERT INTO competitor VALUES (
    7,
    'Therese',
    'Bud',
    'F',
    TO_DATE('14-Dec-2005', 'dd-Mon-yyyy'),
    'ThereseBud@gmail.com',
    'Y',
    '0216508849',
    'P',
    '0387368668'
);

INSERT INTO competitor VALUES (
    8,
    'Breann',
    'Beauregard',
    'M',
    TO_DATE('07-Jun-1985', 'dd-Mon-yyyy'),
    'BreannBeauregard@gmail.com',
    'Y',
    '0215152323',
    'T',
    '0320705213'
);


INSERT INTO competitor VALUES (
    9,
    'Oliver',
    'Suz',
    'F',
    TO_DATE('14-Sep-1986', 'dd-Mon-yyyy'),
    'OliverSuz@gmail.com',
    'Y',
    '0217255724',
    'F',
    '6072364379'
);


INSERT INTO competitor VALUES (
    10,
    'Louis',
    'Jay',
    'M',
    TO_DATE('27-Jul-2006', 'dd-Mon-yyyy'),
    'LouisJay@gmail.com',
    'Y',
    '0618214981',
    'G',
    '0320705213'
);



INSERT INTO competitor VALUES (
    11,
    'Don',
    'Greyson',
    'U',
    TO_DATE('31-Oct-1988', 'dd-Mon-yyyy'),
    'DonGreyson@gmail.com',
    'N',
    '8287893022',
    'T',
    '6072364379'
);


INSERT INTO competitor VALUES (
    12,
    'Nickolas',
    'Mervin',
    'M',
    TO_DATE('14-Aug-2003', 'dd-Mon-yyyy'),
    'NickolasMervin@gmail.com',
    'N',
    '8240849083',
    'P',
    '0320705213'
);

INSERT INTO competitor VALUES (
    13,
    'Ryan',
    'Thurstan',
    'U',
    TO_DATE('20-Dec-1990', 'dd-Mon-yyyy'),
    'RyanThurstan@gmail.com',
    'N',
    '8284903975',
    'F',
    '0387368668'
);



INSERT INTO competitor VALUES (
    14,
    'Sheila',
    'Becka',
    'F',
    TO_DATE('07-Oct-1985', 'dd-Mon-yyyy'),
    'SheilaBecka@gmail.com',
    'Y',
    '0321665122',
    'F',
    '0193000882'
);

INSERT INTO competitor VALUES (
    15,
    'Chris',
    'Satchel',
    'M',
    TO_DATE('28-Nov-1994', 'dd-Mon-yyyy'),
    'ChrisSatchel@gmail.com',
    'N',
    '0326931646',
    'T',
    '0341061549'
);
-- =======================================
-- ENTRY
-- Included at least 10 competitors
-- Included at least 6 events from 3 different carnivals
--  Have at least 5 competitors who join more than 2 events
--  Have at least 2 uncompleted entries (registration only)
-- =======================================
INSERT INTO entry VALUES (
    1,
    1,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:30', 'HH:MI'),
    1,
    NULL,
    NULL
);


INSERT INTO entry VALUES (
    1,
    2,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:30', 'HH:MI'),
    2,
    NULL,
    3
);

INSERT INTO entry VALUES (
    1,
    3,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:30', 'HH:MI'),
    3,
    NULL,
    2
);

INSERT INTO entry VALUES (
    2,
    1,
    TO_DATE('06:30', 'HH:MI'),
    TO_DATE('07:30', 'HH:MI'),
    4,
    NULL,
    4
);

INSERT INTO entry VALUES (
    2,
    2,
    TO_DATE('06:30', 'HH:MI'),
    TO_DATE('07:30', 'HH:MI'),
    5,
    NULL,
    NULL
);

INSERT INTO entry VALUES (
    2,
    3,
    TO_DATE('06:30', 'HH:MI'),
    TO_DATE('07:30', 'HH:MI'),
    6,
    NULL,
    1
);

INSERT INTO entry VALUES (
    3,
    1,
    TO_DATE('07:30', 'HH:MI'),
    TO_DATE('08:30', 'HH:MI'),
    1,
    NULL,
    4
);

INSERT INTO entry VALUES (
    3,
    2,
    TO_DATE('07:30', 'HH:MI'),
    TO_DATE('08:30', 'HH:MI'),
    2,
    NULL,
    2
);

INSERT INTO entry VALUES (
    3,
    3,
    TO_DATE('07:30', 'HH:MI'),
    TO_DATE('08:30', 'HH:MI'),
    3,
    NULL,
    NULL
);

INSERT INTO entry VALUES (
    4,
    1,
    TO_DATE('06:30', 'HH:MI'),
    TO_DATE('07:30', 'HH:MI'),
    4,
    NULL,
    2
);

INSERT INTO entry VALUES (
    4,
    2,
    TO_DATE('06:30', 'HH:MI'),
    TO_DATE('07:30', 'HH:MI'),
    5,
    NULL,
    3
);

INSERT INTO entry VALUES (
    4,
    3,
    TO_DATE('06:30', 'HH:MI'),
    TO_DATE('07:30', 'HH:MI'),
    7,
    NULL,
    2
);

INSERT INTO entry VALUES (
    5,
    1,
    TO_DATE('06:00', 'HH:MI'),
    TO_DATE('07:00', 'HH:MI'),
    6,
    NULL,
    3
);

INSERT INTO entry VALUES (
    5,
    2,
    TO_DATE('06:00', 'HH:MI'),
    TO_DATE('07:00', 'HH:MI'),
    8,
    NULL,
    1
);

INSERT INTO entry VALUES (
    5,
    3,
    TO_DATE('06:00', 'HH:MI'),
    TO_DATE('07:00', 'HH:MI'),
    9,
    NULL,
    4
);

INSERT INTO entry VALUES (
    6,
    1,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:00', 'HH:MI'),
    1,
    NULL,
    3
);

INSERT INTO entry VALUES (
    6,
    2,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:00', 'HH:MI'),
    2,
    NULL,
    1
);

INSERT INTO entry VALUES (
    6,
    3,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:00', 'HH:MI'),
    3,
    NULL,
    4
);


INSERT INTO entry VALUES (
    7,
    1,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:00', 'HH:MI'),
    4,
    NULL,
    NULL
);

INSERT INTO entry VALUES (
    7,
    2,
    TO_DATE('07:00', 'HH:MI'),
    TO_DATE('08:00', 'HH:MI'),
    5,
    NULL,
    1
);


INSERT INTO entry VALUES (
    8,
    1,
    NULL,
    NULL,
    10,
    NULL,
    2
);


INSERT INTO entry VALUES (
    8,
    2,
    NULL,
    NULL,
    11,
    NULL,
    1
);

INSERT INTO entry VALUES (
    9,
    1,
    NULL,
    NULL,
    12,
    NULL,
    2
);

INSERT INTO entry VALUES (
    10,
    1,
    TO_DATE('06:30','HH:MI'),
    TO_DATE('07:30','HH:MI'),
    13,
    NULL,
    NULL
);


INSERT INTO entry VALUES (
    10,
    2,
    TO_DATE('06:30','HH:MI'),
    TO_DATE('07:30','HH:MI'),
    15,
    NULL,
    1
);

INSERT INTO entry VALUES (
    11,
    1,
    TO_DATE('06:00','HH:MI'),
    TO_DATE('07:00','HH:MI'),
    14,
    NULL,
    3
);



INSERT INTO entry VALUES (
    12,
    1,
    TO_DATE('06:00','HH:MI'),
    TO_DATE('07:00','HH:MI'),
    2,
    NULL,
    1
);

INSERT INTO entry VALUES (
    13,
    1,
    TO_DATE('06:00','HH:MI'),
    TO_DATE('07:45','HH:MI'),
    5,
    NULL,
    2
);

INSERT INTO entry VALUES (
    13,
    2,
    TO_DATE('06:00','HH:MI'),
    TO_DATE('07:45','HH:MI'),
    2,
    NULL,
    1
);


INSERT INTO entry VALUES (
    14,
    1,
    NULL,
    NULL,
    10,
    NULL,
    1
);

-- =======================================
-- TEAM
-- Have at least 2 teams with more than 2 members
-- At least one team with the same name in different carnivals
-- =======================================

