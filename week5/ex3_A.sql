 SELECT MAX(COALESCE(enrolment, 0)) AS max_enrolment, 
 MIN(COALESCE(enrolment, 0)) AS min_enrolment
 FROM (
    SELECT 
	 (SELECT COUNT(*)
    FROM takes
    WHERE course_id = s.course_id
	  AND sec_id=s.sec_id
	  AND semester=s.semester
	  AND year=s.year
	  AND year=s.year) AS enrolment
	 FROM section s
) AS enrolments
