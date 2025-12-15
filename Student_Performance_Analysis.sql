SELECT 
    s.teacher_id,
    ROUND(AVG(t.score), 2) AS avg_score,
    COUNT(
        CASE 
            WHEN a.attendance_percentage < 70 
             AND t.score < 60 
            THEN 1 
        END
    ) AS high_risk_students
FROM students s
JOIN attendance a ON s.student_id = a.student_id
JOIN test_scores t ON s.student_id = t.student_id
GROUP BY s.teacher_id
ORDER BY avg_score DESC;
