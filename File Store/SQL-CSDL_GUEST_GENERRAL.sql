﻿INSERT INTO HINHTHUC_DANGKY
VALUES (N'Đăng ký trong nước');
INSERT INTO HINHTHUC_DANGKY
VALUES (N'Đăng ký có yếu tổ nước ngoài');

INSERT INTO LOAI_GIAYTO
VALUES (1,N'Khai Sinh');
INSERT INTO LOAI_GIAYTO
VALUES (N'Kết Hôn');
INSERT INTO LOAI_GIAYTO
VALUES (N'Khai Tử');
INSERT INTO LOAI_GIAYTO
VALUES (N'Trích Lục Hộ Tịch');

INSERT INTO COQUAN VALUES();

INSERT INTO TRANGTHAI_XULI VALUES(N'Đã xử lý');
INSERT INTO TRANGTHAI_XULI VALUES (N'Chưa xử lý')


--- Quy trình nộp hồ sơ: 
DROP PROC ADD_HOSO_DANGKY_KHAISINH
CREATE PROC ADD_HOSO_DANGKY_KHAISINH(@TrangThai int
									,@CoQuanID int
									,@LoaiDangKyID int
									,@NYC_TEN	nvarchar(100)
									,@NYC_CMND	nvarchar(12)
									,@NYC_CMND_NGAYCAP	date
									,@NYC_CMND_NOICAP	nvarchar(255)
									,@NYC_QUOCTICH	nvarchar(50)
									,@NYC_THANHPHO	nvarchar(100)
									,@NYC_QUAN	nvarchar(100)
									,@NYC_PHUONG	nvarchar(100)
									,@NYC_DIACHI	nvarchar(255)
									,@NYC_QUANHE	nvarchar(255)
									,@KS_TEN	nvarchar(255)
									,@KS_GIOITINH	bit
									,@KS_NGAYSINH	date
									,@KS_DANTOC	nvarchar(50)
									,@KS_QUOCTICH	nvarchar(50)
									,@KS_QUEQUAN_THANHPHO	nvarchar(50)
									,@KS_QUEQUAN_QUAN	nvarchar(50)
									,@KS_QUEQUAN_PHUONG	nvarchar(50)
									,@KS_QUEQUAN_DIACHI	nvarchar(50)
									,@KS_NOISINH	nvarchar(50)
									,@KS_QUOCGIA_NOISINH	nvarchar(50)
									,@KS_THANHPHO_NOISINH	nvarchar(50)
									,@KS_QUAN_NOISINH	nvarchar(50)
									,@KS_PHUONG_NOISINH	nvarchar(50)
									,@KS_DIACHI_NOISINH	nvarchar(50)
									,@ME_TEN	nvarchar(255)
									,@ME_NGAYSINH	date
									,@ME_CMND	nvarchar(12)
									,@ME_CMND_NGAYCAP	date
									,@ME_CMND_NOICAP	nvarchar(255)
									,@ME_DANTOC	nvarchar(50)
									,@ME_QUOCTICH	nvarchar(50)
									,@ME_THANHPHO	nvarchar(100)
									,@ME_QUAN	nvarchar(100)
									,@ME_PHUONG	nvarchar(100)
									,@ME_DIACHI	nvarchar(255)
									,@CHA_TEN	nvarchar(255)
									,@CHA_NGAYSINH	date
									,@CHA_CMND	nvarchar(12)
									,@CHA_CMND_NGAYCAP	date
									,@CHA_CMND_NOICAP	nvarchar(255)
									,@CHA_DANTOC	nvarchar(50)
									,@CHA_QUOCTICH	nvarchar(50)
									,@CHA_THANHPHO	nvarchar(100)
									,@CHA_QUAN	nvarchar(100)
									,@CHA_PHUONG	nvarchar(100)
									,@CHA_DIACHI	nvarchar(255)
									,@FILE_GIAYCHUNGSINH	nvarchar(255))
AS
BEGIN
  --Gọi Procdure Add hồ sơ đăng ký để thêm hồ sơ đăng ký
   EXEC PROC_ADD_HOSO_DANGKY @TrangThai,@CoQuanID,@LoaiDangKyID;
   DECLARE @HSDK_ID int;
  --Lấy giá trị mà vừa mới add vào hồ sơ đăng ký. Để lưu vào hồ sơ chi tiết
   SELECT @HSDK_ID = IDENT_CURRENT('HOSO_DANGKY');

   INSERT INTO DANGKY_KHAISINH 
   VALUES ( @HSDK_ID
			,@NYC_TEN
			,@NYC_CMND
			,@NYC_CMND_NGAYCAP
			,@NYC_CMND_NOICAP
			,@NYC_QUOCTICH
			,@NYC_THANHPHO
			,@NYC_QUAN
			,@NYC_PHUONG
			,@NYC_DIACHI
			,@NYC_QUANHE
			,@KS_TEN
			,@KS_GIOITINH
			,@KS_NGAYSINH
			,@KS_DANTOC
			,@KS_QUOCTICH
			,@KS_QUEQUAN_THANHPHO
			,@KS_QUEQUAN_QUAN
			,@KS_QUEQUAN_PHUONG
			,@KS_QUEQUAN_DIACHI
			,@KS_NOISINH
			,@KS_QUOCGIA_NOISINH
			,@KS_THANHPHO_NOISINH
			,@KS_QUAN_NOISINH
			,@KS_PHUONG_NOISINH
			,@KS_DIACHI_NOISINH
			,@ME_TEN
			,@ME_NGAYSINH
			,@ME_CMND
			,@ME_CMND_NGAYCAP
			,@ME_CMND_NOICAP
			,@ME_DANTOC
			,@ME_QUOCTICH
			,@ME_THANHPHO
			,@ME_QUAN
			,@ME_PHUONG
			,@ME_DIACHI
			,@CHA_TEN
			,@CHA_NGAYSINH
			,@CHA_CMND
			,@CHA_CMND_NGAYCAP
			,@CHA_CMND_NOICAP
			,@CHA_DANTOC
			,@CHA_QUOCTICH
			,@CHA_THANHPHO
			,@CHA_QUAN
			,@CHA_PHUONG
			,@CHA_DIACHI
			,@FILE_GIAYCHUNGSINH
		)
    
END
GO
EXEC ADD_HOSO_DANGKY_KHAISINH 2,1,1
			,N'Phan Văn Phước Thịnh'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,N'Cha ruộc'
			,N'Huỳnh Lê Hữu Hưng'
			,N'1'
			,'20121210'
			,'Kinh'
			,'Việt Nam'
			,N'TP HCM'
			,N'QUẬN 8'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,N'Bệnh viện Quận 3'
			,N'Việt Nam'
			,N'TP.HCM'
			,N'Quận 3'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,N'Nguyễn Thị A'
			,'20121210'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Kinh'
			,N'Việt Nam'
			,N'TP.HCM'
			,N'Quận 3'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,N'Phan Văn Phước Thịnh'
			,'20121210'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Kinh'
			,N'Việt Nam'
			,N'TP.HCM'
			,N'Quận 3'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,'6266.png';

ALTER TABLE DANGKY_KHAISINH
DROP COLUMN KHAISINH_QUEQUAN_THANHPHO

INSERT INTO DANGKY_KHAISINH
	VALUES( 3
			,N'Phan Văn Phước Thịnh'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,N'Cha ruộc'
			,N'Huỳnh Lê Hữu Hưng'
			,N'1'
			,'20121210'
			,'Kinh'
			,'Việt Nam'
			,N'TP HCM'
			,N'QUẬN 8'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,N'Bệnh viện Quận 3'
			,N'Việt Nam'
			,N'TP.HCM'
			,N'Quận 3'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,N'Nguyễn Thị A'
			,'20121210'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Kinh'
			,N'Việt Nam'
			,N'TP.HCM'
			,N'Quận 3'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,N'Phan Văn Phước Thịnh'
			,'20121210'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Kinh'
			,N'Việt Nam'
			,N'TP.HCM'
			,N'Quận 3'
			,N'Phường 3'
			,N'Số 234, đường phạm ngủ lão'
			,'6266.png'
);


DROP PROC FUNC_ADD_HOSO_DANGKY
CREATE PROC PROC_ADD_HOSO_DANGKY (@TrangThai int, @CoQuanID int, @LoaiDangKyID int) 
AS		
BEGIN
	DECLARE @NGAYDK DATETIME, @NGAYHETHAN DATETIME;
	SELECT @NGAYDK= GETDATE();	
	SELECT @NGAYHETHAN = DATEADD(day, 2, @NGAYDK);

	INSERT INTO dbo.HOSO_DANGKY (TRANGTHAI_XULI_ID, HOSO_DANGKY_NGAY_DANGKY, HOSO_DANGKY_NGAY_HETHAN, COQUAN_ID, LOAI_DANGKY_ID)							   
	VALUES(@TrangThai,@NGAYDK,@NGAYHETHAN,@CoQuanID,@LoaiDangKyID );
END
GO

EXEC PROC_ADD_HOSO_DANGKY 1,1,1

-------------------------------Đăng ký kết hôn --------------
DROP PROC ADD_HOSO_DANGKY_KETHON
CREATE PROC ADD_HOSO_DANGKY_KETHON(@TrangThai int
									,@CoQuanID int
									,@LoaiDangKyID int
									,@KH_V_HOTEN	nvarchar(255)
									,@KH_V_NGAYSINH	date
									,@KH_V_DANTOC	nvarchar(50)
									,@KH_V_CMND	nvarchar(12)
									,@KH_V_CMND_NGAYCAP	date
									,@KH_V_CMND_NOICAP	nvarchar(255)
									,@KH_V_QUOCTICH	nvarchar(50)
									,@KH_V_THANHPHO	nvarchar(100)
									,@KH_V_QUAN	nvarchar(100)
									,@KH_V_PHUONG	nvarchar(100)
									,@KH_V_DIACHI	nvarchar(255)
									,@KH_V_LAN	int
									,@KH_FILE_V	nvarchar(255)
									,@KH_C_HOTEN	nvarchar(255)
									,@KH_C_NGAYSINH	date
									,@KH_C_DANTOC	nvarchar(50)
									,@KH_C_CMND	nvarchar(12)
									,@KH_C_CMND_NGAYCAP	date
									,@KH_C_CMND_NOICAP	nvarchar(255)
									,@KH_C_QUOCTICH	nvarchar(50)
									,@KH_C_THANHPHO	nvarchar(100)
									,@KH_C_QUAN	nvarchar(100)
									,@KH_C_PHUONG	nvarchar(100)
									,@KH_C_DIACHI	nvarchar(255)
									,@KH_C_LAN	int
									,@KH_FILE_C	nvarchar(255))
AS
BEGIN
  --Gọi Procdure Add hồ sơ đăng ký để thêm hồ sơ đăng ký
   EXEC PROC_ADD_HOSO_DANGKY @TrangThai,@CoQuanID,@LoaiDangKyID;
   DECLARE @HSDK_ID int;
  --Lấy giá trị mà vừa mới add vào hồ sơ đăng ký. Để lưu vào hồ sơ chi tiết
   SELECT @HSDK_ID = IDENT_CURRENT('HOSO_DANGKY');

   INSERT INTO DANGKY_KETHON
   VALUES ( @HSDK_ID
			,@KH_V_HOTEN
			,@KH_V_NGAYSINH
			,@KH_V_DANTOC
			,@KH_V_CMND
			,@KH_V_CMND_NGAYCAP
			,@KH_V_CMND_NOICAP
			,@KH_V_QUOCTICH
			,@KH_V_THANHPHO
			,@KH_V_QUAN
			,@KH_V_PHUONG
			,@KH_V_DIACHI
			,@KH_V_LAN
			,@KH_FILE_V
			,@KH_C_HOTEN
			,@KH_C_NGAYSINH
			,@KH_C_DANTOC
			,@KH_C_CMND
			,@KH_C_CMND_NGAYCAP
			,@KH_C_CMND_NOICAP
			,@KH_C_QUOCTICH
			,@KH_C_THANHPHO
			,@KH_C_QUAN
			,@KH_C_PHUONG
			,@KH_C_DIACHI
			,@KH_C_LAN
			,@KH_FILE_C
		)
    
END
GO
EXEC ADD_HOSO_DANGKY_KETHON 2,1,2
			,N'Phan Thị C'
			,'20121210'
			,'Kinh'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,1
			,'6266.png'
			,N'Phan Văn A'
			,'20121210'
			,'Kinh'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,1
			,'6266.png';




-------------------------------Đăng ký Chứng Tử --------------
DROP PROC ADD_HOSO_DANGKY_CHUNGTU
CREATE PROC ADD_HOSO_DANGKY_CHUNGTU(@TrangThai int
									,@CoQuanID int
									,@LoaiDangKyID int
									,@NYC_TEN	nvarchar(255)
									,@NYC_CMND	nvarchar(12)
									,@NYC_CMND_NGAYCAP	date
									,@NYC_CMND_NOICAP	nvarchar(255)
									,@NYC_QUOCTICH	nvarchar(50)
									,@NYC_THANHPHO	nvarchar(100)
									,@NYC_QUAN	nvarchar(100)
									,@NYC_PHUONG	nvarchar(100)
									,@NYC_DIACHI	nvarchar(255)
									,@NYC_QUANHE	nvarchar(255)
									,@KT_TEN	nvarchar(100)
									,@KT_NGAYSINH	date
									,@KT_GIOITINH	bit
									,@KT_DANTOC	nvarchar(50)
									,@KT_CMND	nvarchar(12)
									,@KT_CMND_NGAYCAP	date
									,@KT_CMND_NOICAP	nvarchar(255)
									,@KT_QUOCTICH	nvarchar(50)
									,@KT_THANHPHO	nvarchar(100)
									,@KT_QUAN	nvarchar(100)
									,@KT_PHUONG	nvarchar(100)
									,@KT_DIACHI	nvarchar(255)
									,@KT_NGUYENNHAN	nvarchar(255)
									,@KT_NGAYMAT	date
									,@KT_THOIGIAN	time(7)
									,@KT_NOIMAT_QUOCGIA	nvarchar(255)
									,@KT_NOIMAT_THANHPHO	nvarchar(255)
									,@KT_NOIMAT_QUAN	nvarchar(255)
									,@KT_NOIMAT_PHUONG	nvarchar(255)
									,@KT_NOIMAT_DIACHI	nvarchar(255)
									,@FILE_BAOTU_TEN	nvarchar(255))
AS
BEGIN
  --Gọi Procdure Add hồ sơ đăng ký để thêm hồ sơ đăng ký
   EXEC PROC_ADD_HOSO_DANGKY @TrangThai,@CoQuanID,@LoaiDangKyID;
   DECLARE @HSDK_ID int;
  --Lấy giá trị mà vừa mới add vào hồ sơ đăng ký. Để lưu vào hồ sơ chi tiết
   SELECT @HSDK_ID = IDENT_CURRENT('HOSO_DANGKY');

   INSERT INTO DANGKY_CHUNGTU
   VALUES ( @HSDK_ID
			,@NYC_TEN
			,@NYC_CMND
			,@NYC_CMND_NGAYCAP
			,@NYC_CMND_NOICAP
			,@NYC_QUOCTICH
			,@NYC_THANHPHO
			,@NYC_QUAN
			,@NYC_PHUONG
			,@NYC_DIACHI
			,@NYC_QUANHE
			,@KT_TEN
			,@KT_NGAYSINH
			,@KT_GIOITINH
			,@KT_DANTOC
			,@KT_CMND
			,@KT_CMND_NGAYCAP
			,@KT_CMND_NOICAP
			,@KT_QUOCTICH
			,@KT_THANHPHO
			,@KT_QUAN
			,@KT_PHUONG
			,@KT_DIACHI
			,@KT_NGUYENNHAN
			,@KT_NGAYMAT
			,@KT_THOIGIAN
			,@KT_NOIMAT_QUOCGIA
			,@KT_NOIMAT_THANHPHO
			,@KT_NOIMAT_QUAN
			,@KT_NOIMAT_PHUONG
			,@KT_NOIMAT_DIACHI
			,@FILE_BAOTU_TEN

		)
    
END
GO
EXEC ADD_HOSO_DANGKY_CHUNGTU 2,1,2
			,N'Phan Thị C'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,N'Cháu'
			,N'Phan Thị C'
			,'20121210'
			,1
			,N'Kinh'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,N'Bệnh Già'
			,'20121210'
			,'08:00:01'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,'6266.png'



			-------------------------------Đăng ký Trích lục --------------
DROP PROC ADD_HOSO_DANGKY_TRICHLUC
CREATE PROC ADD_HOSO_DANGKY_TRICHLUC(@TrangThai int
									,@CoQuanID int
									,@LoaiDangKyID int
									,@NYC_TEN	nvarchar(255)
									,@NYC_CMND	nvarchar(12)
									,@NYC_CMND_NGAYCAP	date
									,@NYC_CMND_NOICAP	nvarchar(255)
									,@NYC_QUOCTICH	nvarchar(50)
									,@NYC_THANHPHO	nvarchar(100)
									,@NYC_QUAN	nvarchar(100)
									,@NYC_PHUONG	nvarchar(100)
									,@NYC_DIACHI	nvarchar(255)
									,@NYC_QUANHE	nvarchar(255)
									,@BS_TEN	nvarchar(255)
									,@BS_NGAYSINH	date
									,@BS_GIOITINH	bit
									,@BS_QUOCTICH	nvarchar(50)
									,@BS_THANHPHO	nvarchar(100)
									,@BS_QUAN	nvarchar(100)
									,@BS_PHUONG	nvarchar(100)
									,@BS_DIACHI	nvarchar(255)
									,@LOAI_GIAYTO_ID_TL	int
									,@BS_SOQUYEN	int
									,@BS_SO	int
									,@BS_SOLUONG	int)

AS
BEGIN
  --Gọi Procdure Add hồ sơ đăng ký để thêm hồ sơ đăng ký
   EXEC PROC_ADD_HOSO_DANGKY @TrangThai,@CoQuanID,@LoaiDangKyID;
   DECLARE @HSDK_ID int;
  --Lấy giá trị mà vừa mới add vào hồ sơ đăng ký. Để lưu vào hồ sơ chi tiết
   SELECT @HSDK_ID = IDENT_CURRENT('HOSO_DANGKY');

   INSERT INTO DANGKY_TRICHLUC
   VALUES ( @HSDK_ID
			,@NYC_TEN
			,@NYC_CMND
			,@NYC_CMND_NGAYCAP
			,@NYC_CMND_NOICAP
			,@NYC_QUOCTICH
			,@NYC_THANHPHO
			,@NYC_QUAN
			,@NYC_PHUONG
			,@NYC_DIACHI
			,@NYC_QUANHE
			,@BS_TEN
			,@BS_NGAYSINH
			,@BS_GIOITINH
			,@BS_QUOCTICH
			,@BS_THANHPHO
			,@BS_QUAN
			,@BS_PHUONG
			,@BS_DIACHI
			,@LOAI_GIAYTO_ID_TL
			,@BS_SOQUYEN
			,@BS_SO
			,@BS_SOLUONG
		)
    
END
GO
EXEC ADD_HOSO_DANGKY_TRICHLUC 2,1,2
			,N'Phan Thị C'
			,'321564307'
			,'20121210'
			,N'Công An Tỉnh Bến Tre'
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,N'Cháu'
			,N'Phan Thị C'
			,'20121210'
			,1
			,N'Việt Nam'
			,N'Bến Tre'
			,N'Mỏ Cày Nam'
			,N'Định Thủy'
			,N'Số 21, Ấp Thanh Thủy'
			,2
			,001
			,12
			,3



DROP VIEW TRACUUHOSODANGKY
CREATE VIEW XEMHOSODANGKY AS
SELECT *
FROM HOSO_DANGKY
WHERE HOSO_DANGKY.TRANGTHAI_XULI_ID=2;


CREATE FUNCTION TRACUUHOSO(@MaHoSoDangKy int)
RETURNS @tblKetQua Table(HoSoDK_ID int
						 ,LoaiGiayDangKy nvarchar(255)
						 ,NguoiYeuCau nvarchar(100)
						 ,NgayYeuCau date
						 ,TrangThai nvarchar(50)
						 )
AS 
BEGIN
	DECLARE @LOAI_DK_ID int =0;

	SELECT @LOAI_DK_ID = HOSO_DANGKY.LOAI_DANGKY_ID  FROM HOSO_DANGKY WHERE HOSO_DANGKY.HOSO_DANGKY_ID = 10
    IF @LOAI_DK_ID = 0
	PRINT(N'KHÔNG TÌM THẤY HỒ SƠ')
	ELSE
		IF @LOAI_DK_ID = 1 --Đăng ký khai sinh
		PRINT(N'Đăng ký khai sinh')
		ELSE
		    IF @LOAI_DK_ID=3 --Đăng Ký Kết hôn
			PRINT(N'Đăng Ký Kết hôn')
			ELSE
		        IF @LOAI_DK_ID = 5 -- Đăng Ký Chứng tử
				PRINT(N'Đăng Ký Chứng tử')
				ELSE
				IF @LOAI_DK_ID = 7 --Đăng ký trích lục
				PRINT(N'Đăng ký trích lục')
END






