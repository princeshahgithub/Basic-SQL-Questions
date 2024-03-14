# Write your MySQL query statement below
SELECT S.student_id, S.student_name, T.subject_name, count(E.student_id) AS attended_exams FROM Students S CROSS JOIN Subjects T 
LEFT JOIN Examinations E on E.student_id = S.student_id AND E.subject_name = T.subject_name
GROUP BY S.student_id, S.student_name, T.subject_name
ORDER BY S.student_id,T.subject_name ASC;