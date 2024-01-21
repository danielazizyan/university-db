SELECT * FROM Members;
SELECT * FROM Students S
INNER JOIN Grades G on G.student_id=S.student_id
SELECT * FROM Subjects;
SELECT * FROM Grades;
SELECT * FROM GetFinalGrade()
SELECT * FROM GetDiscount()
SELECT * FROM GetStatus()
ORDER BY gpa DESC
