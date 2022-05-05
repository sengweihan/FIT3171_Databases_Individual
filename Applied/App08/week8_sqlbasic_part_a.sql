/*
Databases Week 8 Tutorial
week8_sqlbasic_part_a.sql

student id: 
student name:
last modified date:

*/

/* A1. List all units and their details. Order the output by unit code. */
SELECT * FROM uni.unit ORDER BY unitcode;

/* A2. List all students’ details who live in Caulfield. 
Order the output by student first name.*/
SELECT * FROM uni.student WHERE stuaddress like '%Caulfield' ORDER BY stufname;

/* A3. List the student's surname, firstname and address for those students 
who have a surname starting with the letter 'S' and firstname contains the letter 'i'. 
Order the output by student id*/
SELECT stufname,stulname,stuaddress FROM uni.student where  stulname like 'S%' and stufname like '%i%' order by stuid;
  
/* A4. Assuming that a unit code is created based on the following rules:
a. The first three letters represent faculty abbreviation, 
   eg. FIT for the Faculty of Information Technology.
b. The first digit of the number following the letter represents the year level. 
   For example, FIT2094 is a unit code from Faculty of IT (FIT) 
   and the number 2 refers to a second year unit.

List the unit details of all first year units in the Faculty of Information Technology. 
Order the output by unit code.*/

-- a
SELECT * FROM uni.unit where unitcode like 'FIT1%' ORDER BY unitcode;



/*A5. List the unit code and semester of all units that are offered in 2021. 
Order the output by unit code, and within a given unit code order by semester. 
To complete this question you need to use the Oracle function to_char to convert 
the data type for the year component of the offering date into text. 
For example, to_char(ofyear,'yyyy') - here we are only using the year part of the date.
*/
SELECT unitcode, ofsemester FROM uni.offering where to_char(ofyear,'yyyy') = '2021' ORDER BY unitcode,ofsemester;

/* A6. List the year, semester, and unit code for all units that were offered 
in either semester 2 of 2019 or semester 2 of 2020. 
Order the output by year and semester then by unit code.*/
SELECT to_char(ofyear,'yyyy') as year,ofsemester,unitcode FROM UNI.offering where (ofsemester = 2 and to_char(ofyear,'yyyy') = '2019') or
(ofsemester = 2 and to_char(ofyear,'yyyy') = '2020') ORDER BY ofyear,ofsemester ,unitcode;
/* A7. List the student id, unit code and mark 
for those students who have failed any unit in semester 2 of 2021. 
Order the output by student id then order by unit code. */


SELECT
    stuid,
    unitcode,
    enrolmark
FROM
    uni.enrolment
WHERE
        enrolmark < 50
    AND ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2021'
ORDER BY
    stuid,
    unitcode;


