/* Nicholas Lambert */
/* #1 - List the student ID of the student that has enrolled in the most sections of 100 level courses (100 - 199). */
--TODO
SELECT student_id
FROM enrollment e JOIN section s
ON e.section_id = s.section_id
WHERE s.Course_no = (SELECT MAX(COUNT(Course_NO))
          FROM Section
          GROUP BY Section_no)
ORDER BY Student_ID;
/* #2 - Provide the student_id and name of the student that scored highest on the final exam (FI) in course 230 section 100. */
SELECT Student_ID, Last_Name, First_Name
FROM 