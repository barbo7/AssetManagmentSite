<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintenanceManagement.aspx.cs" Inherits="AssetManagmentSite.MaintenanceManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Envanter yönetim Sayfası</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap"/>
</head>
<body  class="text-start" style="color:rgb(124,127,145);transform:skew(0deg);">
     <div class="container">
        <div>
            <div class="row">
                <div class="col-md-6"><label class="col-form-label fs-4 col-form-label" style="padding-top:50px;border-color:rgb(13,41,210);color:rgb(213,44,33);">Yaklaşan Bakım Planları</label></div>
                <div class="col-md-6">
                    <input type="search" autocomplete="on" class="float-end" placeholder="Ürün Ara" style="border-color:var(--bs-body-color);padding-bottom:0px;margin-bottom:10px;margin-top:40px;"/></div>
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="text-align:center;">Bakım ID</th>
                            <th style="text-align:center;">Varlık Adı</th>
                            <th style="text-align:center;">Bakım Tarihi</th>
                            <th style="text-align:center;">Bakım Detayları</th>
                            <th style="text-align:center;">Bakım Maliyeti</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center">BakımID</td>
                            <td class="text-center">VarlıkID</td>
                            <td class="text-center">12.18.2023</td>
                            <td class="text-center">bAKIM YAPMAK LAZIMMIŞ</td>
                            <td class="text-center">-</td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                    </tbody>
                </table>
            </div>
            <hr/>
        </div>
        <hr/>
        <div>
            <form class="shadow-sm border rounded-0">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color:var(--bs-primary-text-emphasis);">Bakım İşlemleri</h4>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-1" style="color:rgb(65,208,29);">Veri Girişi</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-2" style="color:rgb(171,15,210);">Veri Güncelle</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane" role="tabpanel" id="tab-1">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5 text-center"><label class="form-label form-label">Varlık Adı</label><input class="border-secondary form-control form-control-sm form-control" type="text" inputmode="latin-name" maxlength="100" placeholder="Ürünün adı." style="margin-bottom:10px;"/></div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5 text-center"><label class="form-label form-label">Bakım Tarihi</label><input class="form-control" type="date"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5 text-center"><label class="form-label form-label">Bakım Detayları</label><textarea class="form-control"></textarea></div>
                                        <div class="col-md-6 text-center"><label class="form-label form-label">Bakım Maliyeti</label>
                                            <div class="input-group input-group-sm" style="padding-top:0px;padding-bottom:0px;padding-left:0px;margin-left:-5px;margin-top:0px;">
                                                <div class="input-group-text input-group-text input-group-prepend" style="height:35px;"><span class="text-white bg-primary input-group-text" style="height:30px;background:rgb(234,164,60);">₺</span></div>
                                                <input class="form-control form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18" placeholder="Boş bırakılabilir." required="" style="width:160px;height:35px;"/>
                                                <div class="input-group-text input-group-text input-group-append" style="padding-left:12px;width:60px;height:35px;">
                                                    <input class="form-control form-control-sm border rounded-0 form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" required="" style="width:38px;" value=".00"/></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col text-center" style="text-align:right;"><button class="btn btn-dark btn-lg" type="button" style="margin-top:5px;">Bakım Kayıdı Gir</button></div>
                                </div>
                                <div class="tab-pane active" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align:center;"><label class="form-label form-label">İşlem yapmak için Ürün ID seçiniz</label>
                                            <div class="dropdown"><button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" style="color:var(--bs-body-color);--bs-body-font-size:0rem;--bs-body-font-weight:normal;margin-right:0px;margin-bottom:10px;margin-left:0px;padding-left:100px;padding-right:100px;" type="button">MaintenanceID</button>
                                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a><a class="dropdown-item" href="#">Menu Item</a></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align:center;"><label class="form-label form-label">Varlık Adı</label>
                                            <input class="border-secondary form-control form-control-sm form-control" type="text" inputmode="latin-name" style="margin-bottom:10px;"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align:center;"><label class="form-label form-label">Bakım Tarihi</label><input class="form-control" type="date"/></div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align:center;"><label class="form-label form-label" style="text-align:center;">Bakım Detayları</label><textarea class="form-control"></textarea></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6" style="text-align:center;"><label class="form-label form-label" style="text-align:center;">Bakım Fiyatı</label>
                                            <div class="input-group" style="margin-top:-12px;">
                                                <div class="input-group-text input-group-text input-group-prepend" style="height:35px;"><span class="text-white bg-primary input-group-text" style="height:30px;">₺</span></div>
                                                <input class="form-control form-control-sm form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18" required="" style="width:160px;height:35px;"/>
                                                <div class="input-group-text input-group-text input-group-append" style="padding-left:12px;width:60px;height:35px;">
                                                    <input class="form-control form-control-sm form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" required="" style="width:38px;" value=".00"/></div>
                                            </div>
                                        </div>
                                        <div class="col text-center"><button class="btn btn-success btn-lg fs-5 d-inline" type="button" style="position:static;display:block;transform:rotate(0deg) scale(0.88);padding-top:6px;color:var(--bs-border-color);margin-top:10px;margin-left:10px;">Güncelle</button><button class="btn btn-danger btn-lg fs-5 d-inline" type="button" style="position: static;display: block;transform: rotate(0deg) scale(0.88);padding-top: 6px;color: var(--bs-border-color);margin-top: 10px;margin-left: 10px;padding-right: 40px;padding-left: 40px;">Sil</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr/>
                <h3>Bakım Kayıtları</h3>
                <div class="row">
                    <div class="col">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="text-align:center;">Bakım ID</th>
                                        <th style="text-align:center;">Varlık Adı</th>
                                        <th style="text-align:center;">Bakım Tarihi</th>
                                        <th style="text-align:center;">Bakım Detayları</th>
                                        <th style="text-align:center;">Bakım Maliyeti</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">BakımID</td>
                                        <td class="text-center">VarlıkID</td>
                                        <td class="text-center">12.18.2023</td>
                                        <td class="text-center">bAKIM YAPMAK LAZIMMIŞ</td>
                                        <td class="text-center">-</td>
                                    </tr>
                                    <tr></tr>
                                    <tr></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
<script src="Assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
