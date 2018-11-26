﻿--1) Procedures thêm người dùng -> Tạo userlogin -> Phân quyền
ALTER PROC PROC_THEM_NGUOIDUNG @MaCanBo nvarchar(20)
							  ,@HoVaTen nvarchar(255)
							  ,@NgaySinh Date
							  ,@Email nvarchar(50)
							  ,@sdt nvarchar(11)
							  ,@username nvarchar(50)
							  , @password nvarchar(20)
							  , @TrangThai int
							  , @quyen int
							  , @MaCoQUan int
AS
BEGIN

INSERT INTO NGUOIDUNG 
VALUES ( @MaCanBo
		,@HoVaTen 
		,@NgaySinh
		,@Email
		,@sdt
		,@username 
		, @password 
		, @TrangThai
		, @quyen 
		, @MaCoQUan
		)

EXEC PROC_ADD_ACCOUNT_LOGIN @username, @username, @quyen

END
GO

EXEC PROC_THEM_NGUOIDUNG 'CBNC006'
						 ,'Phan Huu Cau'
						 ,'2019/12/02'
						,'thinh@gmail.com'
						,'0971443983'
						,'CBNC006'
							,'CBNC006'
							  , 1
							  , 1
							  , 1


--2) Procedures Thêm account login when add user. Called at Proc PROC_THEM_NGUOIDUNG
ALTER PROC PROC_ADD_ACCOUNT_LOGIN @username nvarchar(50), @password nvarchar(50), @Quyen int
AS
BEGIN
	BEGIN TRANSACTION
	--ADD LOGIN AND USER
	DECLARE @SQLStringCreateLogin nvarchar(max)
	SET @SQLStringCreateLogin = 'CREATE LOGIN [' + @username + '] WITH PASSWORD = ''' + @Password + '''' + ', DEFAULT_DATABASE=[master] ,
								DEFAULT_LANGUAGE=[us_ENGLISH], CHECK_EXPIRATION=ON, CHECK_POLICY=ON;'
	exec (@SQLStringCreateLogin)

	DECLARE @SQLStringCreateUser nvarchar(max)
	SET @SQLStringCreateUser = 'CREATE USER [' + @username + '] FOR LOGIN [' + @username +']'

	exec (@SQLStringCreateUser)



	IF(@@ERROR <> 0)
	BEGIN
		RAISERROR(N'Có lỗi lúc tạo user login rồi',16,1)
		ROLLBACK TRANSACTION
		RETURN
	END

	DECLARE @Quyen_name nvarchar(50);

	SELECT @Quyen_name = ROLL_TEN FROM QUYEN_SUDUNG WHERE QUYEN_ID=@Quyen

	EXEC PROC_PHANQUYEN @username, @Quyen_name

	COMMIT TRANSACTION
END
GO


--3) PROC phân quyền theo mã quyền
CREATE PROC PROC_PHANQUYEN @username nvarchar(50), @chucnang nvarchar(50)
AS
BEGIN
	if(@chucnang='CANBOHOTICH')
	BEGIN
		EXEC sp_addrolemember 'CANBOHOTICH', @username
	END
	if(@chucnang='ADMINCOQUAN')
	BEGIN
		EXEC sp_addrolemember 'ADMINCOQUAN', @username
	END
END
GO

--PHAN QUYÊN CHO CÁC ROLLE
--Code phân quyền cho cán bộ hộ tịch 
--Phân quyền cho table
--1) Các loại giấy tờ
GRANT SELECT ON DANGKY_KHAISINH TO CANBOHOTICH
GRANT SELECT ON DANGKY_KETHON TO CANBOHOTICH
GRANT SELECT ON DANGKY_CHUNGTU TO CANBOHOTICH
GRANT SELECT ON DANGKY_TRICHLUC TO CANBOHOTICH
--3) Các bảng chuyên dụng
GRANT SELECT ON THANHPHO TO CANBOHOTICH
GRANT SELECT ON QUAN TO CANBOHOTICH
GRANT SELECT ON PHUONG TO CANBOHOTICH
GRANT SELECT ON DANTOC TO CANBOHOTICH
GRANT SELECT ON QUOCGIA TO CANBOHOTICH
--4) các ban phan loai giay to
GRANT SELECT ON LOAI_GIAYTO TO CANBOHOTICH
GRANT SELECT ON LOAI_DANGKY TO CANBOHOTICH
GRANT SELECT ON HINHTHUC_DANGKY TO CANBOHOTICH
GRANT SELECT ON TRANGTHAO_XULY TO CANBOHOTICH

--5) các bảng chuyên dụng dành cho cán bộ hộ tịch
GRANT SELECT,INSERT, UPDATE ON HOSO_DANGKY TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON GIAY_KHAISINH TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON GIAY_CHUNGTU TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON GIAY_KETHON TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON CONGDAN TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON PHANHOI TO CANBOHOTICH
GRANT SELECT,INSERT, UPDATE ON THONGBAO TO CANBOHOTICH

--Phân quyền cho các programing database
--1) Phân quyền cho các Store Procedures
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
GRANT EXEC ON GET_HOTICH_COQUAN  to CANBOHOTICH
GRANT EXEC ON Add_Giay_KhaiSinh to CANBOHOTICH
GRANT EXEC ON Add_Giay_Kethon to CANBOHOTICH
GRANT EXEC ON Add_Giay_Chungtu to CANBOHOTICH
GRANT EXEC ON TimKiem_HoTich to CANBOHOTICH
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
GRANT EXEC ON GET_HSDK_COQUAN to CANBOHOTICH
--2) Phân quyền cho các Fuction
GRANT SELECT ON GET_HOSO_DANGKY_KHAISINH to CANBOHOTICH
GRANT SELECT ON Get_Giay_KhaiSinh  to CANBOHOTICH
GRANT SELECT ON Get_Giay_KetHon  to CANBOHOTICH
GRANT SELECT ON Get_Giay_ChungTu  to CANBOHOTICH

--Code phân quyền cho Admin co quan
--Phân quyền cho table
--1) Các loại bảng chuyên dụng
GRANT SELECT,INSERT, UPDATE ON NGUOIDUNG TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON COQUAN TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON QUYEN_SUDUNG TO ADMINCOQUAN
--2) Các bảng dùng chung
GRANT SELECT,INSERT, UPDATE ON DANTOC TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON THANHPHO TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON QUAN TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON PHUONG TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON QUOCGIA TO ADMINCOQUAN

--4) các ban phan loai giay to
GRANT SELECT,INSERT, UPDATE ON LOAI_GIAYTO TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON LOAI_DANGKY TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON HINHTHUC_DANGKY TO ADMINCOQUAN
GRANT SELECT,INSERT, UPDATE ON TRANGTHAO_XULY TO ADMINCOQUAN

--Phân quyền cho các programing database
--1) Phân quyền cho các Store Procedures
GRANT EXEC ON PROC_THEM_NGUOIDUNG to ADMINCOQUAN
GRANT EXEC ON PROC_ADD_ACCOUNT_LOGIN to ADMINCOQUAN
GRANT EXEC ON PROC_PHANQUYEN to ADMINCOQUAN
--2) Phân quyền cho các Fuction
GRANT SELECT ON GET_NGUOIDUNG_TABLE to ADMINCOQUAN
--Phân quyền cho Store Procedure







GRANT EXEC ON name to user

--Phân quyền cho function
GRANT SELECT ON name to user
---Tao bảng quyền lưu trữ các Roll



CREATE FUNCTION GET_NGUOIDUNG_TABLE (@MaCoQuan int)
RETURNS @tableUser TABLE(HoVaTen nvarchar(255), MaCB nvarchar(20), email nvarchar(50), sdt nvarchar(11), chucvu nvarchar(255), quyen nvarchar(50), trangThai nvarchar(50) )
AS
BEGIN
    INSERT INTO @tableUser (HoVaTen,MaCB,email,sdt)
	SELECT NGUOIDUNG_HOVATEN, NGUOIDUNG_MACANBO, NGUOIDUNG_EMAIL, NGUOIDUNG_SDT
	FROM NGUOIDUNG
	WHERE COQUAN_ID = @MaCoQuan	
	RETURN	  
END

SELECT * FROM GET_NGUOIDUNG_TABLE(1)