<%@ Page Language="C#" Title="Varlık Yönetimi" AutoEventWireup="true" CodeBehind="AssetManagmentPage.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.AssetManagmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container text-center" style="color: rgb(124, 127, 145); transform: skew(0deg);">
        <div>
            <div class="row">
                <div class="col-md-6"><label class="col-form-label fs-4 col-form-label" style="padding-top:50px;border-color:rgb(13, 41, 210);color:rgb(23, 42, 162);">Alınan Varlıklar (Son 20)</label></div>
                <div class="col-md-6">
                    <input runat="server" type="search" class="float-end" placeholder="Varlık adı Ara" style="border-color:var(--bs-body-color);padding-bottom:0px;margin-bottom:10px;margin-top:40px;"/></div>
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
        <div>
            <form class="shadow-sm border rounded-0" id="form1">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color:var(--bs-link-color);">Yeni Varlık İşlemleri</h4>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-1" style="color: rgb(106,24,211);">Veri Ekle</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-2" style="color: rgb(193,60,107);">Veri Güncelle/Sil</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Varlık İsmi</label>
                                            <input runat="server" class="border-secondary form-control form-control-sm form-control" type="text" placeholder="Varlığın adı (örn. Dell Laptop)" style="margin-bottom:10px;"/></div>
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Fiyatı</label>
                                            <input runat="server" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="numeric" placeholder="Satın alma fiyatı (örn. 715.50)" style="margin-bottom:10px;"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Konumu</label>
                                            <input runat="server" class="border-secondary form-control form-control" type="text" placeholder="Varlığın bulunduğu yer." style="margin-bottom:10px;"/></div>
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Varlık Durumu</label>
                                            <div class="dropdown" style="text-align: center;"><button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" style="color: var(--bs-body-color);--bs-body-font-size: 0rem;--bs-body-font-weight: normal;margin-right: 0px;margin-left: 0px;margin-bottom: 10px;padding-left: 120px;padding-right: 120px;" type="button">Durumu</button>
                                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a><a class="dropdown-item" href="#">Menu Item</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-lg-12 col-xl-12"><label class="form-label form-label">Satın Alma Tarihi</label><input runat="server" class="border-secondary form-control form-control" type="date" style="margin-bottom:10px;"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col"><button class="btn btn-success btn-lg fs-5 float-start" type="button" style="position:static;display:block;transform:rotate(0deg) scale(0.88);padding-top:6px;margin-top:0px;color:var(--bs-body-bg);background:rgb(27, 188, 63);">Kaydet</button></div>
                                    </div>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Varlık ID</label>
                                            <div class="dropdown" style="text-align: center;"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" style="border-color: var(--bs-btn-color);padding-left: 120px;padding-right: 120px;" type="button">Asset ID</button>
                                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Varlık Durumu</label>
                                            <div class="dropdown" style="text-align: center;"><button class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary" aria-expanded="false" data-bs-toggle="dropdown" style="color: var(--bs-body-color);--bs-body-font-size: 0rem;--bs-body-font-weight: normal;margin-right: 0px;margin-left: 0px;margin-bottom: 10px;padding-left: 120px;padding-right: 120px;" type="button">Durumu</button>
                                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a><a class="dropdown-item" href="#">Menu Item</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Varlık İsmi</label><input runat="server" class="border-secondary form-control form-control-sm form-control" type="text" placeholder="Varlığın adı (örn. Dell Laptop)" style="margin-bottom:10px;"/></div>
                                        <div class="col-md-6 col-lg-6 col-xl-6"><label class="form-label form-label">Fiyatı</label><input runat="server" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="numeric" placeholder="Satın alma fiyatı (örn. 715.50)" style="margin-bottom:10px;"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col"><label class="form-label form-label">Satın Alma Tarihi</label>
                                            <input runat="server" class="border-secondary form-control form-control" type="date" style="margin-bottom:10px;"/></div>
                                        <div class="col-md-12 col-lg-6 col-xl-12"><label class="form-label form-label">Konumu</label><input runat="server" class="border-secondary form-control form-control" type="text" placeholder="Varlığın bulunduğu yer." style="margin-bottom:10px;"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col" style="text-align: center;"><button class="btn btn-warning btn-lg fs-5 d-inline" type="button" style="position:static;display:block;transform:rotate(0deg) scale(0.88);padding-top:6px;margin-top:0px;color:var(--bs-btn-color);">Güncelle</button><button class="btn btn-danger btn-lg fs-5 d-inline" type="button" style="position:static;display:block;transform:rotate(0deg) scale(0.88);padding-top:6px;margin-top:0px;padding-right:40px;padding-left:40px;">Sil</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Bakım Kayıtları</h4>
                    <div class="table-responsive" style="text-align: center;">
                        <table class="table table-hover">
                            <thead style="text-align: center;">
                                <tr style="text-align: center;">
                                    <th style="text-align: center;">Varlık Adı</th>
                                    <th style="text-align: center;">Kullanan Personel</th>
                                    <th style="text-align: center;">Bakım Tarihi</th>
                                    <th style="text-align: center;">Bakım Detayları</th>
                                    <th style="text-align: center;">Bakım Maliyeti</th>
                                </tr>
                            </thead>
                            <tbody style="text-align: center;">
                                <tr style="text-align: center;">
                                    <td style="text-align: center;">Laptop</td>
                                    <td style="text-align: center;">Bora S.</td>
                                    <td style="text-align: center;">12.01.2023</td>
                                    <td class="text-danger" style="text-align: center;">Baştan aşağı temizliği yapıldı ve Macunu değiştirildi.</td>
                                    <td style="text-align: center;">880 TL</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>