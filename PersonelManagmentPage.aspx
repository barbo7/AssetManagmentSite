<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonelManagmentPage.aspx.cs" Inherits="AssetManagmentSite.PersonelManagmentPage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-bs-theme="light">
<head runat="server">

    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Personel Management Page</title>
    <link rel="stylesheet" href="Assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap"/>
</head>
<body class="text-start" style="color: rgb(124,127,145); transform: skew(0deg);">
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <label class="col-form-label fs-4" style="padding-top: 50px; border-color: rgb(13,41,210); color: rgb(213,44,33);">Personel Listesi</label>
                </div>
                <div class="col-md-6">
                    <input class="float-end" type="search" style="border-color: var(--bs-body-color); padding-bottom: 0px; margin-bottom: 10px; margin-top: 40px;" placeholder="Personel Ara"/>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Personel ID</th>
                            <th>Ad Soyad</th>
                            <th>Departmanı</th>
                            <th>Rolü</th>
                            <th>Personel Detayları</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ID1</td>
                            <td>Name1</td>
                            <td>Department1</td>
                            <td>Role1</td>
                            <td>Detail1</td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                    </tbody>
                </table>
            </div>
            <hr/>
        </div>
    </div>
     <div>
        <form class="border rounded-0 shadow-sm">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Personel İşlemleri</h4>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-1" style="color: rgb(92,220,33);">Personel Ekle</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-2" style="color: rgb(210,155,15);">Personel Veri Güncelle</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                            <label class="form-label">Personel Ad Soyad</label>
                                            <input class="border-secondary form-control form-control-sm" type="text" placeholder="(Örn. Bora SAPANCILAR)" style="margin-bottom: 10px;"/>
                                        </div>
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                            <label class="form-label">Personel Departmanı</label>
                                            <input class="border-secondary form-control form-control-sm" type="text" placeholder="Bilişim" inputmode="numeric" style="margin-bottom: 10px;"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                            <label class="form-label">Personel Rolü</label>
                                            <input class="border-secondary form-control" type="text" placeholder="Yazılım Geliştirme Personeli" style="margin-bottom: 10px;"/>
                                        </div>
                                        <div class="col-md-6 col-lg-5 col-xxl-5">
                                            <label class="form-label">Personel Eklenmek İstenen Detayları</label>
                                            <textarea class="form-control" placeholder="LinkedIn Hesabı, Öz geçmiş linki" style="padding-bottom: 50px;"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-11 col-xxl-10">
                                            <button class="btn btn-primary btn-lg fs-5 float-start" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-body-bg); background: var(--bs-btn-bg);">Kaydet</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label">İşlem yapmak için Personel ID seçiniz</label>
                                            <div class="dropdown">
                                                <button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="color: var(--bs-body-color); --bs-body-font-size: 0rem; --bs-body-font-weight: normal; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 100px; padding-right: 100px;">Personel ID</button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="#">First Item</a>
                                                    <a class="dropdown-item" href="#">Second Item</a>
                                                    <a class="dropdown-item" href="#">Third Item</a>
                                                    <a class="dropdown-item" href="#">Menu Item</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label">Personel Departmanı</label>
                                            <div class="dropdown">
                                                <button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="color: var(--bs-body-color); --bs-body-font-size: 0rem; --bs-body-font-weight: normal; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding-left: 100px; padding-right: 100px;">Department</button>
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item" href="#">First Item</a>
                                                    <a class="dropdown-item" href="#">Second Item</a>
                                                    <a class="dropdown-item" href="#">Third Item</a>
                                                    <a class="dropdown-item" href="#">Menu Item</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                            <label class="form-label">Personel Ad Soyad</label>
                                            <input class="border-secondary form-control form-control-sm" type="text" style="margin-bottom: 10px;"/>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                            <label class="form-label">Personel Rolü</label>
                                            <input class="border-secondary form-control form-control-sm" type="text" inputmode="numeric" style="margin-bottom: 10px;"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xxl-10">
                                            <label class="form-label">Personel Detayları</label>
                                            <textarea class="form-control" style="padding-bottom: 30px;"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <button class="btn btn-success btn-lg fs-5 d-inline" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; color: var(--bs-border-color); margin-top: 10px; margin-left: 10px;">Güncelle</button>
                                            <button class="btn btn-danger btn-lg fs-5 d-inline" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; padding-right: 40px; padding-left: 40px; margin-top: 10px; margin-left: 50px;">Sil</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="Assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
