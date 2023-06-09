CREATE DATABASE QLDA;

USE QLDA;

CREATE TABLE DEAN (
  TENDA VARCHAR(15),
  MADA INT NOT NULL,
  DDIEM_DA VARCHAR(15) NOT NULL,
  PHONG INT NOT NULL,
  PRIMARY KEY (MADA)
);

CREATE TABLE PHONGBAN (
  TENPHG VARCHAR(15),
  MAPHG INT NOT NULL,
  TRPHG VARCHAR(9),
  NG_NHANCHUC DATE,
  PRIMARY KEY (MAPHG)
);

CREATE TABLE DIADIEM_PHG (
  MAPHG INT NOT NULL,
  DIADIEM VARCHAR(15),
  PRIMARY KEY (MAPHG, DIADIEM)
);

CREATE TABLE NHANVIEN (
  HONV VARCHAR(15),
  TENLOT VARCHAR(15),
  TENNV VARCHAR(15),
  MANV VARCHAR(9) NOT NULL,
  NGSINH DATE,
  DCHI VARCHAR(30),
  PHAI VARCHAR(3),
  LUONG FLOAT,
  MA_NQL VARCHAR(9),
  PHG INT NOT NULL,
  PRIMARY KEY (MANV),
  FOREIGN KEY (PHG) REFERENCES PHONGBAN(MAPHG),
  FOREIGN KEY (MA_NQL) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE THANNHAN (
  MA_NVIEN VARCHAR(9) NOT NULL,
  TENTN VARCHAR(15),
  PHAI VARCHAR(3),
  NGSINH DATE,
  QUANHE VARCHAR(15),
  PRIMARY KEY (MA_NVIEN, TENTN),
  FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV)
);

CREATE TABLE CONGVIEC (
  MADA INT NOT NULL,
  STT INT NOT NULL,
  TEN_CONG_VIEC VARCHAR(50),
  PRIMARY KEY (MADA, STT),
  FOREIGN KEY (MADA) REFERENCES DEAN(MADA)
);

CREATE TABLE PHANCONG (
  MA_NVIEN VARCHAR(9) NOT NULL,
  MADA INT NOT NULL,
  STT INT NOT NULL,
  THOIGIAN FLOAT,
  PRIMARY KEY (MA_NVIEN, MADA, STT),
  FOREIGN KEY (MA_NVIEN) REFERENCES NHANVIEN(MANV),
  FOREIGN KEY (MADA) REFERENCES DEAN(MADA)
);


