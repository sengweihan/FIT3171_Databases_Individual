--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-rm-dm.sql

--Student ID: 32229070
--Student Name: SENG WEI HAN
--Unit Code: FIT3171
--Applied Class No: TUTORIAL 7

/* Comments for your marker:




*/

--3(a)
DROP SEQUENCE competitor_seq;

DROP SEQUENCE team_seq;

CREATE SEQUENCE competitor_seq START WITH 100 INCREMENT BY 1;

CREATE SEQUENCE team_seq START WITH 100 INCREMENT BY 1;



--3(b)
INSERT INTO emercontact VALUES (
    '0476541234',
    'Jack',
    'Kai'
);

INSERT INTO competitor VALUES (
    competitor_seq.nextval,
    'Daniel',
    'Kai',
    'M',
    TO_DATE('22-Nov-1999','dd-Mon-yyyy'),
    'DanielKai@gmail.com',
    'Y',
    '0353603775',
    'P',
    ( SELECT
    ec_phone
FROM
    emercontact
WHERE
        ec_fname = 'Jack'
    AND ec_lname = 'Kai'
)
);

INSERT INTO competitor VALUES (
    competitor_seq.nextval,
    'Annabelle',
    'Kai',
    'F',
    TO_DATE('18-May-2000','dd-Mon-yyyy'),
    'AnnabelleKai@gmail.com',
    'Y',
    '0882903359',
    'P',
    ( SELECT
    ec_phone
FROM
    emercontact
WHERE
        ec_fname = 'Jack'
    AND ec_lname = 'Kai'
)
);

INSERT INTO entry VALUES (
    (
        SELECT
            event_id
        FROM
            event
        WHERE
                carn_date = (
                    SELECT
                        carn_date
                    FROM
                        carnival
                    WHERE
                        carn_name = 'RM Autumn Series Caulfield 2022'
                )
            AND eventtype_code = (
                SELECT
                    eventtype_code
                FROM
                    eventtype
                WHERE
                    eventtype_desc = '21.1 Km Half Marathon'
            )
    ),
    (
        SELECT
            MAX(entry_no) + 1
        FROM
            entry
        WHERE
            event_id = (
                SELECT
                    event_id
                FROM
                    event
                WHERE
                        carn_date = (
                            SELECT
                                carn_date
                            FROM
                                carnival
                            WHERE
                                carn_name = 'RM Autumn Series Caulfield 2022'
                        )
                    AND eventtype_code = (
                        SELECT
                            eventtype_code
                        FROM
                            eventtype
                        WHERE
                            eventtype_desc = '21.1 Km Half Marathon'
                    )
            )
    ),
    NULL,
    NULL,
    (
        SELECT
            comp_no
        FROM
            competitor
        WHERE
                comp_fname = 'Daniel'
            AND comp_lname = 'Kai'
            AND comp_unistatus = 'Y'
            AND ec_phone = (
                SELECT
                    ec_phone
                FROM
                    emercontact
                WHERE
                        ec_fname = 'Jack'
                    AND ec_lname = 'Kai'
            )
    ),
    NULL,
    (
        SELECT
            char_id
        FROM
            charity
        WHERE
            char_name = 'Beyond Blue'
    )
);



INSERT INTO entry VALUES (
    (
        SELECT
            event_id
        FROM
            event
        WHERE
                carn_date = (
                    SELECT
                        carn_date
                    FROM
                        carnival
                    WHERE
                        carn_name = 'RM Autumn Series Caulfield 2022'
                )
            AND eventtype_code = (
                SELECT
                    eventtype_code
                FROM
                    eventtype
                WHERE
                    eventtype_desc = '21.1 Km Half Marathon'
            )
    ),
    (
        SELECT
            MAX(entry_no) + 1
        FROM
            entry
        WHERE
            event_id = (
                SELECT
                    event_id
                FROM
                    event
                WHERE
                        carn_date = (
                            SELECT
                                carn_date
                            FROM
                                carnival
                            WHERE
                                carn_name = 'RM Autumn Series Caulfield 2022'
                        )
                    AND eventtype_code = (
                        SELECT
                            eventtype_code
                        FROM
                            eventtype
                        WHERE
                            eventtype_desc = '21.1 Km Half Marathon'
                    )
            )
    ),
    NULL,
    NULL,
    (
        SELECT
            comp_no
        FROM
            competitor
        WHERE
                comp_fname = 'Annabelle'
            AND comp_lname = 'Kai'
            AND comp_unistatus = 'Y'
            AND ec_phone = (
                SELECT
                    ec_phone
                FROM
                    emercontact
                WHERE
                        ec_fname = 'Jack'
                    AND ec_lname = 'Kai'
            )
    ),
    NULL,
    (
        SELECT
            char_id
        FROM
            charity
        WHERE
            char_name = 'Amnesty International'
    )
);





--3(c)


--3(d)


--3(e)
