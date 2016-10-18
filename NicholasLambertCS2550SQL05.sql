/* Nicholas Lambert */

/* #1 - List the full name and phone number for students that live in Newark, NJ. Sort on last name and first name */
SELECT first_name, last_name, phone
FROM student s JOIN zipcode z
ON s.zip = z.zip
WHERE city LIKE 'Newark'
GROUP BY first_name, last_name, phone
ORDER BY last_name, first_name;

/* #2 - For all 300 level courses (300-399), list the course number, prerequisite course number and prerequisite course description. Sort by course number. */
/*TODO*/
SELECT Course_No, Prerequisite, Description
FROM Course
WHERE Course_No < 400
AND Course_No >= 300
AND PREREQUISITE IS NOT NULL;

/* #3 - List the course number and description for all 100-level courses taught by charles lowry. Arrange the list in order of course number. */
SELECT c.Course_No, Description
FROM course c JOIN section s
ON c.course_no = s.course_no
JOIN instructor i
ON s.instructor_id = i.instructor_id
WHERE s.course_no LIKE '1%'
AND i.last_name LIKE 'Lowry'
ORDER BY Course_No;

/* #4 - List the grade type code, description and number per sections of all grades in course 144. Arrange by description */
/* TODO */
SELECT g.Grade_Type_Code, gt.description, COUNT(Capacity) AS "Number_Per_Section"
FROM grade g JOIN section s
ON g.section_id = s.section_id
JOIN grade_type gt
ON g.grade_type_code = gt.grade_type_code
GROUP BY grade_type_code;

/* #5 - Provide an alphabetic list of students( student last name followed by first name) who have an overall grade average of 93 or higher. The name should be one column, last name first name sorted on last name then first name */
/* TODO */
SELECT (last_name || ' ' || first_name) "Student_Name"
FROM student s JOIN grade g
ON s.student_id = g.student_id
HAVING AVG(g.numeric_grade) >= 93
GROUP BY "Student_Name";

/* #6 - List the names and address (including city and state) for all faculty who have taught less than 10 course selections */
SELECT i.First_name, i.last_name, i.street_address, z.city, z.state, z.zip
FROM instructor i JOIN zipcode z
ON i.zip = z.zip
JOIN section s
ON s.instructor_id = i.instructor_id
GROUP BY i.First_name, i.last_name, i.street_address, z.city, z.state, z.zip
HAVING count(section_id) < 10;

/* #7 - List the course number and number of students enrolled in courses that don't have a prerequisite. Sort the list by number of students enrolled from highest to lowest. */
SELECT ccourse_no, count(e.student_id) "ENROLLED"
FROM c.course JOIN s.section
ON c.course_no = s.course_no
JOIN e.section_id
ON s.section_id = e.section_id
WHERE c.prerequisite IS NULL;