use quanlysinhvien;

SELECT *
FROM subject
WHERE credit = (SELECT MAX(credit) FROM subject);

select S.subid, S.subname, M.Mark
from subject S
join mark M on M.subid = S.SubId
where mark = (select max(mark) from mark);

select S.studentid, S.studentname, avg(Mark) as avg
from Student S join Mark M on S.studentid = M.studentid
group by S.studentid, S.studentname
order by avg desc;
