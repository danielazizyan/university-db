CREATE FUNCTION GetDiscount()
RETURNS @Students TABLE
(
    student_id int,
    first_name varchar(20),
    last_name varchar(20),
    birthdate date,
    gpa decimal (4,2),
    pass varchar(3),
    discount_percentage int
)
AS
BEGIN
    DECLARE @tmp TABLE
    (
        id int identity(1,1),
        student_id int,
        first_name varchar(20),
        last_name varchar(20),
        birthdate date,
        gpa decimal (4,2),
        pass varchar(3)
    );

    INSERT INTO @tmp
    SELECT TOP 4
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
        S.student_id, S.first_name, S.last_name, S.birthdate
    ORDER BY
        GPA DESC;

    INSERT INTO @Students
    SELECT
        student_id,
        first_name,
        last_name,
        birthdate,
        gpa,
        pass,
        CASE WHEN id = 1 THEN 100 WHEN id = 2 THEN 50 ELSE 25 END AS discount_percentage
    FROM
        @tmp;

    RETURN;
END;
