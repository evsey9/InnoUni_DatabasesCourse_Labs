SELECT * FROM (
    SELECT COUNT(*) AS enrolment, course_id, sec_id, semester, year
    FROM takes
    GROUP BY course_id, sec_id, semester, year
) AS enrolments
WHERE
enrolment IN
(
	 SELECT MAX(COALESCE(enrolment, 0))
 AS max_enrolment
 FROM (
    SELECT COUNT(*) AS enrolment, course_id, sec_id, semester, year
    FROM takes
    GROUP BY course_id, sec_id, semester, year
) AS enrolments
)
