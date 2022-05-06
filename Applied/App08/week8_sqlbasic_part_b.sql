/*
Databases Week 8 Tutorial
week8_sqlbasic_part_b.sql

student id: 
student name:
last modified date:
*/

/* B1. List all the unit codes, semesters and name of chief examiners 
(ie. the staff who is responsible for the unit) for all the units 
that are offered in 2021. Order the output by semester then by unit code..*/
SELECT
    unitcode,
    ofsemester,
    stafffname
    || ' '
    || stafflname AS "name of chief examiners"
FROM
         uni.staff e
    JOIN uni.offering s
    ON e.staffid = s.staffid
WHERE
    to_char(ofyear, 'yyyy') = '2021'
ORDER BY
    ofsemester,
    unitcode;

/* B2. List all the unit codes and the unit names and their year and semester offerings.
Order the output by unit code then by offering year and semester. */
SELECT
    e.unitcode,
    unitname,
    to_char(ofyear, 'yyyy') AS offering_year,
    ofsemester
FROM
         uni.unit e
    JOIN uni.offering s
    ON e.unitcode = s.unitcode
ORDER BY
    unitcode,
    offering_year,
    ofsemester;

/*
B3. List the student id, student name (firstname and surname) as one attribute 
and the unit name of all enrolments for semester 1 of 2021. 
Order the output by unit name, within a given unit name, order by student id.
*/
SELECT e.stuid,stufname || ' ' || stulname as student_name,unitname
FROM uni.student s join uni.enrolment e ON s.stuid = e.stuid JOIN uni.unit u ON u.unitcode = e.unitcode
WHERE ofsemester = 1 and to_char(ofyear,'yyyy') = 2021
ORDER BY unitname,stuid;


/* B4. List the unit code, semester, class type (lecture or tutorial), day, time 
and duration (in minutes) for all units taught by Windham Ellard in 2021.
Sort the list according to the unit code, within a given unit code, order by offering semester*/
SELECT unitcode,ofsemester,cltype,clday,to_char(cltime,'HHAM') as time, clduration*60 as duration
FROM uni.staff s JOIN uni.schedclass c ON s.staffid = c.staffid 
where stafffname in ('Windham') and stafflname in ('Ellard') and to_char(ofyear,'yyyy') = 2021
ORDER BY unitcode,ofsemester;

/* B5. Create a study statement for Brier Kilgour.
A study statement contains unit code, unit name, semester and year study was attempted,
the mark and grade. If the mark and/or grade is unknown, show the mark and/or grade as ‘N/A’.
Sort the list by year, then by semester and unit code. */


/* B6. List the unit code and unit name of the prerequisite units
of 'Introduction to data science' unit.
Order the output by prerequisite unit code. */


/* B7. Find all students (list their id, firstname and surname)
who have received an HD for FIT2094 unit in semester 2 of 2021.
Sort the list by student id. */


/* B8.	List the student full name, and unit code for those students
who have no mark in any unit in semester 1 of 2021.
Sort the list by student full name. */