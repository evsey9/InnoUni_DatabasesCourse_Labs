 SELECT MAX(COALESCE(enrolment, 0))
 AS max_enrolment
 FROM (
    SELECT COUNT(*) AS enrolment
    FROM takes
    WHERE semester='Fall' AND year=2022
    GROUP BY course_id, sec_id, semester, year
) AS enrolments
