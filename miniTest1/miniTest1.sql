
-- Tạo db ---------------------------------------------------------------
create database QuanLyHocVien;
use QuanLyHocVien;

CREATE TABLE Address (
  id INT PRIMARY KEY,
  address VARCHAR(45)
);

CREATE TABLE Classes (
  id INT PRIMARY KEY,
  name VARCHAR(45),
  language VARCHAR(45),
  description VARCHAR(45)
);

CREATE TABLE Students (
  id INT PRIMARY KEY,
  fullname VARCHAR(45),
  address_id INT,
  age INT,
  phone CHAR(10) UNIQUE,
  classes_id INT,
  FOREIGN KEY (address_id) REFERENCES Address(id),
  FOREIGN KEY (classes_id) REFERENCES Classes(id)
);

CREATE TABLE Course (
  id INT PRIMARY KEY,
  name VARCHAR(45),
  description VARCHAR(45)
);

CREATE TABLE Point (
  id INT PRIMARY KEY,
  course_id INT,
  student_id INT,
  point INT,
  FOREIGN KEY (course_id) REFERENCES Course(id),
  FOREIGN KEY (student_id) REFERENCES Students(id)
);

-- Thêm 5 bản ghi vào bảng Address
INSERT INTO Address (id, address) VALUES
(1, '123 Đường A, Quận 1, HN'),
(2, '456 Đường B, Quận 2, TB'),
(3, '789 Đường C, Quận 3, TP. HCM'),
(4, '1011 Đường D, Quận 4, HP'),
(5, '1213 Đường E, Quận 5, ĐN');

-- Thêm 5 bản ghi vào bảng Course
INSERT INTO Course (id, name, description) VALUES
(1, 'Toán học', 'Giới thiệu về toán học'),
(2, 'Vật lý', 'Các nguyên lý cơ bản của vật lý'),
(3, 'Hóa học', 'Giới thiệu về hóa học'),
(4, 'Lịch sử', 'Những sự kiện lịch sử quan trọng'),
(5, 'Ngoại ngữ', 'Học ngoại ngữ cơ bản');

-- Thêm 5 bản ghi vào bảng Classes
INSERT INTO Classes (id, name, language, description) VALUES
(1, 'Toán', 'Tiếng Việt', 'Học toán cơ bản'),
(2, 'Vật lý', 'Tiếng Anh', 'Học vật lý cơ bản'),
(3, 'Hóa học', 'Tiếng Việt', 'Học hóa học cơ bản'),
(4, 'Lịch sử', 'Tiếng Việt', 'Học lịch sử thế giới'),
(5, 'Ngoại ngữ', 'Tiếng Anh', 'Học tiếng Anh cơ bản');

-- Thêm 10 bản ghi vào bảng Students
INSERT INTO Students (id, fullname, address_id, age, phone, classes_id) VALUES
(1, 'Nguyễn Văn A', 1, 18, '0123456789', 1),
(2, 'Trần Thị B', 2, 19, '0234567891', 2),
(3, 'Lê Văn C', 3, 20, '0345678912', 3),
(4, 'Phạm Thị D', 4, 21, '0456789123', 4),
(5, 'Nguyễn Thanh E', 5, 22, '0567891234', 5),
(6, 'Hoàng Văn F', 1, 18, '0678912345', 1),
(7, 'Lê Thị G', 2, 19, '0789123456', 2),
(8, 'Trần Văn H', 3, 20, '0891234567', 3),
(9, 'Nguyễn Thị I', 5, 22, '0912345678', 4),
(10, 'Trần Thanh J', 1, 18, '0111111111', 5);

-- Thêm 15 bản ghi vào bảng Point
INSERT INTO Point (id, course_id, student_id, point) VALUES
(1, 1, 1, 8),
(2, 1, 2, 9),
(3, 1, 3, 7),
(4, 1, 4, 8),
(5, 1, 5, 9),
(6, 2, 6, 7),
(7, 2, 7, 8),
(8, 2, 8, 9),
(9, 2, 9, 8),
(10, 2, 10, 7),
(11, 3, 1, 9),
(12, 3, 2, 8),
(13, 3, 3, 7),
(14, 3, 4, 9),
(15, 3, 5, 8);

-- QUERY ----------------------------------------------------------------

-- HV có họ Nguyễn
select fullname
from students
where fullname like 'Nguyễn%';

-- HV có tên A
select fullname
from students
where fullname like '%A';

-- HV có độ tuổi từ 18-25
select fullname, age, c.name
from students s
         join classes c on s.classes_id = c.id
where age between 20 and 25;

-- HV có id là 12 hoặc 13
select id, fullname
from students
where id = 12
   or id = 13;

-- Thống kê số lượng học viên các lớp
select c.name, count(s.id) as studentCount
from students s
         join classes c on s.classes_id = c.id
group by c.id;

-- Thống kê số lượng học viên tại các tỉnh
select a.address, count(s.id) as studentCount
from students s
         join address a on s.address_id = a.id
group by a.address;

-- Tạo view tính điểm trung bình của các khóa học
create or replace view avgPoints as
select c.name as Course, ROUND(AVG(point), 3) as avg_point
from point as p
         join classes c on c.id = p.course_id
group by course_id;

set @max_avg = (SELECT MAX(avg_point)
                FROM avgPoints);

-- Điểm trung bình của các khóa học
select * from avgPoints;

-- Khóa học có điểm trung bình cao nhất
select * from avgPoints
where avg_point = @max_avg;











