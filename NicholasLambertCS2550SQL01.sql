/*Nicholas Lambert*/

/* #1 - List the salutation and names (first and last name) of all instructors in alphabetical order (last name then first name) .*/
SELECT salutation, first_name, last_name
FROM INSTRUCTOR
Order By last_name, first_name DESC;

/* #2 - Provide a list of distinct locations that have been used to teach sections of courses.
Arrange the list in order of location. */
SELECT DISTINCT Location
FROM Section
Order By location DESC;

/* #3 - List the first and last names of Instructors with a first name starting with �T�.
Sort them in alphabetical order.*/
SELECT first_name, last_name
FROM instructor
WHERE first_name like 'T%'
Order By last_name, first_name DESC;

/* #4 - List the phone number, full name (as one column) and employer for all students with a last name of �Torres�.  Sort by Employer */
SELECT phone, concat(first_name, last_name) "FULLNAME", employer
FROM student
WHERE last_name LIKE 'Torres'
Order By employer DESC;

/* #5 - List the course number and course description of all courses that have a prerequisite of course 350.
Arrange in order of course number. */
SELECT course_no, description
FROM course
WHERE prerequisite LIKE '350'
Order By course_no ASC;

/* #6 - List the course number, description and cost for all 200 level courses (200-299) costing less than $1100.  Arrange by course number. */
SELECT course_no, description, cost
FROM course
WHERE course_no > 200
AND course_no < 300
AND cost < 1100
Order By course_no ASC;

/* #7 - List the course number, section id and location for all 100 level courses  (100 through 199) that are taught in room L214 or L509. Order by location and course number */
SELECT course_no, section_id, location
FROM section
WHERE course_no >= 100
AND course_no < 200
AND location LIKE 'L214' OR location LIKE 'L509'
Order By course_no, location ASC;

/* #8 - List the course number and section id for classes with a capacity of 12 or 15 (use the IN clause). Order the list by course number and section id. */
SELECT course_no, section_id, capacity
FROM section
WHERE capacity IN (12, 15)
Order By course_no, section_id ASC;

/* #9 -  List the student id and grade for all of the midterm exam scores (MT) in section 141. Arrange the list by student id and grade. */
SELECT student_id, numeric_grade
FROM grade
WHERE section_id LIKE '141'
AND grade_type_code LIKE 'MT'
Order By student_id, numeric_grade ASC;


/* #10 - List the course number and description for all 300 level courses that have a prerequisite, arranged on course description. */
SELECT course_no, description
FROM course
WHERE course_no >= 300
AND course_no < 400
AND prerequisite IS NOT NULL
ORDER BY description ASC;