use quanlysinhvien;

SELECT * FROM student WHERE studentname LIKE 'h%';

SELECT * FROM class WHERE MONTH(startdate) = 12;

SELECT * FROM subject WHERE credit BETWEEN 3 AND 5;

update student set ClassId = 2 where StudentName = 'Hung';

SELECT s.StudentName, c.SubName, m.Mark
FROM student s
JOIN mark m ON s.StudentID = m.StudentID
JOIN subject c ON m.subID = c.subID
ORDER BY m.Mark DESC, s.StudentName ASC;
