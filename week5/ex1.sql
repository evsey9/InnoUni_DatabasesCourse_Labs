 SELECT MAX(COALESCE(enrolment, 0))
 AS max_enrolment, MIN(COALESCE(enrolment, 0)) AS min_enrolment
 FROM (
    SELECT COUNT(*) AS enrolment
    FROM takes
    GROUP BY course_id, sec_id, semester, year
) AS enrolments
