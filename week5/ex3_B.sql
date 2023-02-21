 SELECT 
 MAX(COALESCE(enrolment, 0)) AS max_enrolment, 
 MIN(COALESCE(enrolment, 0)) AS min_enrolment
 FROM (
    SELECT COUNT(*) AS enrolment, s.course_id, s.sec_id, s.semester, s.year
	 FROM section s
    LEFT JOIN takes t ON s.course_id = t.course_id
    AND s.sec_id = t.sec_id
    AND s.semester = t.semester
    AND s.year = t.year
    GROUP BY s.course_id, s.sec_id, s.semester, s.year
) AS enrolments
