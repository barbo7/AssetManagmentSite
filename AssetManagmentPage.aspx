<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetManagmentPage.aspx.cs" Inherits="AssetManagmentSite.AssetManagmentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" data-bs-theme="light">
<head runat="server">
    <title>Varlık Yönetimi</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <link rel="stylesheet" href="Assets/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap"/>

</head>
<body  class="text-center" style="color: rgb(124, 127, 145); transform: skew(0deg);">
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <label class="col-form-label fs-4" style="padding-top: 50px; border-color: rgb(13, 41, 210); color: rgb(23, 42, 162);">Son Alınan Varlıklar (Son 10)</label>
            </div>
            <div class="col-md-6">
                <input class="float-end" type="search" style="border-color: var(--bs-body-color); padding-bottom: 0px; margin-bottom: 10px; margin-top: 40px;" placeholder="Varlık adı Ara"/>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Asset ID</th>
                        <th>Varlık Adı</th>
                        <th>Varlık Fiyatı</th>
                        <th>Varlık Durumu</th>
                        <th>Varlık Konumu</th>
                        <th>Satın Alma Tarihi</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ID1</td>
                        <td>Asset1</td>
                        <td>Price1</td>
                        <td>Status1</td>
                        <td>Location1</td>
                        <td>Date1</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div>
    <form id="form1" runat="server" class="border rounded-0 shadow-sm">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-xl-12">
                    <h4 class="text-start" style="color: var(--bs-link-color);">Yeni Varlık İşlemleri</h4>
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-1">Veri Ekle</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-2">Veri Güncelle/Sil</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" role="tabpanel" id="tab-1">
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Varlık İsmi</label>
                                        <input class="border-secondary form-control form-control-sm" type="text" placeholder="Varlığın adı (örn. Dell Laptop)" style="margin-bottom: 10px;"/>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Fiyatı</label>
                                        <input class="border-secondary form-control form-control-sm" type="text" placeholder="Satın alma fiyatı (örn. 715.50)" inputmode="numeric" style="margin-bottom: 10px;"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Konumu</label>
                                        <input class="border-secondary form-control" type="text" placeholder="Varlığın bulunduğu yer." style="margin-bottom: 10px;"/>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Varlık Durumu</label>
                                        <div class="dropdown">
                                            <button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="color: var(--bs-body-color); --bs-body-font-size: 0rem; --bs-body-font-weight: normal; margin-right: 0px; margin-left: 0px; margin-bottom: 10px; padding-right: 100px; padding-left: 100px;">Durumu</button>
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
                                    <div class="col-md-12 col-lg-12 col-xl-12">
                                        <label class="form-label">Satın Alma Tarihi</label>
                                        <input class="border-secondary form-control" type="date" style="margin-bottom: 10px;"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <button class="btn btn-success btn-lg fs-5 float-start" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-body-bg); background: rgb(27, 188, 63);">Kaydet</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab-2">
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Varlık ID</label>
                                        <div class="dropdown">
                                            <button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="border-color: var(--bs-btn-color); padding-left: 100px; padding-right: 100px;">Asset ID</button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">First Item</a>
                                                <a class="dropdown-item" href="#">Second Item</a>
                                                <a class="dropdown-item" href="#">Third Item</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Varlık İsmi</label>
                                        <input class="border-secondary form-control form-control-sm" type="text" placeholder="Varlığın adı (örn. Dell Laptop)" style="margin-bottom: 10px;"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Varlık Durumu</label>
                                        <div class="dropdown">
                                            <button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="color: var(--bs-body-color); --bs-body-font-size: 0rem; --bs-body-font-weight: normal; margin-right: 0px; margin-left: 0px; margin-bottom: 10px; padding-right: 100px; padding-left: 100px;">Durumu</button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">First Item</a>
                                                <a class="dropdown-item" href="#">Second Item</a>
                                                <a class="dropdown-item" href="#">Third Item</a>
                                                <a class="dropdown-item" href="#">Menu Item</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                        <label class="form-label">Fiyatı</label>
                                        <input class="border-secondary form-control form-control-sm" type="text" placeholder="Satın alma fiyatı (örn. 715.50)" inputmode="numeric" style="margin-bottom: 10px;"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label class="form-label">Satın Alma Tarihi</label>
                                        <input class="border-secondary form-control" type="date" style="margin-bottom: 10px;"/>
                                    </div>
                                    <div class="col-md-12 col-lg-6 col-xl-12">
                                        <label class="form-label">Konumu</label>
                                        <input class="border-secondary form-control" type="text" placeholder="Varlığın bulunduğu yer." style="margin-bottom: 10px;"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <button class="btn btn-warning btn-lg fs-5 d-inline" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-btn-color);">Güncelle</button>
                                        <button class="btn btn-danger btn-lg fs-5 d-inline" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; padding-right: 40px; padding-left: 40px;">Sil</button>
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
