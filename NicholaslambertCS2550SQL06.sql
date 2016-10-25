/* Nicholas Lambert */
/* #1 - List the student ID of the student that has enrolled in the most sections of 100 level courses (100 - 199). */
SELECT Student_id
FROM (
  SELECT COUNT(*), e.student_id
  FROM enrollment e JOIN section se
  ON e.section_id = se.section_id
  WHERE se.course_no LIKE '1%'
  GROUP BY e.student_id
  ORDER BY COUNT(*) DESC)
WHERE ROWNUM = 1;
/* #2 - Provide the student_id and name of the student that scored highest on the final exam (FI) in course 230 section 100. */
SELECT student_id, last_name, first_name
FROM (
  SELECT e.student_id, stu.last_name, stu.first_name, g.numeric_grade
  FROM grade g JOIN enrollment e
  ON g.student_id = e.student_id
  AND g.section_id = e.section_id
  JOIN section sec
  ON e.section_id = sec.section_id
  JOIN student stu
  ON e.student_id = stu.student_id
  WHERE g.grade_type_code LIKE 'FI'
  AND sec.course_no = 230
  AND sec.section_id = 100
  ORDER BY g.numeric_grade DESC)
WHERE ROWNUM = 1;

/* #3 - Provide an alphabetic listing of instructors who have never taught a course section. */
SELECT Salutation, first_name, last_name, zip
FROM Instructor
WHERE instructor_id NOT IN (
  SELECT DISTINCT instructor_id
  FROM section
  )
ORDER BY last_name, first_name;

/* #4 - Generate an alphabetic listing containing the last names and final exam grade (FI) of students who scored above average on the final exam for section 90. */
SELECT s.last_name, g.numeric_grade
FROM grade g JOIN enrollment e
ON g.student_id = e.student_id
AND g.section_id = e.section_id
JOIN student s
ON e.student_id = s.student_id
WHERE g.numeric_Grade > (
  SELECT AVG(numeric_grade)
  FROM grade
  WHERE section_id = 90
  AND grade_type_code LIKE 'FI')
AND g.section_id = 90
AND g.grade_type_code = 'FI'
ORDER BY s.last_name;

/* #5 -List the course number and course description of the courses with the lowest number of enrolled students. Arrange the list on course number.****** */
SELECT course_no, description
FROM (
  SELECT s.course_no, c.description
  FROM enrollment e JOIN section s
  ON e.section_id = s.section_id
  JOIN course c
  ON s.course_no = c.course_no
  GROUP BY s.course_no, c.description
  HAVING 'Enrolled' = MIN('Enrolled')
  ORDER BY COUNT(*)
)
WHERE ROWNUM <= 3
ORDER BY course_no;

/* #6 - List course number and course description for all courses that have at least one 10:30AM section. Sort by course number. */
SELECT c.course_no, c.description
FROM course c JOIN section s
ON c.course_no = s.course_no
WHERE To_Char(s.start_date_time, 'HH:MI') = '10:30'
ORDER BY c.course_no;

/* #7 - List the student_id and last_name of students who received a below average grade on the third quiz in section 120. */
--Well, that's one way of doing it
SELECT student_id, last_name
FROM (
  SELECT s.student_id, s.last_name, g.numeric_grade
  FROM student s JOIN enrollment e
  ON s.student_id = e.student_id
  JOIN grade g
  ON e.student_id = g.student_id
  AND e.section_id = g.section_id
  WHERE g.grade_code_occurrence = '3'
  AND g.grade_type_code = 'QZ'
  AND g.section_id = 120
  ORDER BY g.numeric_grade ASC)
WHERE ROWNUM = 1;

/* #8 - Provide an alphabetic list containing the full names and phone numbers of students who have taken both the Systems Analysis and the Project Management courses.  You must use the title of the course in your query, not the course number. */
-- TODO
SELECT c.Description, st.first_name, st.last_name, st.phone, st.student_id
FROM course c JOIN section s
ON c.course_no = s.course_no
JOIN enrollment e
ON s.section_id = e.section_id
JOIN student st
ON e.student_id = st.student_id
WHERE description LIKE 'Systems Analysis'
OR description LIKE 'Project Management';

/* #9 - List the instructor name and course description of the Java courses that have been taught by the Instructor that has taught the most Java courses.
Sort on instructor name and course description.******/
SELECT i.first_name, i.last_name, c.course_no, c.description
FROM instructor i JOIN section s
ON i.instructor_id = s.instructor_id
JOIN course c
ON s.course_no = c.course_no
JOIN (
  SELECT i.first_name
  FROM section s JOIN instructor i
  ON s.instructor_id = i.instructor_id
  JOIN course c
  ON c.course_no = s.course_no
  WHERE c.description LIKE '%Java%'
  AND ROWNUM = 1
  GROUP BY i.first_name
  ORDER BY COUNT(*) DESC) d
ON i.first_name = d.first_name
WHERE i.first_name = d.first_name
AND c.description LIKE '%Java%'
ORDER BY c.description;

/* #10 - List the student_id and last_name of students who received an above average grade on the Final Exam in section 130. */
SELECT s.student_id, s.last_name
FROM grade g JOIN enrollment e
ON g.student_id = e.student_id
AND g.section_id = e.section_id
JOIN student s
ON e.student_id = s.student_id
WHERE g.numeric_Grade > (
  SELECT AVG(numeric_grade)
  FROM grade
  WHERE section_id = 130
  AND grade_type_code LIKE 'FI')
AND g.section_id = 130
AND g.grade_type_code = 'FI'
ORDER BY s.last_name;