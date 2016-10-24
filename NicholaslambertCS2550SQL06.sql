/* Nicholas Lambert */
/* #1 - List the student ID of the student that has enrolled in the most sections of 100 level courses (100 - 199). */
--TODO
SELECT e.student_id,
  s.course_no
FROM enrollment e
JOIN section s
ON e.section_id = s.section_id
WHERE course_no =
  (SELECT MAX(COUNT(Course_NO))
  FROM SECTION
  WHERE Course_no >= 100
  AND Course_no    < 200
  GROUP BY Course_NO
  );
/* #2 - Provide the student_id and name of the student that scored highest on the final exam (FI) in course 230 section 100. */
--TODO
SELECT g.student_id, s.last_name, s.first_name, g.grade_type_code, g.numeric_grade
FROM grade g JOIN student s
ON g.student_id = s.student_id
JOIN section se
ON se.section_id = g.section_id
WHERE g.numeric_grade = (
  SELECT MAX(numeric_grade)
  FROM grade g JOIN section s
  ON g.section_id = s.section_id
  WHERE grade_type_code LIKE 'FI'
  AND g.section_id = '100'
  AND s.course_no = '230'
  )
AND se.course_no LIKE '230'
AND g.grade_type_code LIKE 'FI';

/* #3 - Provide an alphabetic listing of instructors who have never taught a course section. */
SELECT Salutation, first_name, last_name, instructor_id, zip
FROM Instructor
WHERE instructor_id NOT IN (
  SELECT DISTINCT instructor_id
  FROM section
  )
ORDER BY last_name, first_name;

/* #4 - Generate an alphabetic listing containing the last names and final exam grade (FI) of students who scored above average on the final exam for section 90. */
SELECT s.last_name, g.numeric_grade
FROM student s JOIN grade g
ON s.student_id = g.student_id;