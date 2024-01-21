CREATE FUNCTION GetStatus()
RETURNS @Students TABLE
(
    student_id int,
    first_name varchar(20),
    last_name varchar(20),
    birthdate date,
    gpa decimal (4,2),
    pass varchar(3)
)
AS
BEGIN
    INSERT INTO @Students (student_id, first_name, last_name, birthdate, gpa, pass)
    SELECT
        S.student_id,
        S.first_name,
        S.last_name,
        S.birthdate,
        SUM(G.exam_grade * G.credit) / 30 AS GPA,
        CASE WHEN SUM(G.exam_grade * G.credit) / 30 >= 10 THEN 'YES' ELSE 'NO' END AS pass
    FROM
        Students S
    INNER JOIN
        Grades G ON G.student_id = S.student_id
    GROUP BY
        S.student_id, S.first_name, S.last_name, S.birthdate;

    RETURN;
END;
