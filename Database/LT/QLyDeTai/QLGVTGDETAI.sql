CREATE DATABASE QUANLYGIAOVIENTHAMGIADETAI
GO
USE QUANLYGIAOVIENTHAMGIADETAI
GO

CREATE TABLE GIAOVIEN
(
	MAGV		CHAR(3)	NOT NULL PRIMARY KEY,
	HOTEN		NVARCHAR(20),	
	LUONG		INT,
	PHAI		NCHAR(3)	CHECK (PHAI IN (N'Nam',N'Nữ')),
	NGAYSINH	DATE,
	DIACHI		NVARCHAR(50),
	GVQLCM		CHAR(3)	NULL
	CONSTRAINT	FK_GIAOVIEN_GVQLCM	
	FOREIGN KEY (GVQLCM)
	REFERENCES	GIAOVIEN(MAGV),
	MABM		NVARCHAR(5)	NULL
)
GO
CREATE TABLE KHOA
(
	MAKHOA			NVARCHAR(5)	NOT NULL PRIMARY KEY,
	TENKHOA			NVARCHAR(20),
	NAMTL			CHAR(4),
	PHONG			CHAR(3),
	DIENTHOAI		CHAR(10),
	TRUONGKHOA		CHAR(3)	NULL
	CONSTRAINT		FK_KHOA_GIAOVIEN
	FOREIGN KEY		(TRUONGKHOA)
	REFERENCES		GIAOVIEN(MAGV),
	NGAYNHANCHUC	DATE
)
GO
CREATE TABLE BOMON
(
	MABM			NVARCHAR(5)	NOT NULL PRIMARY KEY,
	TENBM			NVARCHAR(20),
	PHONG			CHAR(3),
	DIENTHOAI		CHAR(10),
	TRUONGBM		CHAR(3)	NULL
	CONSTRAINT		FK_BOMON_GIAOVIEN
	FOREIGN KEY		(TRUONGBM)
	REFERENCES		GIAOVIEN(MAGV),
	MAKHOA			NVARCHAR(5)	NULL
	CONSTRAINT		FK_BOMON_KHOA
	FOREIGN KEY		(MAKHOA)
	REFERENCES		KHOA(MAKHOA),
	NGAYNHANCHUC	DATE
)
GO
ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_GIAOVIEN_BOMON
FOREIGN KEY (MABM)
REFERENCES	BOMON(MABM)
GO
CREATE TABLE GV_DT
(
	MAGV		CHAR(3)		NOT NULL,
	DIENTHOAI	CHAR(10)	NOT NULL,
	CONSTRAINT	PK_GV_DT	
	PRIMARY KEY	(MAGV,DIENTHOAI),
	CONSTRAINT	FK_GV_DT_GIAOVIEN
	FOREIGN KEY	(MAGV)
	REFERENCES	GIAOVIEN(MAGV)
)
GO
CREATE TABLE NGUOITHAN
(
	MAGV	CHAR(3)			NOT NULL,
	TEN		NVARCHAR(10)	NOT NULL,
	NGSINH	DATE,
	PHAI	NCHAR(3)	CHECK (PHAI IN (N'Nam',N'Nữ')),
	CONSTRAINT PK_NGUOITHAN	PRIMARY KEY (MAGV,TEN),
	CONSTRAINT FK_NGUOITHAN_GIAOVIEN
	FOREIGN KEY	(MAGV)
	REFERENCES	GIAOVIEN(MAGV)
)
GO
CREATE TABLE CHUDE
(
	MACD	NVARCHAR(5)	NOT NULL PRIMARY KEY,
	TENCD	NVARCHAR(30)
)
GO
CREATE TABLE DETAI
(
	MADT	CHAR(3)	NOT NULL PRIMARY KEY,
	TENDT	NVARCHAR(50),
	CAPQL	NVARCHAR(10),
	KINHPHI	DECIMAL(10,1),
	NGAYBD	DATE,
	NGAYKT	DATE,
	MACD	NVARCHAR(5)	NULL
	CONSTRAINT	FK_DETAI_CHUDE
	FOREIGN KEY	(MACD)
	REFERENCES	CHUDE(MACD),
	GVCNDT	CHAR(3)	NULL
	CONSTRAINT FK_DETAI_GIAOVIEN
	FOREIGN KEY	(GVCNDT)
	REFERENCES	GIAOVIEN(MAGV)
)
GO
CREATE TABLE CONGVIEC
(
	MADT	CHAR(3)	NOT NULL
	CONSTRAINT	FK_CONGVIEC_DETAI
	FOREIGN KEY	(MADT)
	REFERENCES	DETAI(MADT),
	SOTT	INT	NOT NULL,
	TENCV	NVARCHAR(50),
	NGAYBD	DATE,
	NGAYKT	DATE,
	CONSTRAINT PK_CONGVIEC
	PRIMARY KEY (MADT,SOTT)
)
GO
CREATE TABLE THAMGIADT
(
	MAGV	CHAR(3)	NOT NULL
	CONSTRAINT	FK_THAMGIADT_GIAOVIEN
	FOREIGN KEY	(MAGV)
	REFERENCES	GIAOVIEN(MAGV),
	MADT	CHAR(3)	NOT NULL,
	STT		INT		NOT NULL,
	CONSTRAINT FK_THAMGIADT_CONGVIEC
	FOREIGN KEY (MADT,STT)
	REFERENCES CONGVIEC(MADT,SOTT),
	PHUCAP	DECIMAL(2,1),
	KETQUA	NVARCHAR(5),
	CONSTRAINT PK_THAMGIADT
	PRIMARY KEY (MAGV,MADT,STT)
)
GO
--NHẬP ========================================
-----GIAOVIEN
INSERT INTO GIAOVIEN
VALUES	('001',N'Nguyễn Hoài Ân',2000,'Nam','02/15/1973',N'25/3 Lạc Long Quân, Q.10, TPHCM',NULL,NULL),
		('002',N'Trần Trà Hương',2500,N'Nữ','06/20/1960',N'125 Trần Hưng Đạo, Q.1, TPHCM',NULL,NULL),
		('003',N'Nguyễn Ngọc Ánh',2200,N'Nữ','05/11/1975',N'12/21 Võ Văn Ngân, Thủ Đức, TPHCM','002',NULL),
		('004',N'Trương Nam Sơn',2300,'Nam','06/20/1959',N'215 Lý Thường Kiệt, TP Biên Hòa',NULL,NULL),
		('005',N'Lý Hoàng Hà',2500,'Nam','10/23/1954',N'25/5 Nguyễn Xí, Q Bình Thạnh, TPHCM',NULL,NULL),
		('006',N'Trần Bạch Tuyết',1500,N'Nữ','05/20/1980',N'127 Hùng Vương, TP Mỹ Tho','004',NULL),
		('007',N'Nguyễn An Trung',2100,'Nam','06/05/1976',N'234 3/2, TP Biên Hòa',NULL,NULL),
		('008',N'Trần Trung Hiếu',1800,'Nam','08/06/1977',N'22/11 Lý Thường Kiệt, TP Mỹ Tho','007',NULL),
		('009',N'Trần Hoàng Nam',2000,'Nam','11/22/1975',N'234 Trần Não, An Phú, TPHCM','001',NULL),
		('010',N'Phạm Nam Thanh',1500,'Nam','12/12/1980',N'221 Hùng Vương, Q.5, TPHCM','007',NULL)
GO
------KHOA
INSERT INTO KHOA
VALUES ('CNTT',N'Công nghệ thông tin','1995','B11','0838123456','002','02/20/2005'),
	   ('HH',N'Hóa học','1980','B41','0838456456','007','10/15/2001'),
	   ('SH',N'Sinh học','1980','B31','0838454545','004','10/11/2000'),
	   ('VL',N'Vật lý','1976','B21','0838223223','005','09/18/2003')
GO
------ BOMON
INSERT INTO BOMON
VALUES ('CNTT',N'Công nghệ tri thức','B15','0838126126',NULL,'CNTT',NUll),
	   ('HHC',N'Hóa hữu cơ','B44','0838222222',NULL,'HH',NULL),
	   ('HL',N'Hóa lý','B42','0838878787',NULL,'HH',NULL),
	   ('HPT',N'Hóa phân tích','B43','0838777777','007','HH','10/15/2007'),
	   ('HTTT',N'Hệ thống thông tin','B13','0838125125','002','CNTT','09/20/2004'),
	   ('MMT',N'Mạng máy tính','B16','0838676767','001','CNTT','05/15/2005'),
	   ('SH',N'Sinh hóa','B33','0838898989',NULL,'SH',NULL),
	   (N'VLĐT',N'Vật lý điện tử','B23','0838234234',NULL,'VL',NULL),
	   (N'VLƯD',N'Vật lý ứng dụng','B24','0838454545','005','VL','02/18/2006'),
	   (N'VS',N'Vi sinh','B32','0838909090','004','SH','01/01/2007')
GO
------ Cập nhật "MABM" của "GIAOVIEN"
UPDATE GIAOVIEN
SET	MABM = 'MMT' WHERE	MAGV='001'
UPDATE GIAOVIEN
SET	MABM = 'HTTT' WHERE	MAGV='002'
UPDATE GIAOVIEN
SET	MABM = 'HTTT' WHERE	MAGV='003'
UPDATE GIAOVIEN
SET	MABM = 'VS' WHERE	MAGV='004'
UPDATE GIAOVIEN
SET	MABM = 'VLĐT' WHERE	MAGV='005'
UPDATE GIAOVIEN
SET	MABM = 'VS' WHERE	MAGV='006'
UPDATE GIAOVIEN
SET	MABM = 'HPT' WHERE	MAGV='007'
UPDATE GIAOVIEN
SET	MABM = 'HPT' WHERE	MAGV='008'
UPDATE GIAOVIEN
SET	MABM = 'MMT' WHERE	MAGV='009'
UPDATE GIAOVIEN
SET	MABM = 'HPT' WHERE	MAGV='010'
GO
------ GV_DT
INSERT INTO GV_DT
VALUES ('001','0838912112'),
	   ('001','0903123123'),
	   ('002','0913454545'),
	   ('003','0838121212'),
	   ('003','0903656565'),
	   ('003','0937125125'),
	   ('006','0937888888'),
	   ('008','0653717171'),
	   ('008','0913232323')
GO	   
------ NGUOITHAN
INSERT INTO NGUOITHAN
VALUES ('001',N'Hùng','01/14/1990',N'Nam'),
	   ('001',N'Thủy','12/08/1994',N'Nữ'),
	   ('003',N'Hà','09/03/1998',N'Nữ'),
	   ('003','Thu','09/03/1998',N'Nữ'),
	   ('007','Mai','03/26/2003',N'Nữ'),
	   ('007','Vy','02/14/2000',N'Nữ'),
	   ('008','Nam','05/06/1991',N'Nam'),
	   ('009','An','08/19/1996',N'Nam'),
	   ('010','Nguyệt','01/14/2006',N'Nữ')
GO
------ CHUDE
INSERT INTO CHUDE
VALUES ('NCPT',N'Nghiên cứu phát triển'),
	   ('QLGD',N'Quản lý giáo dục'),
	   ('UDCN',N'Ứng dụng công nghệ')
GO
------ DETAI
INSERT INTO DETAI
VALUES ('001',N'HTTT quản lý các trường ĐH','ĐHQG','20','10/20/2007','10/20/2008','QLGD','002'),
	   ('002',N'HTTT quản lý giáo vụ cho một Khoa',N'Trường','20','10/12/2000','10/12/2001','QLGD','002'),
	   ('003',N'Nghiên cứu chế tạo sợi Nanô Platin','ĐHQG','300','05/15/2008','05/15/2010','NCPT','005'),
	   ('004',N'Tạo vật liệu sinh học bằng màng ối người',N'Nhà nước','100','01/01/2007','12/31/2009','NCPT','004'),
	   ('005',N'Ứng dụng hóa học xanh',N'Trường','200','10/10/2003','12/10/2004','UDCN','007'),
	   ('006',N'Nghiên cứu tế bào gốc',N'Nhà nước','4000','10/20/2006','10/20/2009','NCPT','004'),
	   ('007',N'HTTT quản lý thư viện ở các trường ĐH',N'Trường','20','05/10/2009','05/10/2010','QLGD','001')
GO
------ CONGVIEC
INSERT INTO CONGVIEC
VALUES ('001','1',N'Khởi tạo và Lập kế hoạch','10/20/2007','12/20/2008'),
	   ('001','2',N'Xác định yêu cầu','12/21/2008','03/21/2008'),
	   ('001','3',N'Phân tích hệ thống','03/22/2008','05/22/2008'),
	   ('001','4',N'Thiết kế hệ thống','05/23/2008','06/23/2008'),
	   ('001','5',N'Cài đặt thử nghiệm','06/24/2008','10/20/2008'),
	   ('002','1',N'Khởi tạo và Lập kế hoạch','05/10/2009','07/10/2009'),
	   ('002','2',N'Xác định yêu cầu','07/11/2009','10/11/2009'),
	   ('002','3',N'Phân tích hệ thống','10/12/2009','12/20/2009'),
	   ('002','4',N'Thiết kế hệ thống','12/21/2009','03/22/2010'),
	   ('002','5',N'Cài đặt thử nghiệm','03/23/2010','05/10/2010'),
	   ('006','1',N'Lấy mẫu','10/20/2006','02/20/2007'),
	   ('006','2',N'Nuôi cấy','02/21/2007','08/21/2008')
GO
------ THAMGIADT
INSERT INTO THAMGIADT
VALUES	('001','002','1','0',NULL),
		('001','002','2','2',NULL),
		('002','001','4','2',N'Đạt'),
		('003','001','1','1',N'Đạt'),
		('003','001','2','0',N'Đạt'),
		('003','001','4','1',N'Đạt'),
		('003','002','2','0',NULL),
		('004','006','1','0',N'Đạt'),
		('004','006','2','1',N'Đạt'),
		('006','006','2','1.5',N'Đạt'),
		('009','002','3','0.5',NULL),
		('009','002','4','1.5',NULL)
GO
-- ==========================
-- ==========================================
-- TRUY VẤN =======================================

-- Q1
SELECT HOTEN,LUONG
FROM GIAOVIEN
WHERE PHAI=N'Nữ'

--Q2
SELECT HOTEN,LUONG*1.1 AS [LUONG10%]
FROM GIAOVIEN

--Q3
SELECT DISTINCT MAGV, HOTEN
FROM GIAOVIEN,BOMON
WHERE (HOTEN LIKE N'Nguyễn%' AND LUONG>2000) OR (MAGV=TRUONGBM AND YEAR(NGAYNHANCHUC)>1995)

-- Q4
SELECT GV.HOTEN
FROM GIAOVIEN GV,BOMON BM,KHOA K
WHERE GV.MABM=BM.MABM AND BM.MAKHOA=K.MAKHOA AND K.TENKHOA=N'Công nghệ thông tin'

-- Q5
SELECT *FROM BOMON,GIAOVIEN
WHERE MAGV=TRUONGBM

-- Q6
SELECT *FROM GIAOVIEN GV,BOMON BM
WHERE GV.MABM=BM.MABM

-- Q7
SELECT TENDT,GVCNDT
FROM DETAI

-- Q8
SELECT *FROM KHOA,GIAOVIEN
WHERE TRUONGKHOA=MAGV

-- Q9
SELECT DISTINCT GV.MAGV,GV.HOTEN
FROM GIAOVIEN GV, BOMON BM, THAMGIADT TGDT
WHERE GV.MABM=BM.MABM AND BM.TENBM=N'Vi sinh' AND TGDT.MADT='006'

-- Q10 (không có đáp án)
SELECT DT.MADT,CD.TENCD,GV.HOTEN,GV.NGAYSINH,GV.DIACHI
FROM DETAI DT, CHUDE CD, GIAOVIEN GV
WHERE DT.CAPQL=N'Thành phố' AND DT.MACD=CD.MACD AND DT.GVCNDT=GV.MAGV

-- Q11 
SELECT GV.HOTEN,GVQL.HOTEN
FROM GIAOVIEN GV LEFT OUTER JOIN GIAOVIEN GVQL ON GV.GVQLCM=GVQL.MAGV

SELECT G1.MAGV, G1.HOTEN, G1.GVQLCM, G2.HOTEN
FROM GIAOVIEN G1 LEFT OUTER JOIN GIAOVIEN G2 ON G1.GVQLCM=G2.MAGV

SELECT G1.HOTEN,G2.HOTEN
FROM GIAOVIEN G1, GIAOVIEN G2
WHERE G2.GVQLCM=G1.MAGV
 
-- Q12 (không có đáp án) 
SELECT GV.HOTEN
FROM GIAOVIEN GV,GIAOVIEN GVNAT
WHERE GV.GVQLCM=GVNAT.MAGV AND GVNAT.HOTEN=N'Nguyễn Thanh Tùng'

-- Q13
SELECT GV.HOTEN
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MAGV=BM.TRUONGBM AND BM.TENBM=N'Hệ thống thông tin'

-- Q14
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV,DETAI DT, CHUDE CD
WHERE DT.GVCNDT=GV.MAGV AND DT.MACD=CD.MACD AND CD.TENCD=N'Quản lý giáo dục'

-- Q15
SELECT CV.TENCV
FROM CONGVIEC CV, DETAI DT
WHERE CV.MADT=DT.MADT AND DT.TENDT=N'HTTT quản lý các trường ĐH' AND (CV.NGAYBD BETWEEN '3/1/2008' AND '3/31/2008')

-- Q16
SELECT GV.HOTEN,GVQL.HOTEN
FROM GIAOVIEN GV LEFT OUTER JOIN GIAOVIEN GVQL ON GV.GVQLCM=GVQL.MAGV

-- Q17
SELECT *FROM CONGVIEC 
WHERE NGAYBD BETWEEN '01/01/2007' AND '08/01/2007'

-- Q18 
SELECT GV.HOTEN
FROM GIAOVIEN GV, GIAOVIEN TTH
WHERE GV.MABM=TTH.MABM AND TTH.HOTEN=N'Trần Trà Hương' AND GV.MAGV!=TTH.MAGV

-- Q19
SELECT DISTINCT GV.MAGV,GV.HOTEN
FROM GIAOVIEN GV, BOMON BM, DETAI DT
WHERE GV.MAGV=BM.TRUONGBM AND GV.MAGV=DT.GVCNDT

-- Q20
SELECT GV.HOTEN
FROM GIAOVIEN GV, BOMON BM, KHOA K
WHERE GV.MAGV=BM.TRUONGBM AND GV.MAGV=K.TRUONGKHOA

-- Q21
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV, BOMON BM, DETAI DT
WHERE GV.MAGV=BM.TRUONGBM AND GV.MAGV=DT.GVCNDT

-- Q22
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV, KHOA K, DETAI DT
WHERE GV.MAGV=K.TRUONGKHOA AND GV.MAGV=DT.GVCNDT

-- Q23
SELECT DISTINCT GV.MAGV
FROM GIAOVIEN GV,THAMGIADT TGDT
WHERE GV.MABM='HTTT' OR (TGDT.MAGV=GV.MAGV AND TGDT.MADT='001') 

-- Q24
SELECT GV.HOTEN
FROM GIAOVIEN GV,GIAOVIEN KH
WHERE KH.MAGV='002' AND GV.MABM=KH.MABM AND GV.MAGV!=KH.MAGV

-- Q25
SELECT GV.MAGV,GV.HOTEN
FROM GIAOVIEN GV,BOMON BM
WHERE GV.MAGV=BM.TRUONGBM

-- Q26
SELECT HOTEN,LUONG
FROM GIAOVIEN

--//===========================================
-- Q27
SELECT COUNT(*) AS SOLUONGGV,SUM(LUONG) AS TONGLUONG 
FROM GIAOVIEN

-- Q28 
SELECT MABM,COUNT(MAGV) AS SOLUONGGV,AVG(LUONG) AS LUONGTB
FROM GIAOVIEN
GROUP BY MABM

-- Q29
SELECT CD.TENCD,COUNT(DT.MADT) AS SOLUONGDT
FROM CHUDE CD,DETAI DT
WHERE CD.MACD=DT.MACD
GROUP BY DT.MACD,CD.TENCD

-- Q30
SELECT GV.HOTEN,COUNT(TGDT.MAGV) AS SOLUONGDT
FROM GIAOVIEN GV,THAMGIADT TGDT
WHERE GV.MAGV=TGDT.MAGV
GROUP BY TGDT.MAGV,GV.HOTEN

-- Q31
SELECT GV.HOTEN,COUNT(DT.GVCNDT) AS SLDTCN
FROM GIAOVIEN GV,DETAI DT
WHERE GV.MAGV=DT.GVCNDT
GROUP BY GV.MAGV,GV.HOTEN

-- Q32
SELECT GV.HOTEN,COUNT(NT.MAGV) AS SOLUONGNT
FROM GIAOVIEN GV,NGUOITHAN NT
WHERE GV.MAGV=NT.MAGV
GROUP BY NT.MAGV

-- Q33
SELECT GV.HOTEN,COUNT(TGDT.MAGV) AS SOLUONGDT
FROM GIAOVIEN GV,THAMGIADT TGDT
WHERE GV.MAGV=TGDT.MAGV
GROUP BY TGDT.MAGV,GV.HOTEN
HAVING COUNT(TGDT.MAGV)>=3

-- Q34 (không có đáp án)
SELECT COUNT(TGDT.MADT) AS SLGIAOVIEN
FROM THAMGIADT TGDT,DETAI DT
WHERE TGDT.MADT=DT.MADT AND DT.TENDT=N'Ứng dụng hoá học xanh'
GROUP BY TGDT.MADT

-- Q35 
SELECT MAX(LUONG) AS LUONGCAONHAT
FROM GIAOVIEN

-- Q36
SELECT *FROM GIAOVIEN
WHERE LUONG = (SELECT MAX(LUONG) FROM GIAOVIEN)

-- Q37
SELECT MAX(LUONG)
FROM GIAOVIEN
WHERE MABM='HTTT'

SELECT DISTINCT LUONG
FROM GIAOVIEN
WHERE LUONG >= ALL(SELECT LUONG FROM GIAOVIEN WHERE MABM='HTTT')

-- Q38
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
WHERE BM.TENBM=N'Hệ thống thông tin' 
	  AND GV.NGAYSINH <= ALL (SELECT NGAYSINH FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
							  WHERE BM.TENBM=N'Hệ thống thông tin') 

SELECT GV.HOTEN
FROM GIAOVIEN GV, BOMON BM
WHERE GV.MABM=BM.MABM and BM.TENBM=N'Hệ thống thông tin' 
	  AND Year(GV.NGAYSINH) = (SELECT min(year(NGAYSINH)) 
								FROM GIAOVIEN G, BOMON B 
							    WHERE G.MABM=B.MABM and B.TENBM=N'Hệ thống thông tin') 

-- Q39
SELECT GV.HOTEN
FROM (GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM) JOIN KHOA K ON BM.MAKHOA=K.MAKHOA
WHERE K.TENKHOA=N'Công nghệ thông tin'
	  AND GV.NGAYSINH >= ALL
	  (SELECT GV.NGAYSINH FROM (GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM) JOIN KHOA K ON BM.MAKHOA=K.MAKHOA
       WHERE K.TENKHOA=N'Công nghệ thông tin')

-- Q40
SELECT GV.HOTEN,K.TENKHOA
FROM (GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM) JOIN KHOA K ON BM.MAKHOA=K.MAKHOA
WHERE LUONG = (SELECT MAX(LUONG) FROM GIAOVIEN)

SELECT G.HOTEN,K.TENKHOA
FROM GIAOVIEN G, BOMON B, KHOA K
WHERE G.MABM=B.MABM AND B.MAKHOA=K.MAKHOA AND LUONG = (SELECT MAX(G1.LUONG) FROM GIAOVIEN G1)

-- Q41 
SELECT GV.MAGV,GV.HOTEN,BM.MABM,LUONG
FROM BOMON BM JOIN GIAOVIEN GV ON BM.MABM=GV.MABM
WHERE LUONG >= ALL (SELECT LUONG FROM GIAOVIEN
					WHERE MABM=BM.MABM)
ORDER BY BM.MABM

SELECT G.MAGV,G.HOTEN,B.MABM,LUONG
FROM GIAOVIEN g, BOMON b, (select mabm, max(luong) as L
						from GIAOVIEN
						group by mabm) as T
WHERE G.MABM= b.MABM and g.MABM = T.MABM and g.LUONG = T.L


-- Q42
SELECT TENDT
FROM DETAI
WHERE MADT NOT IN (SELECT DISTINCT DT.MADT
				   FROM (DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT)
				   JOIN GIAOVIEN GV ON TGDT.MAGV=GV.MAGV
				   WHERE GV.HOTEN=N'Nguyễn Hoài Ân')

-- Q43
SELECT DT.TENDT,DT.GVCNDT,GV.HOTEN
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT=GV.MAGV
WHERE DT.MADT NOT IN (SELECT DISTINCT DT.MADT
				   FROM (DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT)
				   JOIN GIAOVIEN GV ON TGDT.MAGV=GV.MAGV
				   WHERE GV.HOTEN=N'Nguyễn Hoài Ân')

-- Q44 (không có đáp án)
SELECT GV.MAGV,GV.HOTEN
FROM (GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM)
	  JOIN KHOA K ON BM.MAKHOA=K.MAKHOA  
WHERE GV.MAGV NOT IN (SELECT MAGV FROM THAMGIADT) AND K.TENKHOA=N'Công nghệ thông tin' 

-- Q45
SELECT MAGV,HOTEN
FROM GIAOVIEN  
WHERE MAGV NOT IN (SELECT MAGV FROM THAMGIADT)

-- Q46
SELECT *FROM GIAOVIEN
WHERE LUONG > (SELECT LUONG FROM GIAOVIEN WHERE HOTEN=N'Nguyễn Hoài Ân')

-- Q47
SELECT TGDT.MAGV,GV.HOTEN
FROM (THAMGIADT TGDT JOIN GIAOVIEN GV ON TGDT.MAGV=GV.MAGV)
	  JOIN BOMON BM ON GV.MAGV=BM.TRUONGBM
GROUP BY TGDT.MAGV,GV.HOTEN
HAVING COUNT(*)>=1

SELECT  T.MAGV, G.HOTEN
FROM GIAOVIEN G, THAMGIADT T, BOMON B
WHERE G.MAGV = B.TRUONGBM 
      AND G.MAGV = T.MAGV
GROUP BY T.MAGV,G.HOTEN
HAVING COUNT(*)>= 1

-- Q48 (không có đáp án) 
SELECT *FROM GIAOVIEN GV1 
WHERE EXISTS(SELECT GV2.MAGV FROM GIAOVIEN GV2
			 WHERE GV2.HOTEN=GV1.HOTEN AND GV2.PHAI=GV1.PHAI AND GV2.MAGV!=GV1.MAGV
			 GROUP BY GV2.MABM,GV2.MAGV)

-- Q49 (không có đáp án)
SELECT GV.*
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
WHERE BM.TENBM!=N'Công nghệ phần mềm' AND
	  LUONG>ANY(SELECT GV.LUONG FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
				WHERE BM.TENBM=N'Công nghệ phần mềm') 

-- Q50
SELECT GV.*
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
WHERE BM.TENBM!=N'Hệ thống thông tin' AND
	  LUONG>=ALL(SELECT GV.LUONG FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
				 WHERE BM.TENBM=N'Hệ thống thông tin')

SELECT GV.*
FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
WHERE LUONG>ALL(SELECT GV.LUONG FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
				 WHERE BM.TENBM=N'Hệ thống thông tin')

-- Q51
SELECT K.TENKHOA,COUNT(*) AS SOLUONG
FROM (KHOA K JOIN BOMON BM ON K.MAKHOA=BM.MAKHOA)
	  JOIN GIAOVIEN GV ON BM.MABM=GV.MABM
GROUP BY K.TENKHOA
HAVING COUNT(*)>=ALL(SELECT COUNT(*) AS SOLUONG
					 FROM (KHOA K JOIN BOMON BM ON K.MAKHOA=BM.MAKHOA)
					 JOIN GIAOVIEN GV ON BM.MABM=GV.MABM
					 GROUP BY K.TENKHOA)

SELECT K.TENKHOA,COUNT(*) AS SOLUONG
FROM (KHOA K JOIN BOMON BM ON K.MAKHOA=BM.MAKHOA)
	  JOIN GIAOVIEN GV ON BM.MABM=GV.MABM
GROUP BY K.TENKHOA
HAVING COUNT(*)>= all (
		select count(magv) as dem
		from giaovien g, bomon b, khoa k
		where g.mabm=b.mabm
		group by k.makhoa)

select max(dem)
from (select k.MAKHOA, k.tenkhoa as tk, count(magv) as dem
		from giaovien g, bomon b, khoa k
		where g.mabm=b.mabm and b.makhoa=k.makhoa
		group by k.makhoa, k.tenkhoa) as t

SELECT K.TENKHOA,COUNT(*) AS SOLUONG
FROM KHOA K, GIAOVIEN g, BOMON B
where k.MAKHOA=b.MABM and b.MABM=g.MABM
GROUP BY K.TENKHOA
HAVING COUNT(*) >= all (
		select count(magv) as dem
		from giaovien g, bomon b, khoa k
		where g.mabm=b.mabm
		group by k.makhoa)

-- Q52

SELECT GV.MAGV,GV.HOTEN,COUNT(*) AS SOLUONG
FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT=GV.MAGV
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(*)>=ALL(SELECT COUNT(*) AS SOLUONG
					 FROM DETAI DT JOIN GIAOVIEN GV ON DT.GVCNDT=GV.MAGV
					 GROUP BY GV.MAGV,GV.HOTEN)

-- Q53
SELECT MABM,COUNT(*) AS SOGV
FROM GIAOVIEN
GROUP BY MABM
HAVING COUNT(*)>=ALL(SELECT COUNT(*)
					 FROM GIAOVIEN
					 GROUP BY MABM)

-- Q54
SELECT GV.MAGV,GV.HOTEN,COUNT(*) AS SOLUONG,BM.TENBM
FROM (GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN BOMON BM ON GV.MABM=BM.MABM
GROUP BY GV.MAGV,GV.HOTEN,BM.TENBM
HAVING COUNT(*)>=ALL(SELECT COUNT(*) 
					 FROM (GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
					 JOIN BOMON BM ON GV.MABM=BM.MABM
					 GROUP BY GV.MAGV,GV.HOTEN,BM.TENBM)

-- Q55
SELECT GV.MAGV,GV.HOTEN,COUNT(*) AS SOLUONG
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE GV.MABM='HTTT'
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(*)>=ALL(SELECT COUNT(*)
					 FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
					 WHERE GV.MABM='HTTT'
					 GROUP BY GV.MAGV,GV.HOTEN)

-- Q56
SELECT GV.MAGV,GV.HOTEN,COUNT(*) AS SOLUONG,BM.TENBM
FROM (GIAOVIEN GV JOIN NGUOITHAN NT ON GV.MAGV=NT.MAGV)
	  JOIN BOMON BM ON GV.MABM=BM.MABM
GROUP BY GV.MAGV,GV.HOTEN,BM.TENBM
HAVING COUNT(*)>=ALL(SELECT COUNT(*)
					 FROM (GIAOVIEN GV JOIN NGUOITHAN NT ON GV.MAGV=NT.MAGV)
					 JOIN BOMON BM ON GV.MABM=BM.MABM
					 GROUP BY GV.MAGV,GV.HOTEN,BM.TENBM)

-- Q57
SELECT GV.MAGV,GV.HOTEN,COUNT(*) AS SOLUONG
FROM (GIAOVIEN GV JOIN DETAI DT ON GV.MAGV=DT.GVCNDT)
	  JOIN BOMON BM ON GV.MAGV=BM.TRUONGBM
GROUP BY GV.MAGV,GV.HOTEN
HAVING COUNT(*)>=ALL(SELECT COUNT(*) 
					 FROM (GIAOVIEN GV JOIN DETAI DT ON GV.MAGV=DT.GVCNDT)
					 JOIN BOMON BM ON GV.MAGV=BM.TRUONGBM
					 GROUP BY GV.MAGV,GV.HOTEN)

--//============================
-- Q58 
SELECT GV.HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS (SELECT *FROM CHUDE CD
				  WHERE NOT EXISTS (SELECT *FROM THAMGIADT TGDT2 JOIN DETAI DT ON TGDT2.MADT=DT.MADT
									WHERE TGDT2.MAGV=GV.MAGV AND DT.MACD=CD.MACD))

-- Q59
SELECT DISTINCT DT.MADT,DT.TENDT
FROM THAMGIADT TGDT JOIN DETAI DT ON TGDT.MADT=DT.MADT
WHERE NOT EXISTS (SELECT * FROM GIAOVIEN GV WHERE GV.MABM='HTTT' AND
				  NOT EXISTS (SELECT * FROM THAMGIADT TGDT2
							  WHERE TGDT2.MAGV=GV.MAGV AND TGDT2.MADT=TGDT.MADT))


--  CHo biết tên đề tài mà không giáo viên nào của môn HTTT là không tham gia
	
SELECT	DT.TENDT
FROM	DETAI DT
WHERE	NOT EXISTS	(SELECT GV.*
					FROM GIAOVIEN GV
					WHERE GV.MABM='HTTT' AND
					NOT EXISTS (SELECT TG.*
								FROM THAMGIADT TG
								WHERE TG.MAGV=GV.MAGV AND TG.MADT = DT.MADT))	
							  
-- Q60 
SELECT DISTINCT DT.TENDT
FROM DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT
WHERE NOT EXISTS (SELECT GV.*
				  FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
				  WHERE BM.TENBM=N'Hệ thống thông tin' AND
				  NOT EXISTS (SELECT *FROM THAMGIADT TGDT2
							  WHERE TGDT2.MAGV=GV.MAGV AND TGDT2.MADT=TGDT.MADT))

SELECT DT.TENDT
FROM DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT 
WHERE TGDT.MAGV IN (SELECT GV.MAGV FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM WHERE BM.TENBM=N'Hệ thống thông tin')
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT TGDT.MAGV)=(SELECT COUNT(GV.MAGV) FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM WHERE BM.TENBM=N'Hệ thống thông tin') 

-- Q61 
SELECT GV.MAGV,GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE NOT EXISTS (SELECT *FROM DETAI DT WHERE DT.MACD='QLGD' AND
				  NOT EXISTS (SELECT *FROM THAMGIADT TGDT2
							  WHERE TGDT2.MADT=DT.MADT AND TGDT2.MAGV=GV.MAGV))

SELECT TGDT.MAGV
FROM THAMGIADT TGDT 
WHERE TGDT.MADT IN (SELECT MADT FROM DETAI WHERE MACD='QLGD')
GROUP BY TGDT.MAGV
HAVING COUNT(DISTINCT TGDT.MADT)=(SELECT COUNT(MADT) FROM DETAI WHERE MACD='QLGD')

-- Q62 
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE GV.HOTEN!=N'Trần Trà Hương' AND  
	  NOT EXISTS (SELECT *FROM GIAOVIEN GV2
				  WHERE GV2.HOTEN=N'Trần Trà Hương' AND
				  NOT EXISTS (SELECT *FROM THAMGIADT TGDT2
							  WHERE TGDT2.MAGV=GV2.MAGV AND TGDT2.MADT=TGDT.MADT))

-- Q63 
SELECT DT.TENDT
FROM DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT
WHERE TGDT.MAGV IN (SELECT GV.MAGV FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM WHERE BM.TENBM=N'Hóa hữu cơ')
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT TGDT.MAGV)=(SELECT COUNT(GV.MAGV) FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM WHERE BM.TENBM=N'Hóa hữu cơ') 

-- Q64 
SELECT GV.HOTEN
FROM (GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN CONGVIEC CV ON (TGDT.MADT=CV.MADT AND TGDT.STT=CV.SOTT)
WHERE TGDT.MADT='006' 
GROUP BY GV.HOTEN
HAVING COUNT(TGDT.MADT)=(SELECT COUNT(MADT) FROM CONGVIEC WHERE MADT='006')


-- Q65 
SELECT GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE NOT EXISTS (SELECT DT.*
				  FROM DETAI DT JOIN CHUDE CD ON DT.MACD=CD.MACD
				  WHERE CD.TENCD=N'Ứng dụng công nghệ' AND 
				  NOT EXISTS (SELECT *FROM THAMGIADT TGDT2
							  WHERE TGDT2.MADT=DT.MADT AND TGDT2.MAGV=GV.MAGV))

SELECT GV.HOTEN
FROM ((GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN DETAI DT ON TGDT.MADT=DT.MADT)
	  JOIN CHUDE CD ON DT.MACD=CD.MACD
WHERE CD.TENCD=N'Ứng dụng công nghệ'
GROUP BY GV.HOTEN
HAVING COUNT(DISTINCT TGDT.MADT)=(SELECT COUNT(DT2.MADT) 
								  FROM DETAI DT2 JOIN CHUDE CD2 ON DT2.MADT=CD2.MACD
								  WHERE CD2.TENCD=N'Ứng dụng công nghệ')

-- Q66 
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE NOT EXISTS(SELECT DT.*
				 FROM DETAI DT JOIN GIAOVIEN GV2 ON DT.GVCNDT=GV2.MAGV
				 WHERE GV2.HOTEN=N'Trần Trà Hương' AND 
				 NOT EXISTS(SELECT *FROM THAMGIADT TGDT2
							WHERE TGDT2.MADT=DT.MADT AND TGDT2.MAGV=TGDT.MAGV))

SELECT GV.HOTEN,COUNT(DISTINCT TGDT.MADT)
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE GV.HOTEN!=N'Trần Trà Hương' AND TGDT.MADT IN (SELECT DT2.MADT FROM DETAI DT2 JOIN GIAOVIEN GV2 ON DT2.GVCNDT=GV2.MAGV
				    WHERE GV2.HOTEN=N'Trần Trà Hương')
GROUP BY GV.HOTEN		 
HAVING COUNT(DISTINCT TGDT.MADT)=(SELECT COUNT(DT3.MADT) FROM DETAI DT3 JOIN GIAOVIEN GV3 ON DT3.GVCNDT=GV3.MAGV
								  WHERE GV3.HOTEN=N'Trần Trà Hương')	

-- Q67 
SELECT DT.TENDT
FROM DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT
WHERE NOT EXISTS(SELECT GV.*
				 FROM GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM
				 WHERE BM.MAKHOA='CNTT' AND
				 NOT EXISTS(SELECT *FROM THAMGIADT TGDT2
							WHERE TGDT2.MAGV=GV.MAGV AND TGDT2.MADT=TGDT.MADT))

SELECT DT.TENDT
FROM ((DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT)
	  JOIN GIAOVIEN GV ON TGDT.MAGV=GV.MAGV)
	  JOIN BOMON BM ON GV.MABM=BM.MABM
WHERE BM.MAKHOA='CNTT'
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT TGDT.MAGV)=(SELECT COUNT(GV2.MAGV) 
								  FROM GIAOVIEN GV2 JOIN BOMON BM2 ON GV2.MABM=BM2.MABM
								  WHERE BM2.MAKHOA='CNTT')

-- Q68 
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE NOT EXISTS(SELECT CV.*
				 FROM CONGVIEC CV JOIN DETAI DT ON CV.MADT=DT.MADT
				 WHERE DT.TENDT=N'Nghiên cứu tế bào gốc' AND
				 NOT EXISTS(SELECT *FROM THAMGIADT TGDT2
							WHERE TGDT2.MADT=CV.MADT AND TGDT2.STT=CV.SOTT AND TGDT2.MAGV=GV.MAGV))

SELECT GV.HOTEN
FROM ((GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN CONGVIEC CV ON (TGDT.MADT=CV.MADT AND TGDT.STT=CV.SOTT))
	  JOIN DETAI DT ON CV.MADT=DT.MADT
WHERE DT.TENDT=N'Nghiên cứu tế bào gốc'
GROUP BY GV.HOTEN
HAVING COUNT(TGDT.MADT)=(SELECT COUNT(CV2.MADT) FROM CONGVIEC CV2 JOIN DETAI DT2 ON CV2.MADT=DT2.MADT
						 WHERE DT2.TENDT=N'Nghiên cứu tế bào gốc')

-- Q69 
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV 
WHERE NOT EXISTS(SELECT *FROM DETAI DT WHERE DT.KINHPHI>100 AND
				 NOT EXISTS(SELECT *FROM THAMGIADT TGDT2
							WHERE TGDT2.MADT=DT.MADT AND TGDT2.MAGV=TGDT.MAGV))

SELECT GV.HOTEN
FROM (GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN DETAI DT ON TGDT.MADT=DT.MADT
WHERE DT.KINHPHI>100
GROUP BY GV.HOTEN
HAVING COUNT(DISTINCT TGDT.MADT)=(SELECT COUNT(MADT) FROM DETAI WHERE KINHPHI>100)

-- Q70
SELECT DISTINCT DT.TENDT
FROM DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT
WHERE NOT EXISTS(SELECT GV.*
				 FROM (GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM) JOIN KHOA K ON BM.MAKHOA=K.MAKHOA
				 WHERE K.TENKHOA=N'Sinh học' AND 
				 NOT EXISTS (SELECT *FROM THAMGIADT TGDT2
							 WHERE TGDT2.MAGV=GV.MAGV AND TGDT2.MADT=TGDT.MADT))

SELECT DT.TENDT
FROM (((DETAI DT JOIN THAMGIADT TGDT ON DT.MADT=TGDT.MADT)
	  JOIN GIAOVIEN GV ON TGDT.MAGV=GV.MAGV)
	  JOIN BOMON BM ON GV.MABM=BM.MABM)
	  JOIN KHOA K ON BM.MAKHOA=K.MAKHOA
WHERE K.TENKHOA=N'Sinh học'
GROUP BY DT.TENDT
HAVING COUNT(DISTINCT TGDT.MAGV)=(SELECT COUNT(GV2.MAGV) 
								  FROM (GIAOVIEN GV2 JOIN BOMON BM2 ON GV2.MABM=BM2.MABM)
										JOIN KHOA K2 ON BM2.MAKHOA=K2.MAKHOA
								  WHERE K2.TENKHOA=N'Sinh học')
	  
-- Q71 
SELECT GV.MAGV,GV.HOTEN,GV.NGAYSINH
FROM (GIAOVIEN GV JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN CONGVIEC CV ON (TGDT.MADT=CV.MADT AND TGDT.STT=CV.SOTT)
	  JOIN DETAI DT ON CV.MADT=DT.MADT
WHERE DT.TENDT=N'Ứng dụng hoá học xanh'
GROUP BY GV.MAGV,GV.HOTEN,GV.NGAYSINH
HAVING COUNT(CV.MADT)=(SELECT COUNT(CV2.MADT)
					   FROM CONGVIEC CV2 JOIN DETAI DT2 ON CV2.MADT=DT2.MADT
					   WHERE DT2.TENDT=N'Ứng dụng hoá học xanh')

-- Q72 
SELECT GV.MAGV,GV.HOTEN,BM.TENBM,GV2.HOTEN
FROM ((GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM)
	  LEFT OUTER JOIN GIAOVIEN GV2 ON GV.GVQLCM=GV2.MAGV)
	  JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE NOT EXISTS(SELECT *FROM DETAI DT JOIN CHUDE CD ON DT.MACD=CD.MACD
				 WHERE CD.TENCD=N'Nghiên cứu phát triển' AND
				 NOT EXISTS(SELECT *FROM THAMGIADT TGDT2
							WHERE TGDT2.MADT=DT.MADT AND TGDT2.MAGV=TGDT.MAGV))

SELECT GV.MAGV,GV.HOTEN,BM.TENBM,GV2.HOTEN,COUNT(DISTINCT TGDT.MADT)
FROM ((((GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM)
	  LEFT OUTER JOIN GIAOVIEN GV2 ON GV.GVQLCM=GV2.MAGV)
	  JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV)
	  JOIN DETAI DT ON TGDT.MADT=DT.MADT)
	  JOIN CHUDE CD ON DT.MACD=CD.MACD
WHERE CD.TENCD=N'Nghiên cứu phát triển'
GROUP BY GV.MAGV,GV.HOTEN,BM.TENBM,GV2.HOTEN
HAVING COUNT(DISTINCT TGDT.MADT)=(SELECT COUNT(DT2.MADT)
								  FROM DETAI DT2 JOIN CHUDE CD2 ON DT2.MACD=CD2.MACD
								  WHERE CD2.TENCD=N'Nghiên cứu phát triển')

-- Q73 
SELECT GV.HOTEN,GV.NGAYSINH,K.TENKHOA,GV2.HOTEN
FROM (((GIAOVIEN GV JOIN BOMON BM ON GV.MABM=BM.MABM)
	  JOIN KHOA K ON BM.MAKHOA=K.MAKHOA)
	  JOIN GIAOVIEN GV2 ON K.TRUONGKHOA=GV2.MAGV)
	  JOIN THAMGIADT TGDT ON GV.MAGV=TGDT.MAGV
WHERE TGDT.MADT IN (SELECT TGDT2.MADT FROM THAMGIADT TGDT2 JOIN GIAOVIEN GV3 ON TGDT2.MAGV=GV3.MAGV
					WHERE GV3.HOTEN=N'Nguyễn Hoài Ân') AND GV.HOTEN!=N'Nguyễn Hoài Ân'
GROUP BY GV.HOTEN,GV.NGAYSINH,K.TENKHOA,GV2.HOTEN
HAVING COUNT(DISTINCT TGDT.MADT)=(SELECT COUNT(DISTINCT TGDT3.MADT) 
								  FROM THAMGIADT TGDT3 JOIN GIAOVIEN GV4 ON TGDT3.MAGV=GV4.MAGV
								  WHERE GV4.HOTEN=N'Nguyễn Hoài Ân')

-- Q75
SELECT GV.HOTEN,BM.TENBM
FROM GIAOVIEN GV JOIN BOMON BM ON BM.TRUONGBM=GV.MAGV

-- Q76
SELECT BM.TENBM,GV.HOTEN
FROM BOMON BM JOIN  GIAOVIEN GV ON BM.TRUONGBM=GV.MAGV

-- Q77
SELECT GV.HOTEN,DT.TENDT
FROM GIAOVIEN GV JOIN DETAI DT ON GV.MAGV=DT.GVCNDT

-- Q78
SELECT MADT,TENDT
FROM DETAI 
WHERE MACD!='NCPT'

-- Q79
SELECT MAGV,HOTEN,LUONG,CASE
							WHEN LUONG<1800 THEN 'THAP'
							WHEN LUONG BETWEEN 1800 AND 2000 THEN 'TRUNGBINH'
							ELSE 'CAO'
					END AS QUYTAC
FROM GIAOVIEN

-- Q80
SELECT MAGV,HOTEN,RANK() OVER(ORDER BY LUONG DESC)
FROM GIAOVIEN

-- Q81
SELECT HOTEN,LUONG + CASE
			WHEN (MAGV IN (SELECT TRUONGBM FROM BOMON) AND MAGV IN (SELECT TRUONGKHOA FROM KHOA)) THEN 900
			WHEN (MAGV IN (SELECT TRUONGBM FROM BOMON))	 THEN 300
			WHEN (MAGV IN (SELECT TRUONGKHOA FROM KHOA)) THEN 600
			ELSE 0
			END AS THUNHAP	  
FROM GIAOVIEN 

SELECT GV.HOTEN,GV.LUONG + IIF(GV.MAGV IN (SELECT TRUONGBM FROM BOMON), 300, 0) AS THUNHAP	  
FROM GIAOVIEN AS GV


IF DATENAME(weekday, GETDATE()) IN (SELECT TRUONGBM FROM BOMON)
       SELECT 'Weekend';
ELSE 
       SELECT 'Weekday';

-- Q82
SELECT HOTEN,CASE
				WHEN PHAI=N'Nữ'	THEN YEAR(NGAYSINH)+55
				ELSE YEAR(NGAYSINH)+60
			END AS DUKIEN
FROM GIAOVIEN


--======================================
SELECT *FROM GIAOVIEN
SELECT *FROM KHOA
SELECT *FROM BOMON
SELECT *FROM GV_DT
SELECT *FROM NGUOITHAN
SELECT *FROM CHUDE
SELECT *FROM DETAI
SELECT *FROM CONGVIEC
SELECT *FROM THAMGIADT





