-- CREATE DATABASE ThucTap;
-- USE ThucTap;

-- CREATE TABLE Khoa (
--   MaKhoa CHAR(10) PRIMARY KEY,
--   TenKhoa VARCHAR(30) NOT NULL,
--   DienThoai CHAR(10)
-- );

-- CREATE TABLE GiangVien (
--   MaGV INT PRIMARY KEY,
--   HoTenGV VARCHAR(30) NOT NULL,
--   Luong DECIMAL(5,2),
--   MaKhoa CHAR(10),
--   CONSTRAINT fk_GV_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
-- );

-- CREATE TABLE SinhVien (
--   MaSV INT PRIMARY KEY,
--   HoTenSV VARCHAR(30) NOT NULL,
--   MaKhoa CHAR(10),
--   NamSinh INT,
--   QueQuan VARCHAR(30),
--   CONSTRAINT fk_SV_Khoa FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
-- );

-- CREATE TABLE DeTai (
--   MaDT CHAR(10) PRIMARY KEY,
--   TenDT VARCHAR(30) NOT NULL,
--   KinhPhi INT,
--   NoiThucTap VARCHAR(30)
-- );

-- CREATE TABLE HuongDan (
--   MaSV INT,
--   MaDT CHAR(10),
--   MaGV INT,
--   KetQua DECIMAL(5,2),
--   CONSTRAINT pk_HD PRIMARY KEY (MaSV, MaDT),
--   CONSTRAINT fk_HD_SV FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
--   CONSTRAINT fk_HD_DT FOREIGN KEY (MaDT) REFERENCES DeTai(MaDT),
--   CONSTRAINT fk_HD_GV FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV)
-- );

-- INSERT INTO Khoa (MaKhoa, TenKhoa, DienThoai) VALUES
-- ('KH01', 'Khoa Công nghệ thông tin', '0123456789'),
-- ('KH02', 'Khoa Kinh tế', '0987654321');

-- INSERT INTO GiangVien (MaGV, HoTenGV, Luong, MaKhoa) VALUES
-- (1, 'Nguyen Van A', 1000.00, 'KH01'),
-- (2, 'Tran Thi B', 1200.00, 'KH02'),
-- (3, 'Le Van C', 1500.00, 'KH01');

-- INSERT INTO SinhVien (MaSV, HoTenSV, MaKhoa, NamSinh, QueQuan) VALUES
-- (1, 'Nguyen Thi D', 'KH02', 2000, 'Ha Noi'),
-- (2, 'Tran Van E', 'KH01', 2001, 'Hai Phong'),
-- (3, 'Le Thi F', 'KH02', 1999, 'HCMC');

-- INSERT INTO DeTai (MaDT, TenDT, KinhPhi, NoiThucTap) VALUES
-- ('DT01', 'Xay dung website', 5000000, 'Ha Noi'),
-- ('DT02', 'Lap trinh game', 8000000, 'HCMC'),
-- ('DT03', 'Phan tich du lieu', 10000000, 'Da Nang');

-- INSERT INTO HuongDan (MaSV, MaDT, MaGV, KetQua) VALUES
-- (1, 'DT01', 1, 8.5),
-- (2, 'DT02', 2, 9.0),
-- (3, 'DT03', 3, 7.5);

-- INSERT INTO Khoa (MaKhoa, TenKhoa, DienThoai) VALUES
-- ('Geo', 'Dia ly va QLTN', '3855413'),
-- ('Math', 'Toan', '3855411'),
-- ('Bio', 'Cong nghe Sinh hoc', '3855412');

-- INSERT INTO GiangVien (MaGV, HoTenGV, Luong, MaKhoa) VALUES
-- (11, 'Thanh Xuan', 700, 'Geo'),
-- (12, 'Thu Minh', 500, 'Math'),
-- (13, 'Chu Tuan', 650, 'Geo'),
-- (14, 'Le Thi Lan', 500, 'Bio'),
-- (15, 'Tran Xoay', 900, 'Math');

-- INSERT INTO SinhVien (MaSV, HoTenSV, MaKhoa, NamSinh, QueQuan) VALUES
-- (1, 'Le Van Son', 'Bio', 1990, 'Nghe An'),
-- (2, 'Nguyen Thi My', 'Geo', 1990, 'Thanh Hoa'),
-- (3, 'Bui Xuan Duc', 'Math', 1992, 'Ha Noi'),
-- (4, 'Nguyen Van Tung', 'Bio', null, 'Ha Tinh'),
-- (5, 'Le Khanh Linh', 'Bio', 1989, 'Ha Nam'),
-- (6, 'Tran Khac Trong', 'Geo', 1991, 'Thanh Hoa'),
-- (7, 'Le Thi Van', 'Math', null, null),
-- (8, 'Hoang Van Duc', 'Bio', 1992, 'Nghe An');

-- INSERT INTO DeTai (MaDT, TenDT, KinhPhi, NoiThucTap) VALUES
-- ('Dt01', 'GIS', 100, 'Nghe An'),
-- ('Dt02', 'ARC GIS', 500, 'Nam Dinh'),
-- ('Dt03', 'Spatial DB', 100, 'Ha Tinh'),
-- ('Dt04', 'MAP', 300, 'Quang Binh');

-- INSERT INTO HuongDan (MaSV, MaDT, MaGV, KetQua) VALUES
-- (1, 'Dt01', 13, 8),
-- (2, 'Dt03', 14, 0),
-- (3, 'Dt03', 12, 10),
-- (5, 'Dt04', 14, 7),
-- (6, 'Dt01', 13, null),
-- (7, 'Dt04', 11, 10),
-- (8, 'Dt03', 15, 6);


-- DELETE FROM HuongDan;
-- DELETE FROM DeTai;
-- DELETE FROM SinhVien;
-- DELETE FROM GiangVien;
-- DELETE FROM Khoa;

SELECT gv.MaGV, gv.HoTenGV, k.TenKhoa, COUNT(hd.MaSV) AS SoSVDaHuongDan
FROM GiangVien gv
JOIN Khoa k ON gv.MaKhoa = k.MaKhoa
JOIN HuongDan hd ON gv.MaGV = hd.MaGV
GROUP BY gv.MaGV;

SELECT gv.Magv, gv.Hotengv, k.Tenkhoa, count(hd.MaSV) as SoSvDaHuongDan
FROM GiangVien gv
INNER JOIN Khoa k ON gv.Makhoa = k.Makhoa
INNER JOIN HuongDan hd ON gv.Magv = hd.Magv
GROUP BY gv.Magv
HAVING COUNT(hd.Masv) >= 2;

SELECT *
FROM SinhVien SV JOIN HuongDan HD
ON HD.Masv = SV.Masv
WHERE HD.KetQua is Null;

SELECT K.dienthoai
FROM Khoa K join SinhVien SV
ON K.Makhoa = SV.Makhoa
WHERE SV.Hotensv = 'Bui Xuan Duc';

select dt.madt, dt.tendt, count(hd.madt) as SoSVThamGia
from detai dt join huongdan hd
on dt.madt = hd.madt
group by madt
having count(hd.madt >=2);

set @max_kinhphi = (SELECT MAX(kinhphi) FROM detai);
SELECT madt, tendt, kinhphi
FROM detai
WHERE kinhphi = @max_kinhphi;

SELECT K.Tenkhoa as 'Khoa' , COUNT(SV.Makhoa) AS 'Số SV'
FROM SinhVien SV JOIN Khoa K
ON SV.Makhoa = K.Makhoa
GROUP BY K.Tenkhoa;

SELECT SV.Masv, SV.Hotensv, K.tenKhoa as Khoa, HD.KetQua
FROM SinhVien SV JOIN HuongDan HD
ON SV.Masv = HD.Masv
JOIN Khoa K
ON K.Makhoa = SV.Makhoa
WHERE K.Tenkhoa = 'Dia ly va QLTN' or K.tenkhoa = 'Toan';

SELECT MaSV, HoTenSV, (YEAR(now()) - Namsinh) as Tuoi
FROM SinhVien;


