﻿THỊNH
Create database CSDL_QLHT_Test

Use CSDL_QLHT_Test


--Phần trên
CREATE TABLE THANHPHO(
	THANHPHO_ID  INT PRIMARY KEY IDENTITY(1,1),
	THANHPHO_TEN NVARCHAR(50),
	THANHPHO_TRANGTHAI INT,
)
GO
CREATE TABLE QUAN(
	QUAN_ID  INT PRIMARY KEY IDENTITY(1,1),
	THANHPHO_ID INT,
	QUAN_TEN NVARCHAR(50),
	QUAN_TRANGTHAI INT,
)
GO
ALTER TABLE QUAN
ADD CONSTRAINT FK_QUAN_THANHPHO FOREIGN KEY (THANHPHO_ID) REFERENCES THANHPHO(THANHPHO_ID)
GO
CREATE TABLE PHUONG(
	PHUONG_ID  INT IDENTITY(1,1),
	QUAN_ID INT,
	PHUONG_TEN NVARCHAR(50),
	PHUONG_TRANGTHAI INT,
)
GO
ALTER TABLE PHUONG
ADD CONSTRAINT PK_PHUONG PRIMARY KEY (PHUONG_ID)
ALTER TABLE PHUONG
ADD CONSTRAINT FK_PHUONG_QUAN FOREIGN KEY (QUAN_ID) REFERENCES QUAN(QUAN_ID)
GO


CREATE TABLE COQUAN(
	COQUAN_ID INT IDENTITY(1,1),
	COQUAN_TEN NVARCHAR(255),
	COQUAN_SDT NVARCHAR(11),
	COQUAN_EMAIL NVARCHAR(100),
	COQUAN_DIACHI NVARCHAR(255),
	COQUAN_GIOITHIEU NVARCHAR(255),

);

CREATE TABLE NGUOIDUNG(
	NGUOIDUNG_ID INT IDENTITY(1,1) PRIMARY KEY,
	NGUOIDUNG_MACANBO NVARCHAR(20),
	NGUOIDUNG_HOVATEN NVARCHAR(100),
	NGUOIDUNG_NGAYSINH DATE,
	NGUOIDUNG_EMAIL NVARCHAR(50),
	NGUOIDUNG_SDT NVARCHAR(11),
	NGUOIDUNG_USERNAME NVARCHAR(50),
	NGUOIDUNG_PASS NVARCHAR(20),
	NGUOIDUNG_TRANGTHAI INT,
	NGUOIDUNG_QUYEN INT,
	COQUAN_ID INT,
)
GO
CREATE TABLE LOAI_GIAYTO(
	LOAI_GIAYTO_ID INT IDENTITY(1,1),
	LOAI_GIAYTO_TEN NVARCHAR(50),
)
CREATE TABLE HOSO_DANGKY(
	HOSO_DANGKY_ID INT IDENTITY(1,1),
	TRANGTHAI_XULI_ID INT,
	HOSO_DANGKY_NGAY_DANGKY DATE,
	HOSO_DANGKY_NGAY_HETHAN DATE,
	COQUAN_ID INT
)

--Thêm khóa chính và khóa ngoại
ALTER TABLE COQUAN
ADD CONSTRAINT	PK_COQUAN PRIMARY KEY (COQUAN_ID)
GO

ALTER TABLE LOAI_GIAYTO
ADD CONSTRAINT	PK_LOAI_GIAYTO PRIMARY KEY (LOAI_GIAYTO_ID)
GO
ALTER TABLE HOSO_DANGKY
ADD CONSTRAINT	PK_HOSO_DANGKY PRIMARY KEY (HOSO_DANGKY_ID)
GO

--Thêm khóa ngoại cho Hồ sơ đăng kí - Cơ quan
ALTER TABLE HOSO_DANGKY
ADD CONSTRAINT FK_HOSO_DANKY_COQUAN FOREIGN KEY (COQUAN_ID) REFERENCES COQUAN(COQUAN_ID)
GO
--Thêm khóa ngoại cho Người dùng - Cơ quan
ALTER TABLE NGUOIDUNG
ADD CONSTRAINT FK_NGUOIDUNG_COQUAN FOREIGN KEY (COQUAN_ID) REFERENCES COQUAN(COQUAN_ID)
GO

-- Tạo bảng Hình thức đăng kí
CREATE TABLE HINHTHUC_DANGKY(
	HINHTHUC_DANGKY_ID INT IDENTITY(1,1),
	HINHTHUC_DANGKY_TEN NVARCHAR(255),
)
--Tạo bảng Loại đăng kí
CREATE TABLE LOAI_DANGKY(
	LOAI_DANGKY_ID INT IDENTITY(1,1),
	LOAI_GIAYTO_ID INT,
	HINHTHUC_DANGKY_ID INT,
	LOAI_DANGKY_TEN NVARCHAR(255)
)
--Thiết lập khóa chính cho Hình thức đăng kí và loại đăng kí
ALTER TABLE HINHTHUC_DANGKY
ADD CONSTRAINT	PK_HINHTHUC_DANGKY PRIMARY KEY (HINHTHUC_DANGKY_ID)
GO
ALTER TABLE LOAI_DANGKY
ADD CONSTRAINT	PK_LOAI_DANGKY PRIMARY KEY (LOAI_DANGKY_ID)
GO
--Thêm khóa ngoại cho Hồ sơ đăng kí - Loại đăng kí
ALTER TABLE HOSO_DANGKY
ADD LOAI_DANGKY_ID INT;
GO
ALTER TABLE HOSO_DANGKY
ADD CONSTRAINT FK_HOSO_DANGKY_LOAI_DANGKY FOREIGN KEY (LOAI_DANGKY_ID) REFERENCES LOAI_DANGKY(LOAI_DANGKY_ID)
GO
--Thêm khóa ngoại cho Loại đăng kí - Loại giấy tờ
ALTER TABLE LOAI_DANGKY
ADD CONSTRAINT FK_LOAI_DANGKY_LOAI_GIAYTO FOREIGN KEY (LOAI_GIAYTO_ID) REFERENCES LOAI_GIAYTO(LOAI_GIAYTO_ID)
GO
--Thêm khóa ngoại cho Loại đăng kí - Hình thức đăng kí
ALTER TABLE LOAI_DANGKY
ADD CONSTRAINT FK_LOAI_DANGKY_HINHTHUC_DANGKY FOREIGN KEY (HINHTHUC_DANGKY_ID) REFERENCES HINHTHUC_DANGKY(HINHTHUC_DANGKY_ID)
GO

CREATE TABLE DANTOC(
	DANTOC_ID INT IDENTITY(1,1),
	DANTOC_TEN NVARCHAR(50),
)
ALTER TABLE DANTOC
ADD CONSTRAINT PK_DANTOC PRIMARY KEY (DANTOC_ID)

CREATE TABLE QUOCGIA(
	QUOCGIA_ID INT IDENTITY(1,1),
	QUOCGIA_TEN NVARCHAR(50),
)
ALTER TABLE QUOCGIA
ADD CONSTRAINT PK_QUOCGIA PRIMARY KEY (QUOCGIA_ID)

-- Các loại giấy tờ
DROP TABLE DANGKY_KHAISINH
CREATE TABLE DANGKY_KHAISINH(
	HOSO_DANGKY_ID INT NOT NULL,

	NGUOIYEUCAU_TEN NVARCHAR(100),
	NGUOIYEUCAU_CMND NVARCHAR(12),
	NGUOIYEUCAU_CMND_NGAYCAP DATE,
	NGUOIYEUCAU_CMND_NOICAP NVARCHAR(255),
	NGUOIYEUCAU_QUOCTICH NVARCHAR(50),

	--Địa chỉ người yêu cầu
	NGUOIYEUCAU_THANHPHO NVARCHAR(100),
	NGUOIYEUCAU_QUAN NVARCHAR(100),
	NGUOIYEUCAU_PHUONG NVARCHAR(100),
	NGUOIYEUCAU_DIACHI NVARCHAR(255),

	NGUOIYEUCAU_QUANHE NVARCHAR(255),

	----Đối tượng khai sinh
	KHAISINH_TEN NVARCHAR(255),
	KHAISINH_GIOITINH BIT,
	KHAISINH_NGAYSINH DATE,
	KHAISINH_DANTOC NVARCHAR(50),
	KHAISINH_QUOCTICH NVARCHAR(50),

	--Quê quán
	KHAISINH_QUEQUAN_THANHPHO NVARCHAR(50),
	KHAISINH_QUEQUAN_QUAN NVARCHAR(50),
	KHAISINH_QUEQUAN_PHUONG NVARCHAR(50),
	KHAISINH_QUEQUAN_DIACHI NVARCHAR(50),

	--Nơi sinh //Ngay chổ này là chổ của cơ quan sinh sản
	---Cơ quan sinh sản ở đâu thì trùng với nơi sinh chổ đó
	--VD: Người Có quê quán ở btre
	-- Mã sinh ở Bệnh viện từ vũ => Nới sinh là tphcm.....
	KHAISINH_NOISINH NVARCHAR(50),
	KHAISINH_QUOCGIA_NOISINH NVARCHAR(50),
	KHAISINH_THANHPHO_NOISINH NVARCHAR(50),
	KHAISINH_QUAN_NOISINH NVARCHAR(50),
	KHAISINH_PHUONG_NOISINH NVARCHAR(50),
	KHAISINH_DIACHI_NOISINH NVARCHAR(50),
---=> Nơi sinh là nơi mẹ mình đẻ mình. Đẻ ở đâu thì nói sinh ở đó
--- Tuy nghiên
---Trong giấy khai sinh thì chỉ lấy tp,quan,huyen, cơ sở sinh thôi
	---Thông tin của mẹ
	ME_TEN NVARCHAR(255),
	ME_NGAYSINH DATE,
	ME_CMND NVARCHAR(12),
	ME_CMND_NGAYCAP DATE,
	ME_CMND_NOICAP NVARCHAR(255),
	ME_DANTOC NVARCHAR(50),
	ME_QUOCTICH NVARCHAR(50),

	--Địa chỉ của mẹ
	ME_THANHPHO NVARCHAR(100),
	ME_QUAN NVARCHAR(100),
	ME_PHUONG NVARCHAR(100),
	ME_DIACHI NVARCHAR(255),

	--Thông tin của Cha
	CHA_TEN NVARCHAR(255),
	CHA_NGAYSINH DATE,
	CHA_CMND NVARCHAR(12),
	CHA_CMND_NGAYCAP DATE,
	CHA_CMND_NOICAP NVARCHAR(255),
	CHA_DANTOC NVARCHAR(50),
	CHA_QUOCTICH NVARCHAR(50),

	--Địa chỉ của cha
	CHA_THANHPHO NVARCHAR(100),
	CHA_QUAN NVARCHAR(100),
	CHA_PHUONG NVARCHAR(100),
	CHA_DIACHI NVARCHAR(255),

	FILE_GIAYCHUNGSINH NVARCHAR(255)
)
GO
ALTER TABLE DANGKY_KHAISINH
ADD CONSTRAINT PK_DANGKY_KHAISINH PRIMARY KEY (HOSO_DANGKY_ID)
GO
--Liên kết bảng Đăng kí khai sinh - Hồ sơ đăng kí
ALTER TABLE DANGKY_KHAISINH
ADD CONSTRAINT FK_DANGKY_KHAISINH_HOSO_DANG_KY FOREIGN KEY (HOSO_DANGKY_ID) REFERENCES HOSO_DANGKY(HOSO_DANGKY_ID)
GO



CREATE TABLE DANGKY_KETHON(
	HOSO_DANGKY_ID INT  NOT NULL,

	KETHON_V_HOTEN NVARCHAR(255),
	KETHON_V_NGAYSINH DATE,
	KETHON_V_DANTOC NVARCHAR(50),
	KETHON_V_CMND NVARCHAR(12),
	KETHON_V_CMND_NGAYCAP DATE,
	KETHON_V_CMND_NOICAP NVARCHAR(255),

	KETHON_V_QUOCTICH NVARCHAR(50),

	KETHON_V_THANHPHO NVARCHAR(100),
	KETHON_V_QUAN NVARCHAR(100),
	KETHON_V_PHUONG NVARCHAR(100),
	KETHON_V_DIACHI NVARCHAR(255),
	KETHON_V_LAN INT,
	KETHON_FILE_V NVARCHAR(255),

	KETHON_C_HOTEN NVARCHAR(255),
	KETHON_C_NGAYSINH DATE,
	KETHON_C_DANTOC NVARCHAR(50),
	KETHON_C_CMND NVARCHAR(12),
	KETHON_C_CMND_NGAYCAP DATE,
	KETHON_C_CMND_NOICAP NVARCHAR(255),
	KETHON_C_QUOCTICH NVARCHAR(50),
	KETHON_C_THANHPHO NVARCHAR(100),
	KETHON_C_QUAN NVARCHAR(100),
	KETHON_C_PHUONG NVARCHAR(100),
	KETHON_C_DIACHI NVARCHAR(255),
	KETHON_C_LAN INT,
	KETHON_FILE_C NVARCHAR(255),

)
GO
ALTER TABLE DANGKY_KETHON
ADD CONSTRAINT PK_DANGKY_KETHON PRIMARY KEY (HOSO_DANGKY_ID)
GO
ALTER TABLE DANGKY_KETHON
ADD CONSTRAINT FK_DANGKY_KETHON_HOSO_DANG_KY FOREIGN KEY (HOSO_DANGKY_ID) REFERENCES HOSO_DANGKY(HOSO_DANGKY_ID)
GO

DROP TABLE DANGKY_CHUNGTU
CREATE TABLE DANGKY_CHUNGTU(
	HOSO_DANGKY_ID INT  NOT NULL,

	NGUOIYEUCAU_TEN NVARCHAR(255),
	NGUOIYEUCAU_CMND NVARCHAR(12),
	NGUOIYEUCAU_CMND_NGAYCAP DATE,
	NGUOIYEUCAU_CMND_NOICAP NVARCHAR(255),
	NGUOIYEUCAU_QUOCTICH NVARCHAR(50),
	NGUOIYEUCAU_THANHPHO NVARCHAR(100),
	NGUOIYEUCAU_QUAN NVARCHAR(100),
	NGUOIYEUCAU_PHUONG NVARCHAR(100),
	NGUOIYEUCAU_DIACHI NVARCHAR(255),
	NGUOIYEUCAU_QUANHE NVARCHAR(255),

	KHAITU_TEN NVARCHAR(100),
	KHAITU_NGAYSINH DATE,
	KHAITU_GIOITINH BIT,
	KHAITU_DANTOC NVARCHAR(50),
	KHAITU_CMND NVARCHAR(12),
	KHAITU_CMND_NGAYCAP DATE,
	KHAITU_CMND_NOICAP NVARCHAR(255),
	KHAITU_QUOCTICH NVARCHAR(50),
	KHAITU_THANHPHO NVARCHAR(100),
	KHAITU_QUAN NVARCHAR(100),
	KHAITU_PHUONG NVARCHAR(100),
	KHAITU_DIACHI NVARCHAR(255),


	KHAITU_NGUYENNHAN NVARCHAR(255),
	KHAITU_NGAYMAT DATE,
	KHAITU_THOIGIAN TIME,
	KHAITU_NOIMAT_QUOCGIA NVARCHAR(255),
	KHAITU_NOIMAT_THANHPHO NVARCHAR(255),
	KHAITU_NOIMAT_QUAN NVARCHAR(255),
	KHAITU_NOIMAT_PHUONG NVARCHAR(255),
	KHAITU_NOIMAT_DIACHI NVARCHAR(255),
	
    
	FILE_BAOTU_TEN NVARCHAR(255)

)
GO
ALTER TABLE DANGKY_CHUNGTU
ADD CONSTRAINT PK_DANGKY_CHUNGTU PRIMARY KEY (HOSO_DANGKY_ID)
GO
ALTER TABLE DANGKY_CHUNGTU
ADD CONSTRAINT FK_DANGKY_CHUNGTU_HOSO_DANG_KY FOREIGN KEY (HOSO_DANGKY_ID) REFERENCES HOSO_DANGKY(HOSO_DANGKY_ID)
GO

DROP TABLE DANGKY_TRICHLUC
CREATE TABLE DANGKY_TRICHLUC(
	HOSO_DANGKY_ID INT NOT NULL,

	NGUOIYEUCAU_TEN NVARCHAR(255),
	NGUOIYEUCAU_CMND NVARCHAR(12),
	NGUOIYEUCAU_CMND_NGAYCAP DATE,
	NGUOIYEUCAU_CMND_NOICAP NVARCHAR(255),
	NGUOIYEUCAU_QUOCTICH NVARCHAR(50),
	NGUOIYEUCAU_THANHPHO NVARCHAR(100),
	NGUOIYEUCAU_QUAN NVARCHAR(100),
	NGUOIYEUCAU_PHUONG NVARCHAR(100),
	NGUOIYEUCAU_DIACHI NVARCHAR(255),

	NGUOIYEUCAU_QUANHE NVARCHAR(255),
    --Lấy thông tin đối tượng trích lúc
	BANSAO_TEN NVARCHAR(255),
	BANSAO_NGAYSINH DATE,
	BANSAO_GIOITINH BIT,
	BANSAO_QUOCTICH NVARCHAR(50),
	BANSAO_THANHPHO NVARCHAR(100),
	BANSAO_QUAN NVARCHAR(100),
	BANSAO_PHUONG NVARCHAR(100),
	BANSAO_DIACHI NVARCHAR(255),
 ---Loại giấy đó là gì
	LOAI_GIAYTO_ID INT,
	BANSAO_SOQUYEN INT,
	BANSAO_SO INT,
--Số lượng
	BANSAO_SOLUONG INT,	 
)
GO
ALTER TABLE DANGKY_TRICHLUC
ADD CONSTRAINT PK_DANGKY_TRICHLUC PRIMARY KEY (HOSO_DANGKY_ID)
GO
ALTER TABLE DANGKY_TRICHLUC
ADD CONSTRAINT FK_DANGKY_TRICHLUC_HOSO_DANG_KY FOREIGN KEY (HOSO_DANGKY_ID) REFERENCES HOSO_DANGKY(HOSO_DANGKY_ID)
GO
ALTER TABLE DANGKY_TRICHLUC
ADD CONSTRAINT FK_DANGKY_TRICHLUC_LOAI_GIAYTO FOREIGN KEY (LOAI_GIAYTO_ID) REFERENCES LOAI_GIAYTO(LOAI_GIAYTO_ID)
GO

--Hết phần trên

--1. Nghiệp vụ xem tổng quan hồ sơ
-----------------------------------------------------------
--Thiết kế cơ sở dữ liệu với tính đúng đắn
CREATE TABLE THONGBAO(
	THONGBAO_ID INT IDENTITY(1,1),
	NGUOIDUNG_ID INT,
	THONGBAO_NOIDUNG NVARCHAR(255),
)
--Tạo bảng trạng thái xử lý
CREATE TABLE TRANGTHAI_XULI(
	TRANGTHAI_XULI_TEN NVARCHAR(255),
)
--Thiết kế cơ sở dữ liệu với tính tiến hóa
--Thêm khóa chính và khóa ngoại
ALTER TABLE THONGBAO
ADD CONSTRAINT	PK_THONGBAO PRIMARY KEY (THONGBAO_ID)
GO

--Thêm khóa ngoại cho Thông báo - Người dùng
ALTER TABLE THONGBAO
ADD CONSTRAINT FK_THONGBAO_NGUOIDUNG FOREIGN KEY (NGUOIDUNG_ID) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO

--Thêm khóa ngoại cho Trạng thái - Hồ sơ đăng kí
ALTER TABLE TRANGTHAI_XULI
ADD TRANGTHAI_XULI_ID INT IDENTITY(1,1)
ALTER TABLE TRANGTHAI_XULI
ADD CONSTRAINT PK_TRANGTHAI_XULI PRIMARY KEY (TRANGTHAI_XULI_ID)
ALTER TABLE HOSO_DANGKY
ADD CONSTRAINT FK_HOSO_DANGKY_TRANGTHAI_XULI FOREIGN KEY (TRANGTHAI_XULI_ID) REFERENCES TRANGTHAI_XULI(TRANGTHAI_XULI_ID)
GO


CREATE TABLE CONGDAN(
	CONGDAN_HOVATEN NVARCHAR(255),
	CONGDAN_NGAYSINH DATE,
	CONGDAN_GIOITINH BIT,
	CONGDAN_QUEQUAN NVARCHAR(255),
	CONGDAN_QUOCTICH NVARCHAR(255),
	CONGDAN_DANTOC NVARCHAR(255),
	CONGDAN_CMND NVARCHAR(20),
	CONGDAN_CMND_NGAYCAP DATE,
	CONGDAN_CMND_NOICAP NVARCHAR(255),
	CONGDAN_THANHPHO NVARCHAR(100),
	CONGDAN_QUAN NVARCHAR(100),
	CONGDAN_PHUONG NVARCHAR(100),
	CONGDAN_DIACHI NVARCHAR(255),
)
ALTER TABLE CONGDAN
ADD CONGDAN_ID INT IDENTITY(1,1)
ALTER TABLE CONGDAN
ADD CONSTRAINT PK_CONGDAN PRIMARY KEY (CONGDAN_ID)

--Thêm bảng cơ sở dữ liệu của các loại giấy tờ đã được kiểm duyệt thành công
--Khai sinh
CREATE TABLE GIAY_KHAISINH(
	GIAY_KHAISINH_ID INT IDENTITY(1,1),

	GIAY_KHAISINH_MA NVARCHAR(10),
	GIAY_KHAISINH_SOQUYEN NVARCHAR(10),

	HOSO_DANGKY_ID INT,

	CONGDAN_ID INT,
	--GIAY_KHAISINH_HOVATEN NVARCHAR(255),
	--GIAY_KHAISINH_GIOITINH BIT,
	--GIAY_KHAISINH_NGAYSINH DATE,
	--GIAY_KHAISINH_DANTOC NVARCHAR(50),
	--GIAY_KHAISINH_QUOCTICH NVARCHAR(50),


	GIAY_KHAISINH_NOISINH NVARCHAR(255), --Ghép chuỗi từ nơi sinh trong hồ sơ đăng kí

	

	CHA_ID INT,
	--GIAY_KHAISINH_CHA_HOVATEN NVARCHAR(255),
	--GIAY_KHAISINH_CHA_DANTOC NVARCHAR(50),
	--GIAY_KHAISINH_CHA_QUOCTICH NVARCHAR(50),

	ME_ID INT,
	--GIAY_KHAISINH_ME_HOVATEN NVARCHAR(255),
	--GIAY_KHAISINH_ME_DANTOC NVARCHAR(50),
	--GIAY_KHAISINH_ME_QUOCTICH NVARCHAR(50),

	GIAY_KHAISINH_NGAY_KI DATETIME,

	--Người dùng ID
	GIAY_KHAISINH_NGUOI_XULY INT,
	GIAY_KHAISINH_NGUOI_KI INT,
)

--Kết hôn
CREATE TABLE GIAY_KETHON(
	
	GIAY_KETHON_ID INT IDENTITY(1,1),
		 
	GIAY_KETHON_MA NVARCHAR(10),
	GIAY_KETHON_SOQUYEN NVARCHAR(10),
	
	HOSO_DANGKY_ID INT,

	VO_ID INT,
	--KETHON_V_HOTEN NVARCHAR(100),
	--KETHON_V_NGAYSINH DATE,
	--KETHON_V_DANTOC NVARCHAR(50),
	--KETHON_V_QUOCTICH NVARCHAR(50),

	--KETHON_V_THANHPHO NVARCHAR(100),
	--KETHON_V_QUAN NVARCHAR(100),
	--KETHON_V_PHUONG NVARCHAR(100),
	--KETHON_V_DIACHI NVARCHAR(255),

	--KETHON_V_CMND NVARCHAR(12),
	--KETHON_V_CMND_NGAYCAP DATE,
	--KETHON_V_CMND_NOICAP NVARCHAR(20),
	
	CHONG_ID INT,
	--KETHON_C_HOTEN NVARCHAR(100),
	--KETHON_C_NGAYSINH DATE,
	--KETHON_C_DANTOC NVARCHAR(50),
	--KETHON_C_QUOCTICH NVARCHAR(50),

	--KETHON_C_THANHPHO NVARCHAR(100),
	--KETHON_C_QUAN NVARCHAR(100),
	--KETHON_C_PHUONG NVARCHAR(100),
	--KETHON_C_DIACHI NVARCHAR(255),

	--KETHON_C_CMND NVARCHAR(12),
	--KETHON_C_CMND_NGAYCAP DATE,
	--KETHON_C_CMND_NOICAP NVARCHAR(20),
	
	GIAY_KETHON_NGAY_KI DATETIME,

	--Người dùng ID
	GIAY_KETHON_NGUOI_XULY INT,
	GIAY_KETHON_NGUOI_KI INT,
	
)


--Chứng tử
CREATE TABLE GIAY_CHUNGTU(

	GIAY_CHUNGTU_ID INT IDENTITY(1,1),
		 
	GIAY_CHUNGTU_MA NVARCHAR(10),
	GIAY_CHUNGTU_SOQUYEN NVARCHAR(10),

	HOSO_DANGKY_ID INT,

	CONGDAN_ID INT,
	--GIAY_CHUNGTU_HOVATEN NVARCHAR(100),
	--GIAY_CHUNGTU_NGAYSINH DATE,
	--GIAY_CHUNGTU_GIOITINH BIT,
	--GIAY_CHUNGTU_DANTOC NVARCHAR(50),
	--GIAY_CHUNGTU_QUOCTICH NVARCHAR(50),

	--GIAY_CHUNGTU_THANHPHO NVARCHAR(100),
	--GIAY_CHUNGTU_QUAN NVARCHAR(100),
	--GIAY_CHUNGTU_PHUONG NVARCHAR(100),
	--GIAY_CHUNGTU_DIACHI NVARCHAR(255),

	--GIAY_CHUNGTU_CMND NVARCHAR(12),
	--GIAY_CHUNGTU_NGAYCAPCMND DATE,
	--GIAY_CHUNGTU_NOICAPCMND NVARCHAR(20),
	
	GIAY_CHUNGTU_NGAYMAT DATETIME,
	GIAY_CHUNGTU_NOIMAT NVARCHAR(255),
	GIAY_CHUNGTU_NGUYENNHAN NVARCHAR(255),

	GIAY_CHUNGTU_NGAY_KI DATETIME,

	--Người dùng ID
	GIAY_CHUNGTU_NGUOI_XULY INT,
	GIAY_CHUNGTU_NGUOI_KI INT,

)
ALTER TABLE GIAY_KHAISINH
ADD CONSTRAINT FK_GIAY_KHAISINH_CON_CONGDAN FOREIGN KEY (CONGDAN_ID) REFERENCES CONGDAN(CONGDAN_ID)
GO
ALTER TABLE GIAY_KHAISINH
ADD CONSTRAINT FK_GIAY_KHAISINH_ME_CONGDAN FOREIGN KEY (ME_ID) REFERENCES CONGDAN(CONGDAN_ID)
GO
ALTER TABLE GIAY_KHAISINH
ADD CONSTRAINT FK_GIAY_KHAISINH_CHA_CONGDAN FOREIGN KEY (CHA_ID) REFERENCES CONGDAN(CONGDAN_ID)
GO
ALTER TABLE GIAY_KHAISINH
ADD CONSTRAINT PK_GIAY_KHAISINH PRIMARY KEY (GIAY_KHAISINH_ID)
ALTER TABLE GIAY_KHAISINH
ADD CONSTRAINT FK_GIAY_KHAISINH_XULY FOREIGN KEY (GIAY_KHAISINH_NGUOI_XULY) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO
ALTER TABLE GIAY_KHAISINH
ADD CONSTRAINT FK_GIAY_KHAISINH_KI FOREIGN KEY (GIAY_KHAISINH_NGUOI_KI) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO

ALTER TABLE GIAY_KETHON
ADD CONSTRAINT FK_GIAY_KETHON_V_CONGDAN FOREIGN KEY (VO_ID) REFERENCES CONGDAN(CONGDAN_ID)
GO
ALTER TABLE GIAY_KETHON
ADD CONSTRAINT FK_GIAY_KETHON_C_CONGDAN FOREIGN KEY (CHONG_ID) REFERENCES CONGDAN(CONGDAN_ID)
GO
ALTER TABLE GIAY_KETHON
ADD CONSTRAINT PK_GIAY_KETHON PRIMARY KEY (GIAY_KETHON_ID)
GO
ALTER TABLE GIAY_KETHON
ADD CONSTRAINT FK_GIAY_KETHON_XULY FOREIGN KEY (GIAY_KETHON_NGUOI_XULY) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO
ALTER TABLE GIAY_KETHON
ADD CONSTRAINT FK_GIAY_KETHON_KI FOREIGN KEY (GIAY_KETHON_NGUOI_KI) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO

ALTER TABLE GIAY_CHUNGTU
ADD CONSTRAINT FK_GIAY_CHUNGTU_CONGDAN FOREIGN KEY (CONGDAN_ID) REFERENCES CONGDAN(CONGDAN_ID)
GO
ALTER TABLE GIAY_CHUNGTU
ADD CONSTRAINT PK_GIAY_CHUNGTU PRIMARY KEY (GIAY_CHUNGTU_ID)
GO
ALTER TABLE GIAY_CHUNGTU
ADD CONSTRAINT FK_GIAY_CHUNGTU_XULY FOREIGN KEY (GIAY_CHUNGTU_NGUOI_XULY) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO
ALTER TABLE GIAY_CHUNGTU
ADD CONSTRAINT FK_GIAY_CHUNGTU_KI FOREIGN KEY (GIAY_CHUNGTU_NGUOI_KI) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
GO



CREATE TABLE PHANHOI(
	PHANHOI_ID INT IDENTITY(1,1),
	PHANHOI_CONGDAN_TEN NVARCHAR(255),
	PHANHOI_EMAIL NVARCHAR(100),
	PHANHOI_SDT NVARCHAR(20),
	NGUOIDUNG_ID INT,
	PHANHOI_NOIDUNG NVARCHAR(500),
)
ALTER TABLE PHANHOI
ADD CONSTRAINT PK_PHANHOI PRIMARY KEY (PHANHOI_ID)
ALTER TABLE PHANHOI
ADD CONSTRAINT FK_PHANHOI_NGUOIDUNG FOREIGN KEY (NGUOIDUNG_ID) REFERENCES NGUOIDUNG(NGUOIDUNG_ID)
ALTER TABLE PHANHOI
ADD HOSO_DANGKY_ID INT
ALTER TABLE PHANHOI
ADD CONSTRAINT FK_PHANHOI_HOSO_DANGKY FOREIGN KEY (HOSO_DANGKY_ID) REFERENCES HOSO_DANGKY(HOSO_DANGKY_ID)

--ALTER TABLE GIAY_KHAISINH
--ADD LOAI_GIAYTO_ID INT
--ALTER TABLE GIAY_KHAISINH
--ADD CONSTRAINT FK_GIAY_KHAISINH_LOAI_GIAYTO FOREIGN KEY (LOAI_GIAYTO_ID) REFERENCES LOAI_GIAYTO(LOAI_GIAYTO_ID)

--ALTER TABLE GIAY_KETHON
--ADD LOAI_GIAYTO_ID INT
--ALTER TABLE GIAY_KETHON
--ADD CONSTRAINT FK_GIAY_KETHON_LOAI_GIAYTO FOREIGN KEY (LOAI_GIAYTO_ID) REFERENCES LOAI_GIAYTO(LOAI_GIAYTO_ID)

--ALTER TABLE GIAY_CHUNGTU
--ADD LOAI_GIAYTO_ID INT
--ALTER TABLE GIAY_CHUNGTU
--ADD CONSTRAINT FK_GIAY_CHUNGTU_LOAI_GIAYTO FOREIGN KEY (LOAI_GIAYTO_ID) REFERENCES LOAI_GIAYTO(LOAI_GIAYTO_ID)
--Nhập dữ liệu
------------------------------------------------------------------------------------------
--Dân tộc
------------------------------------------------------------------------------------------
INSERT INTO DANTOC VALUES (N'Kinh')
INSERT INTO DANTOC VALUES (N'Tày')
INSERT INTO DANTOC VALUES (N'Thái')
INSERT INTO DANTOC VALUES (N'Mường')
INSERT INTO DANTOC VALUES (N'Khmer')
INSERT INTO DANTOC VALUES (N'Hoa')
INSERT INTO DANTOC VALUES (N'Nùng')
INSERT INTO DANTOC VALUES (N'H''Mông')
INSERT INTO DANTOC VALUES (N'Dao')
INSERT INTO DANTOC VALUES (N'Gia Rai')
INSERT INTO DANTOC VALUES (N'Ê Đê')
INSERT INTO DANTOC VALUES (N'Ba Na')
INSERT INTO DANTOC VALUES (N'Sán Chay')
INSERT INTO DANTOC VALUES (N'Chăm')
INSERT INTO DANTOC VALUES (N'Cơ Ho')
INSERT INTO DANTOC VALUES (N'Xơ Đăng')
INSERT INTO DANTOC VALUES (N'Sán Dìu')
INSERT INTO DANTOC VALUES (N'Hrê')
INSERT INTO DANTOC VALUES (N'Ra Glai')
INSERT INTO DANTOC VALUES (N'Mnông')
INSERT INTO DANTOC VALUES (N'Thổ')
INSERT INTO DANTOC VALUES (N'Xtiêng')
INSERT INTO DANTOC VALUES (N'Khơ mú')
INSERT INTO DANTOC VALUES (N'Bru - Vân Kiều')
INSERT INTO DANTOC VALUES (N'Cơ Tu')
INSERT INTO DANTOC VALUES (N'Giáy')
INSERT INTO DANTOC VALUES (N'Tà Ôi')
INSERT INTO DANTOC VALUES (N'Mạ')
INSERT INTO DANTOC VALUES (N'Giẻ-Triêng')
INSERT INTO DANTOC VALUES (N'Co')
INSERT INTO DANTOC VALUES (N'Chơ Ro')
INSERT INTO DANTOC VALUES (N'Xinh Mun')
INSERT INTO DANTOC VALUES (N'Hà Nhì')
INSERT INTO DANTOC VALUES (N'Chu Ru')
INSERT INTO DANTOC VALUES (N'Lào')
INSERT INTO DANTOC VALUES (N'La Chí')
INSERT INTO DANTOC VALUES (N'Kháng')
INSERT INTO DANTOC VALUES (N'Phù Lá')
INSERT INTO DANTOC VALUES (N'La Hủ')
INSERT INTO DANTOC VALUES (N'La Ha')
INSERT INTO DANTOC VALUES (N'Pà Thẻn')
INSERT INTO DANTOC VALUES (N'Lự')
INSERT INTO DANTOC VALUES (N'Ngái')
INSERT INTO DANTOC VALUES (N'Chứt')
INSERT INTO DANTOC VALUES (N'Lô Lô')
INSERT INTO DANTOC VALUES (N'Mảng')
INSERT INTO DANTOC VALUES (N'Cơ Lao')
INSERT INTO DANTOC VALUES (N'Bố Y')
INSERT INTO DANTOC VALUES (N'Cống')
INSERT INTO DANTOC VALUES (N'Si La')
INSERT INTO DANTOC VALUES (N'Pu Péo')
INSERT INTO DANTOC VALUES (N'Rơ Măm')
INSERT INTO DANTOC VALUES (N'Brâu')
INSERT INTO DANTOC VALUES (N'Ơ Đu')
------------------------------------------------------------------------------------------
--Quốc gia
------------------------------------------------------------------------------------------
INSERT INTO QUOCGIA VALUES (N'Việt Nam')
------------------------------------------------------------------------------------------

--Hình thức đăng kí
------------------------------------------------------------------------------------------
INSERT INTO HINHTHUC_DANGKY VALUES(N'Đăng kí hộ tịch trong nước')
INSERT INTO HINHTHUC_DANGKY VALUES(N'Đăng kí hộ tịch có yếu tố nước ngoài')

--Loại giấy tờ
INSERT INTO LOAI_GIAYTO VALUES(N'Khai sinh')
INSERT INTO LOAI_GIAYTO VALUES(N'Kết hôn')
INSERT INTO LOAI_GIAYTO VALUES(N'Chứng tử')
INSERT INTO LOAI_GIAYTO VALUES(N'Giám hộ')
INSERT INTO LOAI_GIAYTO VALUES(N'Ly hôn')
INSERT INTO LOAI_GIAYTO VALUES(N'Nhận con nuôi')
INSERT INTO LOAI_GIAYTO VALUES(N'Nhận quan hệ')
INSERT INTO LOAI_GIAYTO VALUES(N'Bản sao')