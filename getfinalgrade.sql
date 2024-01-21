CREATE FUNCTION GetFinalGrade()
RETURNS @Grades TABLE
(
    subject_id int,
    exam_grade decimal(4,2),
    credit tinyint,
    student_id int,
    full_grade decimal (8,2)
)
AS
BEGIN
    INSERT INTO @Grades (subject_id, exam_grade, credit, student_id, full_grade)
    SELECT
        G.subject_id,
        G.exam_grade,
        G.credit,
        G.student_id,
        G.exam_grade * G.credit AS full_grade
    FROM
        Grades G;

    RETURN;
END;
