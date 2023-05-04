use quanlysinhvien;
select address, count(*) as 'Số lượng học viên'
from student
group by address;

WITH temp_avg AS (
  SELECT StudentId, AVG(Mark) AS avg_mark
  FROM Mark
  GROUP BY StudentId
), max_avg AS (
  SELECT MAX(avg_mark) AS max_avg_mark
  FROM temp_avg
)
SELECT temp_avg.StudentId, StudentName, temp_avg.avg_mark, max_avg.max_avg_mark
FROM Student
JOIN temp_avg ON Student.StudentId = temp_avg.StudentId
JOIN max_avg
WHERE temp_avg.avg_mark = max_avg.max_avg_mark;






