/*Nicholas Lambert*/

/* #1 - Provide an alphabetical list of the full name and phone number of all students that work for 'New York Culture' (the full name should be displayed as one column with an alias of 'Student Name') */
SELECT concat(first_name, last_name) "Student Name", phone
FROM Student
WHERE Employer LIKE 'New York Culture'
ORDER BY last_name, first_name DESC;

/* #2 - Provide a list of student employers that are corporations (have "Co." in their name). List each employer only once and arrange the list alphabetical order. */
SELECT DISTINCT Employer
FROM Student
WHERE Employer LIKE '%Co.'
ORDER BY Employer Asc;

/* #3 - Provide an alphabetical list of students in area code 617. List student name in the format <last name (all upper case)>, <first initial>. ( Example, SMITH, J. ) followed by the phone number. */
/*NEEDS WORK*/
SELECT (last_name|| ' '|| first_name) "Student Name", Phone
FROM Student
WHERE Phone LIKE '617%';

/* #4 - List the name and address of all instructors without a zip code. */
SELECT (first_name|| ' '|| last_name) "Instructor", Street_Address
FROM Instructor
WHERE Zip IS NULL;

/* #5 - Provide a list of zip codes for Jackson Heights, NY.  Sort on zip. */
SELECT Zip
FROM ZIPCODE
WHERE city LIKE 'Jackson Heights';

/* #6 - List the course number and location for all courses taught in a classroom that ends in the number 10.  Arrange the list on location. */
SELECT Course_No, Location
FROM Section
WHERE Location LIKE '%10'
ORDER BY location ASC;

/* #7 - Provide a list containing full state name, state abbreviation and city from the zip code table for MA, OH, PR and WV. (You'll need to use the CASE expression).
MA is Massachusetts, OH is Ohio, PR is Puerto Rico and WV is West Virginia.  Sort by state. */
/*NEEDS WORK*/
SELECT state, state, city
FROM zipcode;

/* #8 - Create a listing containing single column address (salutation, first name, last name, address, zip) as 'Instructor Address' for each instructor in zip code 10015.
Sort the list in alphabetical order. */
SELECT (salutation|| '. '|| first_name|| ' '||last_name|| ' '||street_address|| ' '|| zip) "Instructor Address"
FROM instructor
WHERE zip LIKE '10015'
ORDER BY last_name, first_name DESC;

/* #9 - List the student id and quiz score for each student in section 152. List the scores from highest to lowest. */
SELECT student_id, numeric_grade
FROM GRADE
WHERE section_id LIKE '152'
AND grade_type_code LIKE 'QZ'
ORDER BY numeric_grade DESC;

/* #10 - List the student ID, final exam (FI) score and exam result ('PASS' or 'FAIL') for all students in section 156. A final score of 85 or higher is required to pass .
Arrange the list by student ID. */
SELECT Student_id, numeric_grade, numeric_grade "RESULT"
FROM Grade
WHERE grade_type_code LIKE 'FI';