<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>HOTICH.NET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--content-->
    <link rel="stylesheet" type="text/css" href="../styles/HAF.css">
    <link rel="stylesheet" type="text/css" href="../styles/giayKhaiSinh.css">
    <!--Library datetimepicker-->
    <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
    <!-- Include jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
    <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
    <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>

    <!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

    <!--Font Awesome (added because you use icons in your prepend/append)-->
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!--header and footer-->
</head>
<body>
   <!-- Start Header-->
    <header id="id-header" class="header">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="logo-text">
                        <p id="id-logo-text">HOTICH.NET</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- End Header-->

    <!--Start Content-->
    <div id="id-content" class="content-switch">
        <div class="container">
            <div class="row">
                <div class="header_location">
                        <p id="bannerCoQuan" class="location">SỞ TƯ PHÁP THÀNH PHỐ HỒ CHÍ MINH</p>
                        <p id="CoQuanCap2" class="locationCap2">UBND PHƯỜNG HIỆP PHÚ QUẬN 9</p>
                </div>
            </div>


            <div class="row">
                <!-- Setup 2000px for test amnition-->
                <div class="paper">
                    <div class="title">
                        <p>TỜ KHAI ĐĂNG KÝ GIẤY KHAI SINH</p>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <div class="col-12 col-sm-6 col-md-6">
                                        <p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI YÊU CẦU</p>
                                    </div>
                                   
                                </div>
                                <div class="content collapse in">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input type="text" class="form-control" id="HoTenYeuCau" onblur="validateHoTen(HoTenYeuCau)">
                                                <p class="error" id="error_HoTenYeuCau"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input type="text" class="form-control" id="CMNDYeuCau" onblur="validateCMND(CMNDYeuCau)">
                                                <p class="error" id="error_CMNDYeuCau"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input type="text" class="form-control" id="NoiCapCMNDYeuCau" onblur="validateRequired(NoiCapCMNDYeuCau)">
                                                <p class="error" id="error_NoiCapCMNDYeuCau"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input class="form-control" id="NgayCapCMNDYeuCau"
                                                                    onblur="validateNgayCap(NgayCapCMNDYeuCau)" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" />

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_NgayCapCMNDYeuCau"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ với người được khai sinh</label>
                                                <select class="form-control" id="NguoiYeuCau_QuanHe" onblur="validateRequired(NguoiYeuCau_QuanHe)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_QuanHe"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quan hệ khác </label>
                                                <input type="text" class="form-control" id="NguoiYeuCau_QuanHeKhac"
                                                    onblur="validateRequired(NguoiYeuCau_QuanHeKhac)">
                                                <p class="error" id="error_NguoiYeuCau_QuanHeKhac"></p>
                                            </div>
                                        </div>


                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select class="form-control" id="NguoiYeuCau_QuocTich" onblur="validateRequired(NguoiYeuCau_QuocTich)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_QuocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select class="form-control" id="NguoiYeuCau_Tinh" onblur="validateRequired(NguoiYeuCau_Tinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Tinh"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select class="form-control" id="NguoiYeuCau_Huyen" onblur="validateRequired(NguoiYeuCau_Huyen)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Huyen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select class="form-control" id="NguoiYeuCau_Phuong" onblur="validateRequired(NguoiYeuCau_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_NguoiYeuCau_Phuong"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="NguoiYeuCau_DiaChi" onblur="validateRequired(NguoiYeuCau_DiaChi)">
                                                <p class="error" id="error_NguoiYeuCau_DiaChi"></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <p>THÔNG TIN NGƯỜI ĐƯỢC KHAI SINH</p>
                                </div>
                                <div class="content ">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input type="text" class="form-control" id="KhaiSinh_HoVaTen" onblur="validateHoTen(KhaiSinh_HoVaTen)">
                                                <p class="error" id="error_KhaiSinh_HoVaTen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Giới tính</label><br>
                                                <div class="control-sex">
                                                    <input type="radio" name="gender" value="male" id="male" onblur="validateRadio(male, female)">
                                                    Nam
                                                    <input style="margin-left: 20px" type="radio" name="gender" id="female"
                                                        onblur="validateRadio(male, female)" value="female">Nữ
                                                </div>
                                                <p class="error" id="error_male"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày sinh</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input class="form-control" id="KhaiSinh_ngaySinh" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" onblur="validateNgayCap(KhaiSinh_ngaySinh)" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_KhaiSinh_ngaySinh"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Dân tộc</label>
                                                <select class="form-control" id="KhaiSinh_danToc" onblur="validateRequired(KhaiSinh_danToc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_danToc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-8">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select class="form-control" id="KhaiSinh_quocTich" onblur="validateRequired(KhaiSinh_quocTich)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_quocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select class="form-control" id="KhaiSinh_ThanhPho" onblur="validateRequired(KhaiSinh_ThanhPho)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_ThanhPho"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select class="form-control" id="KhaiSinh_Quan" onblur="validateRequired(KhaiSinh_Quan)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_Quan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select class="form-control" id="KhaiSinh_Phuong" onblur="validateRequired(KhaiSinh_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_Phuong"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="KhaiSinh_DiaChi" onblur="validateRequired(KhaiSinh_DiaChi)">
                                                <p class="error" id="error_KhaiSinh_DiaChi"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label for="">Cơ sở y tế sinh sản</label>
                                                <input type="text" class="form-control" id="KhaiSinh_CSSinh" onblur="validateRequired(KhaiSinh_CSSinh)">
                                                <p class="error" id="error_KhaiSinh_CSSinh"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label for="">Quốc gia </label>
                                                <select class="form-control" id="KhaiSinh_QuocGiaSinh" onblur="validateRequired(KhaiSinh_QuocGiaSinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_QuocGiaSinh"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select class="form-control" id="KhaiSinh_TPSinh" onblur="validateRequired(KhaiSinh_TPSinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_TPSinh"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select class="form-control" id="KhaiSinh_QuanSinh" onblur="validateRequired(KhaiSinh_QuanSinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_QuanSinh"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select class="form-control" id="KhaiSinh_PhuongSinh" onblur="validateRequired(KhaiSinh_PhuongSinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_KhaiSinh_PhuongSinh"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="KhaiSinh_DiaChiSinh" onblur="validateRequired(KhaiSinh_DiaChiSinh)">
                                            </div>
                                            <p class="error" id="error_KhaiSinh_DiaChiSinh"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                        <div class="col-12 col-sm-6 col-md-6">
                                                <p style="font-size: 18px;font-weight: bold">THÔNG TIN CỦA MẸ</p>
                                            </div>
                                            <div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
                                                <input type="checkbox" data-toggle="collapse" data-target="#ME" class="form-check-input"
                                                    id="nam_check_yeucau" style="bottom: 0px;">
                                                <label style="margin: auto">Không có</label>
                                            </div>
                                </div>
                                <div class="content collapse in" id="ME">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for=>Họ và Tên</label>
                                                <input type="text" class="form-control" id="Me_HoVaTen" onblur="validateHoTen(Me_HoVaTen)">
                                                <p class="error" id="error_Me_HoVaTen"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày sinh</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input class="form-control" id="Me_ngaySinh" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" type="text" onblur="validateRequired(Me_ngaySinh)" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_Me_ngaySinh"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Số CMND</label>
                                                <input type="text" class="form-control" id="Me_CMND" onblur="validateCMND(Me_CMND)">
                                            </div>
                                            <p class="error" id="error_Me_CMND"></p>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Nơi cấp</label>
                                                <input type="text" class="form-control" id="Me_NoiCap" onblur="validateRequired(Me_NoiCap)">
                                                <p class="error" id="error_Me_NoiCap"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Ngày cấp</label>
                                                <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                <div class="bootstrap-iso">
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="input-group">
                                                                <div class="input-group-addon">
                                                                    <i class="fa fa-calendar">
                                                                    </i>
                                                                </div>
                                                                <input class="form-control" id="Me_NgayCap" name="date"
                                                                    placeholder="Ngày/Tháng/Năm" onblur="validateNgayCap(Me_NgayCap)" type="text" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p class="error" id="error_Me_NgayCap"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Dân tộc</label>
                                                <select class="form-control" id="Me_DanToc" onblur="validateRequired(Me_DanToc)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_Me_DanToc"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quốc tịch </label>
                                                <select class="form-control" id="Me_QuocTich" onblur="validateRequired(Me_QuocTich)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_Me_QuocTich"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Tỉnh/TP</label>
                                                <select class="form-control" id="Me_Tinh" onblur="validateRequired(Me_Tinh)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_Me_Tinh" ></p>
                                            </div>
                                        </div> 
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Quận/Huyện</label>
                                                <select class="form-control" id="Me_Quan" onblur="validateRequired(Me_Quan)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_Me_Quan"></p>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-6 col-md-4">
                                            <div class="form-group">
                                                <label for="">Xã/Phường</label>
                                                <select class="form-control" id="Me_Phuong" onblur="validateRequired(Me_Phuong)">
                                                    <option></option>
                                                </select>
                                                <p class="error" id="error_Me_Phuong"></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <label for="">Địa chỉ chi tiết</label>
                                                <input type="text" class="form-control" id="Me_DiaChi" onblur="validateRequired(Me_DiaChi)">
                                                <p class="error" id="error_Me_DiaChi"></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                            <div class="container container-paper">
                                    <div class="part-content">
                                        <div class="title-part">
                                                <div class="col-12 col-sm-6 col-md-6">
                                                        <p style="font-size: 18px;font-weight: bold">THÔNG TIN CỦA CHA</p>
                                                    </div>
                                                    <div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
                                                        <input type="checkbox" data-toggle="collapse" data-target="#CHA" class="form-check-input"
                                                            id="nam_check_yeucau" style="bottom: 0px;">
                                                        <label style="margin: auto">Không có</label>
                                                    </div>
                                        </div>
                                        <div class="content collapse in" id="CHA">
                                            <div class="row">
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for=>Họ và Tên</label>
                                                        <input type="text" class="form-control" id="Cha_HoVaTen" onblur="validateHoTen(Cha_HoVaTen)">
                                                        <p class="error" id="error_Cha_HoVaTen"></p>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Ngày sinh</label>
                                                        <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                        <div class="bootstrap-iso">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="input-group">
                                                                        <div class="input-group-addon">
                                                                            <i class="fa fa-calendar">
                                                                            </i>
                                                                        </div>
                                                                        <input class="form-control" id="Cha_ngaySinh" name="date"
                                                                            placeholder="Ngày/Tháng/Năm" type="text" onblur="validateRequired(Cha_ngaySinh)" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="error" id="error_Cha_ngaySinh"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Số CMND</label>
                                                        <input type="text" class="form-control" id="Cha_CMND" onblur="validateCMND(Cha_CMND)">
                                                    </div>
                                                    <p class="error" id="error_Cha_CMND"></p>
                                                </div>
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Nơi cấp</label>
                                                        <input type="text" class="form-control" id="Cha_NoiCap" onblur="validateRequired(Cha_NoiCap)">
                                                        <p class="error" id="error_Cha_NoiCap"></p>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Ngày cấp</label>
                                                        <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                                        <div class="bootstrap-iso">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="input-group">
                                                                        <div class="input-group-addon">
                                                                            <i class="fa fa-calendar">
                                                                            </i>
                                                                        </div>
                                                                        <input class="form-control" id="Cha_NgayCap" naCha="date"
                                                                            placeholder="Ngày/Tháng/Năm" onblur="validateNgayCap(Cha_NgayCap)" type="text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <p class="error" id="error_Cha_NgayCap"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Dân tộc</label>
                                                        <select class="form-control" id="Cha_DanToc" onblur="validateRequired(Cha_DanToc)">
                                                            <option></option>
                                                        </select>
                                                        <p class="error" id="error_Cha_DanToc"></p>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Quốc tịch </label>
                                                        <select class="form-control" id="Cha_QuocTich" onblur="validateRequired(Cha_QuocTich)">
                                                            <option></option>
                                                        </select>
                                                        <p class="error" id="error_Cha_QuocTich"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Tỉnh/TP</label>
                                                        <select class="form-control" id="Cha_Tinh" onblur="validateRequired(Cha_Tinh)">
                                                            <option></option>
                                                        </select>
                                                        <p class="error" id="error_Cha_Tinh" ></p>
                                                    </div>
                                                </div> 
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Quận/Huyện</label>
                                                        <select class="form-control" id="Cha_Quan" onblur="validateRequired(Cha_Quan)">
                                                            <option></option>
                                                        </select>
                                                        <p class="error" id="error_Cha_Quan"></p>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="form-group">
                                                        <label for="">Xã/Phường</label>
                                                        <select class="form-control" id="Cha_Phuong" onblur="validateRequired(Cha_Phuong)">
                                                            <option></option>
                                                        </select>
                                                        <p class="error" id="error_Cha_Phuong"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-12 col-md-12">
                                                    <div class="form-group">
                                                        <label for="">Địa chỉ chi tiết</label>
                                                        <input type="text" class="form-control" id="Cha_DiaChi" onblur="validateRequired(Cha_DiaChi)">
                                                        <p class="error" id="error_Cha_DiaChi"></p>
                                                    </div>
                                                </div>
        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="content-checkbox">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label">Tôi cam đoan đề nghị đăng ký trên đây là đúng sự
                                        thật, được sự thỏa thuận và nhất trí của các bên liên quan theo quy định của
                                        pháp luật. </label>
                                    <label>Tôi hoàn toàn chịu trách nhiệm trước pháp luật về nội dung cam đoan của mình
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                                <div class="title-part">
                                    <p>HỒ SƠ ĐÍNH KÈM</p>
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-upload">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Thành phần hồ sơ</th>
                                                                <th scope="col">Tập tin</th>
                                                                <th scope="col">Tải lên</th>
                                                                <th scope="col">Ghi chú</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Giấy chứng sinh</td>
                                                                <td></td>
                                                                <td><button class="btn"><i class="fa fa-upload"></i>Tải
                                                                        lên</button></td>
                                                                <td><textarea style="width: 100%">
                                                                </textarea></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!---End paper-->
                <div class="row">
                    <div class="control-navigation">
                        <button class="btn  btn-cancel">Hủy bỏ</button>
                        <a href="XacNhanDangKy.html" class="btn  btn-continue" onClick="validateSubmitKhaiSinh()">Tiếp
                            tục</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Start Content-->

    <!-- Start Footer-->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo-text">
                        <p>HOTICH.NET</p>
                    </div>
                    <div class="subrice">
                        <p>Hệ thống đăng ký và quản lý hộ tịch trực tuyến</p>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="footer-imfor">
                        <p>Copyright (C) 2018-2019 HOTICH.NET</p>
                        <p>Phát triển bởi Phan Văn Phước Thịnh - Huỳnh Lê Hữu Hưng</p>
                        <p> SĐT tư vấn - thương mại: 0975 339 843 - 0961 561 682</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer-->
    <script src="../plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="../js/Header.js"></script>
    <script src="../js/valiedateForm.js"></script>
</body>
</html>