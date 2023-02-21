SELECT COUNT(*) AS enrolment, course_id, sec_id, semester, year
FROM takes
WHERE semester='Fall' AND year=2022
GROUP BY course_id, sec_id, semester, year
