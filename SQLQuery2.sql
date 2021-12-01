CREATE DATABASE asm2;
GO

USE asm2;
GO

ALTER TABLE hocvien(
    id_hocvien INT UNIQUE,
    hoten VARCHAR(50),
    gioitinh VARCHAR(10),
    ngaysinh DATE,
    diachi VARCHAR(50),
    PRIMARY KEY (id_hocvien)
);
GO


CREATE TABLE nguoithan(
	id_hocvien INT UNIQUE,
    hoten VARCHAR(50) UNIQUE,
    gioitinh VARCHAR(10),
    ngaysinh DATE,
    diachi VARCHAR(50),
    FOREIGN KEY (id_hocvien) REFERENCES hocvien(id_hocvien),
    PRIMARY KEY (hoten,id_hocvien)
);
GO

CREATE TABLE dienthoai_nguoithan(
	id_hocvien INT UNIQUE,
    hoten VARCHAR(50) ,
    sdt VARCHAR(11),
    PRIMARY KEY (id_hocvien),
    FOREIGN KEY (id_hocvien) REFERENCES nguoithan(id_hocvien),
    FOREIGN KEY (hoten) REFERENCES nguoithan(hoten)
);
GO

CREATE TABLE dienthoai_hocvien(
	id_hocvien INT UNIQUE,
    sdt VARCHAR(11),
    PRIMARY KEY (id_hocvien),	
    FOREIGN KEY (id_hocvien) REFERENCES hocvien(id_hocvien)
);
GO

CREATE TABLE hocvien_chuyende(
	id_hocvien INT PRIMARY KEY,
    FOREIGN KEY (id_hocvien) REFERENCES hocvien(id_hocvien)
);
GO

CREATE TABLE hocvien_hocphan(
	id_hocvien INT PRIMARY KEY,
    FOREIGN KEY (id_hocvien) REFERENCES hocvien(id_hocvien)
);
GO

CREATE TABLE nhomhocphan(
	id_nhomhocphan VARCHAR(50),
    ten VARCHAR(50),
    mota VARCHAR(50),
    tenchungchi VARCHAR(50),
    PRIMARY KEY (id_nhomhocphan)
);
GO

CREATE TABLE nhanvien_thuhocphi(
	id_nhanvien VARCHAR(50),
    ten VARCHAR(50),
    PRIMARY KEY (id_nhanvien)
);
GO

CREATE TABLE thongtin_nhanvien(
	id_nhanvien VARCHAR(50) UNIQUE,
    email VARCHAR(50),
    sdt VARCHAR(11),
    PRIMARY KEY (id_nhanvien,sdt),
    FOREIGN KEY (id_nhanvien) REFERENCES nhanvien_thuhocphi(id_nhanvien)
);
GO

CREATE TABLE hoadon(
	id_hoadon VARCHAR(50),
    thoigianxuat VARCHAR(50),
    tongtien VARCHAR(50),
    id_nhanvien VARCHAR(50),
    id_hocvien INT ,
    PRIMARY KEY (id_hoadon),
    FOREIGN KEY (id_nhanvien) REFERENCES thongtin_nhanvien(id_nhanvien),
    FOREIGN KEY (id_hocvien) REFERENCES hocvien_hocphan(id_hocvien)
);
GO

CREATE TABLE monhoc(
	id_monhoc VARCHAR(50),
    ten VARCHAR(50),
    hesodiemkiemtra FLOAT,
    hesodiemthi FLOAT,
    mota VARCHAR(50),
    hocphi VARCHAR(50),
    id_hoadon VARCHAR(50),
    PRIMARY KEY (id_monhoc),
    FOREIGN KEY (id_hoadon) REFERENCES hoadon(id_hoadon)
);
GO

CREATE TABLE lichthi_hocphan(
	id_lichthi VARCHAR(50),
    phongthi VARCHAR(50),
    ngaythi DATE,
    thoigian VARCHAR(10),
    PRIMARY KEY (id_lichthi)
);
GO

CREATE TABLE lophocphan(
	id_lop VARCHAR(50),
    ten VARCHAR(50),
    hocki VARCHAR(10),
    sinhvientoida INT,
    sinhviendangki INT,
    id_monhoc VARCHAR(50),
    id_lichthi VARCHAR(50),
    PRIMARY KEY (id_lop),
    FOREIGN KEY (id_monhoc) REFERENCES monhoc(id_monhoc),
    FOREIGN KEY (id_lichthi) REFERENCES lichthi_hocphan(id_lichthi)
);
GO

CREATE TABLE giangvien(
	id_giangvien VARCHAR(50),
    hoten VARCHAR(50),
    diachi VARCHAR(50),
    gioitinh VARCHAR(10),
    ngaysinh DATE,
    PRIMARY KEY (id_giangvien)
);
GO

CREATE TABLE giangday_hocphan(
	id_giangvien VARCHAR(50),
    id_lop VARCHAR(50),
    PRIMARY KEY(id_giangvien , id_lop),
    FOREIGN KEY (id_giangvien) REFERENCES giangvien(id_giangvien),
    FOREIGN KEY (id_lop) REFERENCES lophocphan(id_lop)
);
GO

CREATE TABLE dienthoai_giangvien(
	id_giangvien VARCHAR(50),
    sdt VARCHAR(11),
    PRIMARY KEY (id_giangvien,sdt),
    FOREIGN KEY (id_giangvien) REFERENCES giangvien(id_giangvien)
);
GO

CREATE TABLE hocvien_thamgia_hocphan(
	id_hocvien INT,
    id_lop VARCHAR(50),
    diemgiuaki FLOAT,
    diemthi FLOAT,
    diemtongket FLOAT,
    PRIMARY KEY (id_hocvien,id_lop),
    FOREIGN KEY (id_hocvien) REFERENCES hocvien_hocphan(id_hocvien),
    FOREIGN KEY (id_lop) REFERENCES lophocphan(id_lop)
);
GO

CREATE TABLE giamsat_phongthi(
	id_giangvien VARCHAR(50),
    id_lichthi VARCHAR(50),
    PRIMARY KEY (id_giangvien, id_lichthi),
    FOREIGN KEY (id_giangvien) REFERENCES giangvien(id_giangvien),
    FOREIGN KEY (id_lichthi) REFERENCES lichthi_hocphan(id_lichthi)
);
GO

CREATE TABLE dangki_hocphan(
	id_hocvien INT,
    id_nhomhocphan VARCHAR(50),
    PRIMARY KEY (id_hocvien, id_nhomhocphan),
    FOREIGN KEY (id_hocvien) REFERENCES hocvien_hocphan(id_hocvien),
    FOREIGN KEY (id_nhomhocphan) REFERENCES nhomhocphan(id_nhomhocphan)
);
GO

CREATE TABLE monhocthuoc_nhomhocphan(
	id_monhoc VARCHAR(50),
    id_nhomhocphan VARCHAR(50),
    PRIMARY KEY (id_monhoc, id_nhomhocphan),
    FOREIGN KEY (id_monhoc) REFERENCES monhoc(id_monhoc),
    FOREIGN KEY (id_nhomhocphan) REFERENCES nhomhocphan(id_nhomhocphan)
);
GO

CREATE TABLE lopchuyende(
	id_lopchuyende VARCHAR(50),
    ten VARCHAR(50),
    id_hocki VARCHAR(50),
    soluong_toida INT,
    soluong_dangki INT,
    PRIMARY KEY (id_lopchuyende)
);
GO

CREATE TABLE chuyende(
	id_chuyende VARCHAR(50),
    id_lopchuyende VARCHAR(50),
    ten VARCHAR(50),
    mota VARCHAR(50),
    hocphi VARCHAR(50),
    id_hoadon VARCHAR(50),
    PRIMARY KEY (id_chuyende),
    FOREIGN KEY (id_lopchuyende) REFERENCES lopchuyende(id_lopchuyende),
    FOREIGN KEY (id_hoadon) REFERENCES hoadon(id_hoadon)
);
GO

CREATE TABLE dangki_chuyende(
	id_lopchuyende VARCHAR(50),
    id_hocvien INT ,
    PRIMARY KEY (id_lopchuyende, id_hocvien),
    FOREIGN KEY (id_lopchuyende) REFERENCES lopchuyende(id_lopchuyende),
    FOREIGN KEY (id_hocvien) REFERENCES hocvien_chuyende(id_hocvien)
);
GO

INSERT INTO nhanvien_thuhocphi VALUES ('E112','Luu Van Ngan');
INSERT INTO nhanvien_thuhocphi VALUES ('E342','Nguyen Thi Kim Tien');
INSERT INTO nhanvien_thuhocphi VALUES ('E226','Luong Thanh Giau');
INSERT INTO nhanvien_thuhocphi VALUES ('E176','Le Van Do');
GO

INSERT INTO hocvien VALUES (1910001,'Nguyen Van An','Nam','1999/2/22','Ha Noi');
INSERT INTO hocvien VALUES (1910002,'Do Van Ba','Nam','1999/4/22','Hai Phong');
INSERT INTO hocvien VALUES (1910003,'Tran Thi Linh','Nu','1999/3/13','Da Nang');
INSERT INTO hocvien VALUES (1910004,'Le Thanh Dung','Nam','1999/4/14','Can Tho');
GO

INSERT INTO nhomhocphan VALUES('HPHKI','Hoc phan HK1','Hoc tai CS2','Chung chi xac nhan hoan thanh hoc phan');
INSERT INTO nhomhocphan VALUES('HPHKII','Hoc phan HK2','Hoc tai CS2','Chung chi xac nhan hoan thanh hoc phan');
INSERT INTO nhomhocphan VALUES('HPHKIII','Hoc phan HK3','Hoc tai CS1','Chung chi xac nhan hoan thanh hoc phan');
GO

INSERT INTO nguoithan VALUES(1910001,'Le Cong Dinh','Nam','1975/10/14','Ha Noi');
INSERT INTO nguoithan VALUES(1910002,'Tran Thuy Te','Nam','1977/5/18','Nghe An');
INSERT INTO nguoithan VALUES(1910003,'Doan Chi Binh','Nam','1967/9/22','Da Nang');
INSERT INTO nguoithan VALUES(1910004,'Le Tung Dan','Nam','1965/7/23','TP.HCM');
GO

INSERT INTO dienthoai_nguoithan VALUES(1910001,'Le Cong Dinh','66698');
INSERT INTO dienthoai_nguoithan VALUES(1910002,'Tran Thuy Te','33245');
INSERT INTO dienthoai_nguoithan VALUES(1910003,'Doan Chi Binh','66198');
INSERT INTO dienthoai_nguoithan VALUES(1910004,'Le Tung Dan','22537');
GO

INSERT INTO dienthoai_hocvien VALUES(1910001,'12345');
INSERT INTO dienthoai_hocvien VALUES(1910002,'23145');
INSERT INTO dienthoai_hocvien VALUES(1910003,'54243');
INSERT INTO dienthoai_hocvien VALUES(1910004,'45134');
GO

INSERT INTO giangvien VALUES('GV2001','Le Thanh Tu','Quan 7, TP.HCM','Nam','1986/1/11');
INSERT INTO giangvien VALUES('GV3910','Nguyen Thanh Binh','Quan 6, TP.HCM','Nam','1990/9/11');
INSERT INTO giangvien VALUES('GV4570','Cao Van Quang','Quan Tan Phu, TP.HCM','Nam','1965/3/5');
INSERT INTO giangvien VALUES('GV3391','Nguyen Ngoc Khanh','Quan 3, TP.HCM','Nu','1976/3/4');
GO

INSERT INTO dienthoai_giangvien VALUES('GV2001','54456');
INSERT INTO dienthoai_giangvien VALUES('GV3910','31256');
INSERT INTO dienthoai_giangvien VALUES('GV4570','67623');
INSERT INTO dienthoai_giangvien VALUES('GV3391','84632');
GO

INSERT INTO lichthi_hocphan VALUES('LT01','201','2021/12/13','90 phut');
INSERT INTO lichthi_hocphan VALUES('LT02','101','2021/12/14','60 phut');
INSERT INTO lichthi_hocphan VALUES('LT03','212','2021/12/15','50 phut');
INSERT INTO lichthi_hocphan VALUES('LT04','213','2021/12/16','45 phut');
INSERT INTO lichthi_hocphan VALUES('LT05','105','2021/12/22','90 phut');
GO

INSERT INTO thongtin_nhanvien VALUES('E112','E112@hcmut.edu.vn','12344');
INSERT INTO thongtin_nhanvien VALUES('E342','E342@hcmut.edu.vn','12364');
INSERT INTO thongtin_nhanvien VALUES('E176','E176@hcmut.edu.vn','15463');
INSERT INTO thongtin_nhanvien VALUES('E226','E226@hcmut.edu.vn','15364');
GO

INSERT INTO hocvien_hocphan VALUES(1910001);
INSERT INTO hocvien_hocphan VALUES(1910002);
GO

INSERT INTO hocvien_chuyende VALUES(1910003);
INSERT INTO hocvien_chuyende VALUES(1910004);
GO

INSERT INTO hoadon VALUES('HD0765','4:52:45','3000000','E176','1910001');
INSERT INTO hoadon VALUES('HD0941','6:02:05','3000000','E176','1910001');
INSERT INTO hoadon VALUES('HD2297','8:13:41','3000000','E176','1910001');
INSERT INTO hoadon VALUES('HD4120','7:51:43','3000000','E176','1910001');
GO

INSERT INTO monhoc VALUES('145','Van hoa Viet Nam',0.3,0.7,'Hoc trong 18 tuan','1000000','HD0765');
INSERT INTO monhoc VALUES('146','Am thuc Viet Nam',0.2,0.8,'Tham quan 2 ngay','1500000','HD0941');
INSERT INTO monhoc VALUES('147','Con nguoi Viet Nam',0.4,0.6,'Tim hieu ve dac trung con nguoi','3000000','HD2297');
INSERT INTO monhoc VALUES('149','Lich su Viet Nam',0.3,0.7,'Tim hieu lich su Viet Nam','5000000','HD4120');
GO


INSERT INTO lophocphan VALUES('L01','Lop hoc phan 01','HK1',110,99,'145','LT01');
INSERT INTO lophocphan VALUES('L02','Lop hoc phan 02','HK1',110,99,'145','LT02');
INSERT INTO lophocphan VALUES('L03','Lop hoc phan 03','HK2',110,99,'149','LT03');
INSERT INTO lophocphan VALUES('L04','Lop hoc phan 04','HK2',110,99,'146','LT04');
INSERT INTO lophocphan VALUES('L05','Lop hoc phan 05','HK3',110,99,'147','LT05');
GO
INSERT INTO lophocphan VALUES('L06','Lop hoc phan 05','HK3',110,99,'147',NULL);




 
INSERT INTO monhocthuoc_nhomhocphan VALUES('145','HPHKI');
INSERT INTO monhocthuoc_nhomhocphan VALUES('146','HPHKII');
INSERT INTO monhocthuoc_nhomhocphan VALUES('147','HPHKIII');
INSERT INTO monhocthuoc_nhomhocphan VALUES('149','HPHKI');
GO

INSERT INTO hocvien_thamgia_hocphan VALUES(1910001,'L01',8,8,8);
INSERT INTO hocvien_thamgia_hocphan VALUES(1910002,'L02',7,7,7);
INSERT INTO hocvien_thamgia_hocphan VALUES(1910001,'L03',9,9,9);
INSERT INTO hocvien_thamgia_hocphan VALUES(1910002,'L04',10,10,10);
INSERT INTO hocvien_thamgia_hocphan VALUES(1910001,'L05',5,5,5);
GO

INSERT INTO lopchuyende VALUES('A01','Lop chuyen de 01','HK211',50,49);
INSERT INTO lopchuyende VALUES('A03','Lop chuyen de 03','HK211',30,20);
INSERT INTO lopchuyende VALUES('A05','Lop chuyen de 05','HK212',40,31);
INSERT INTO lopchuyende VALUES('A07','Lop chuyen de 07','HK213',20,17);
GO

INSERT INTO dangki_chuyende VALUES('A01',1910003);
INSERT INTO dangki_chuyende VALUES('A01',1910004);
INSERT INTO dangki_chuyende VALUES('A03',1910004);
INSERT INTO dangki_chuyende VALUES('A05',1910004);
INSERT INTO dangki_chuyende VALUES('A05',1910003);
INSERT INTO dangki_chuyende VALUES('A07',1910004);
INSERT INTO dangki_chuyende VALUES('A07',1910003);
GO

INSERT INTO chuyende VALUES('CD01','A01','Ung pho voi bien doi khi hau','Tim hieu khai quat','Mien phi','HD4120');
INSERT INTO chuyende VALUES('CD02','A05','Khoi nghiep','Truong phong P&D gap mat','Mien phi','HD0941');
INSERT INTO chuyende VALUES('CD03','A05','Quan ly tai chinh','Truong phong ke toan SuperStar gap mat','Mien phi','HD0941');
INSERT INTO chuyende VALUES('CD04','A07','Quan tri thoi gian','PGD Cong Ty EOW gap mat','Mien phi','HD0765');
INSERT INTO chuyende VALUES('CD05','A03','Bao mat he thong thong tin','Pho truong bo mon giang day','Mien phi','HD0765');
GO

INSERT INTO dangki_hocphan VALUES(1910001,'HPHKI');
INSERT INTO dangki_hocphan VALUES(1910001,'HPHKII');
INSERT INTO dangki_hocphan VALUES(1910002,'HPHKII');
INSERT INTO dangki_hocphan VALUES(1910002,'HPHKIII');
INSERT INTO dangki_hocphan VALUES(1910002,'HPHKI');
INSERT INTO dangki_hocphan VALUES(1910001,'HPHKIII');
GO

INSERT INTO giamsat_phongthi VALUES('GV2001','LT01');
INSERT INTO giamsat_phongthi VALUES('GV3910','LT02');
INSERT INTO giamsat_phongthi VALUES('GV4570','LT04');
INSERT INTO giamsat_phongthi VALUES('GV3391','LT01');
INSERT INTO giamsat_phongthi VALUES('GV4570','LT02');
INSERT INTO giamsat_phongthi VALUES('GV3910','LT03');
INSERT INTO giamsat_phongthi VALUES('GV2001','LT05');
GO

INSERT INTO giangday_hocphan VALUES('GV2001','L01');
INSERT INTO giangday_hocphan VALUES('GV3910','L02');
INSERT INTO giangday_hocphan VALUES('GV4570','L04');
INSERT INTO giangday_hocphan VALUES('GV3391','L01');
INSERT INTO giangday_hocphan VALUES('GV4570','L02');
INSERT INTO giangday_hocphan VALUES('GV3910','L03');
INSERT INTO giangday_hocphan VALUES('GV2001','L05');
GO



---- query_a: Truy xuất tất cả người thân của học viên lớp chuyên đề.
SELECT 
	nguoithan.id_hocvien, 
	nguoithan.hoten, 
	nguoithan.gioitinh, 
	nguoithan.diachi
FROM 
	nguoithan, 
	hocvien_chuyende
WHERE 
	nguoithan.id_hocvien = hocvien_chuyende.id_hocvien
ORDER BY 
	nguoithan.hoten ASC
GO

---- query_b: Truy xuất tất cả học viên lớp học phần có địa chỉ tại Hà Nội.
SELECT 
	hocvien.id_hocvien, 
	hocvien.hoten, 
	hocvien.gioitinh, 
	hocvien.ngaysinh,
	hocvien.diachi
FROM 
	hocvien, 
	hocvien_hocphan
WHERE 
	hocvien.id_hocvien = hocvien_hocphan.id_hocvien AND 
	hocvien.diachi='Ha Noi'
ORDER BY 
	hocvien.hoten ASC

GO
---- query_c: Truy xuất những môn học có tổng thu học phí > 200 triệu
SELECT
    monhoc.id_monhoc,
    monhoc.ten,
    monhoc.hocphi,
    SUM(lophocphan.sinhviendangki) AS sinhviendangky,
    SUM(monhoc.hocphi * lophocphan.sinhviendangki) AS tongthu
FROM
    monhoc,
    lophocphan
WHERE
    monhoc.id_monhoc = lophocphan.id_monhoc
GROUP BY
    monhoc.id_monhoc,
    monhoc.ten,
    monhoc.hocphi
HAVING 
	SUM(monhoc.hocphi * lophocphan.sinhviendangki) >200000000
ORDER BY 
	tongthu ASC

GO
---- query_d: Truy xuất các nhóm học phần có số lượng sinh viên đăng ký ≤ 100 sinh viên.
SELECT 
	nhomhocphan.id_nhomhocphan,
	nhomhocphan.ten,
	SUM(lophocphan.sinhviendangki) AS tongsinhviendangky
FROM
	nhomhocphan,
	lophocphan,
	monhocthuoc_nhomhocphan
WHERE
	lophocphan.id_monhoc=monhocthuoc_nhomhocphan.id_monhoc AND
	monhocthuoc_nhomhocphan.id_nhomhocphan=nhomhocphan.id_nhomhocphan
GROUP BY 
	nhomhocphan.id_nhomhocphan,
	nhomhocphan.ten
HAVING 
	SUM(lophocphan.sinhviendangki) <= 100
ORDER BY
	tongsinhviendangky ASC
GO

-----proc_a: Hiển thị tất cả các lớp học phần trong nhóm học phần với input là mã nhóm học phần
CREATE PROCEDURE usp_showlophocphan @manhomhocphan  VARCHAR(50)
AS
IF EXISTS (SELECT * FROM monhocthuoc_nhomhocphan WHERE monhocthuoc_nhomhocphan.id_nhomhocphan = @manhomhocphan)
		BEGIN
			IF EXISTS (
						SELECT 
							lophocphan.id_lop, lophocphan.ten 
						FROM 
							lophocphan,monhocthuoc_nhomhocphan 
						WHERE 
							monhocthuoc_nhomhocphan.id_nhomhocphan = @manhomhocphan AND 
							lophocphan.id_monhoc = monhocthuoc_nhomhocphan.id_monhoc
						)
				SELECT 
					lophocphan.id_lop, lophocphan.ten 
				FROM 
					lophocphan,monhocthuoc_nhomhocphan 
				WHERE 
					monhocthuoc_nhomhocphan.id_nhomhocphan = @manhomhocphan AND 
					lophocphan.id_monhoc = monhocthuoc_nhomhocphan.id_monhoc
						
			ELSE raiserror('Khong ton tai lop hoc phan',1,1)
		END
	ELSE raiserror('Khong ton tai nhom hoc phan da nhap',1,1)
GO

EXEC usp_showlophocphan 'HPHKV'
GO

------proc_b: Cập nhật lại học phí của môn học với input là mã
--môn học và giá học phí mới
CREATE PROCEDURE usp_changehocphimonhoc @mamonhoc VARCHAR(50), @hocphi VARCHAR(50)
AS
IF EXISTS (SELECT * FROM monhoc WHERE monhoc.id_monhoc=@mamonhoc)
	BEGIN
			UPDATE monhoc
			SET monhoc.hocphi = @hocphi
			WHERE monhoc.id_monhoc=@mamonhoc
	END
ELSE raiserror('Khong ton tai mon hoc hoac ma mon hoc khong hop le',1,1)
GO

EXEC usp_changehocphimonhoc '145','100000'
GO

SELECT * FROM monhoc;
GO


-----trigger_a: Tự động tăng số lượng sinh viên đăng ký trong bảng
--lopchuyende lên 1 khi thêm 1 record vào bảng dangki_chuyende. Nếu số lượng sinh viên đăng ký vượt
--quá số lượng sinh viên tối đa thì xuất ra error.
CREATE TRIGGER beforeinsert_dangkichuyende ON dangki_chuyende INSTEAD OF INSERT
AS
BEGIN
	DECLARE @idlop VARCHAR(50)
	DECLARE @idhocvien VARCHAR(50)
	SELECT @idlop = id_lopchuyende FROM inserted
	SELECT @idhocvien = id_hocvien FROM inserted
	IF NOT EXISTS (SELECT * FROM dbo.lopchuyende WHERE @idlop=lopchuyende.id_lopchuyende)
		RAISERROR ('Ma lop khong chinh xac',1,1)	
	IF NOT EXISTS (SELECT * FROM hocvien WHERE id_hocvien=@idhocvien)
		RAISERROR ('Sai ma hoc vien',1,1)
	IF NOT EXISTS (SELECT * FROM hocvien_chuyende WHERE id_hocvien=@idhocvien)
		INSERT INTO hocvien_chuyende VALUES (@idhocvien)
		IF NOT EXISTS (SELECT * FROM dangki_chuyende WHERE id_hocvien=@idhocvien AND id_lopchuyende=@idlop)
			INSERT INTO dangki_chuyende VALUES(@idlop,@idhocvien)
		ELSE RAISERROR ('Hoc vien da o trong lop chuyen de',1,1)
END
GO


CREATE TRIGGER insert_dangkichuyende ON dangki_chuyende FOR INSERT
AS
BEGIN
	DECLARE @idlop VARCHAR(50)
	DECLARE @idhocvien VARCHAR(50)
	SELECT @idlop = id_lopchuyende FROM inserted
	SELECT @idhocvien = id_hocvien FROM inserted
	
	IF EXISTS (SELECT * FROM dbo.lopchuyende 
				WHERE @idlop=lopchuyende.id_lopchuyende)
		IF EXISTS (SELECT * FROM dbo.lopchuyende 
					WHERE lopchuyende.soluong_toida >= lopchuyende.soluong_dangki +1 AND 
					@idlop=lopchuyende.id_lopchuyende)
			BEGIN
				UPDATE lopchuyende SET soluong_dangki=soluong_dangki+1
				WHERE id_lopchuyende=@idlop
			END
		ELSE 
			BEGIN
				RAISERROR ('Qua so hoc vien cho phep',16,1)
				ROLLBACK TRANSACTION
			END
END
GO

INSERT INTO dangki_chuyende VALUES('A07',1910001);
GO
SELECT * FROM lopchuyende;
GO



SELECT * FROM dangki_chuyende

-----trigger_b:  Nếu update hệ số điểm ở bảng monhoc thì tự động
--cập nhật điểm tổng kết ở bảng hocvientham- giahocphan
CREATE TRIGGER update_hesodiem ON monhoc AFTER UPDATE
AS
BEGIN
	DECLARE @mamonhoc VARCHAR(50)
	DECLARE @hsGK FLOAT
	DECLARE @hsCK FLOAT
	SELECT @mamonhoc =  id_monhoc FROM inserted
	SELECT @hsGK = hesodiemkiemtra FROM inserted
	SELECT @hsCK = hesodiemthi FROM inserted

	IF EXISTS (SELECT * FROM monhoc, lophocphan 
			WHERE @mamonhoc=lophocphan.id_monhoc)
		IF EXISTS (SELECT * FROM monhoc, lophocphan, hocvien_thamgia_hocphan 
				WHERE @mamonhoc=lophocphan.id_monhoc AND lophocphan.id_lop= hocvien_thamgia_hocphan.id_lop)
			BEGIN
				UPDATE hocvien_thamgia_hocphan SET diemtongket= diemgiuaki * @hsGK + diemthi * @hsCK
				FROM monhoc, lophocphan, hocvien_thamgia_hocphan 
				WHERE @mamonhoc=lophocphan.id_monhoc AND lophocphan.id_lop= hocvien_thamgia_hocphan.id_lop
			END
		ELSE RAISERROR ('Mon hoc khong mo lop',1,1)
	ELSE RAISERROR ('Ma mon hoc khong chinh xac',1,1)
END
GO

SELECT * FROM monhoc;
GO

UPDATE monhoc SET hesodiemkiemtra=0.2, hesodiemthi=0.8 WHERE id_monhoc='145';
GO

SELECT * FROM monhoc;
GO
SELECT * FROM lophocphan;
GO
SELECT * FROM hocvien_thamgia_hocphan;
GO

-----trigger_c: Cập nhật dữ liệu id_lichthi trong bảng lophocphan
--về NULL, xóa record tương ứng trong bảng
--giamsat_phongthi khi xóa record trong bảng lichthi_hocphan
CREATE TRIGGER delete_lichthi ON lichthi_hocphan INSTEAD OF DELETE
AS
BEGIN
	DECLARE @malichthi VARCHAR(20)
	SELECT @malichthi = id_lichthi FROM deleted
	IF EXISTS (SELECT * FROM lichthi_hocphan 
			WHERE @malichthi=lichthi_hocphan.id_lichthi)
		BEGIN
			UPDATE lophocphan SET id_lichthi= NULL
			WHERE id_lichthi=@malichthi 
			DELETE FROM giamsat_phongthi WHERE id_lichthi=@malichthi 
			DELETE FROM lichthi_hocphan WHERE id_lichthi=@malichthi
		END
	ELSE RAISERROR ('Khong the xoa',1,1)
END
GO

DELETE FROM lichthi_hocphan WHERE id_lichthi='LT04';
GO
SELECT * FROM lophocphan;
GO

---function: Kiểm tra xem phòng thi x có trống vào vào ngày y hay
--không, với x, y là input
ALTER FUNCTION check_phongthi (@phongthi VARCHAR(20), @ngay DATE)
RETURNS VARCHAR(30)
AS
BEGIN
	IF EXISTS (SELECT * FROM lichthi_hocphan WHERE phongthi = @phongthi)
		BEGIN
			DECLARE @result VARCHAR(30) = 'Khong ton tai lich thi'
			DECLARE tongtvcursor CURSOR FOR SELECT phongthi, ngaythi FROM lichthi_hocphan
			OPEN tongtvcursor
			DECLARE @id VARCHAR(20)
			DECLARE @ngaythi date
			FETCH NEXT FROM tongtvcursor INTO @id, @ngaythi
			WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@id = @phongthi AND  @ngaythi = @ngay)
					BEGIN
						SET @result = 'Ton tai lich thi';
					END
					FETCH NEXT FROM tongtvcursor INTO @id, @ngaythi
				END
			CLOSE tongtvcursor
			DEALLOCATE tongtvcursor
			RETURN @result
		END
	RETURN cast('Phong thi khong ton tai' as VARCHAR(30))
END
GO

SELECT dbo.check_phongthi('201', '12-13-2021') ket_qua
GO
SELECT dbo.check_phongthi('201', '11-13-2021') ket_qua
GO
SELECT dbo.check_phongthi('214', '12-13-2021') ket_qua
GO
SELECT * FROM lichthi_hocphan;
GO