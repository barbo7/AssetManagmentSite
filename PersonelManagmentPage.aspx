<%@ Page Language="C#" AutoEventWireup="true" Title="Personel Yönetim Sayfası" MasterPageFile="~/MasterPage.Master" CodeBehind="PersonelManagmentPage.aspx.cs" Inherits="AssetManagmentSite.PersonelManagmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container text-start">
        <div>
            <div class="row">
                <div class="col-md-6"><label class="col-form-label fs-4"
                        style="padding-top: 50px;border-color: rgb(13,41,210);color: rgb(213,44,33);">Personel
                        Listesi</label></div>
                <div class="col-md-6"><input runat="server" class="float-end" type="search"
                        style="border-color: var(--bs-body-color);padding-bottom: 0px;margin-bottom: 10px;margin-top: 40px;"
                        placeholder="Personel Ara"/></div>
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
       <div>
            <form class="border rounded-0 shadow-sm">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Personel İşlemleri</h4>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab"
                                        data-bs-toggle="tab" href="#tab-1" style="color: rgb(92,220,33);">Personel
                                        Ekle</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab"
                                        data-bs-toggle="tab" href="#tab-2" style="color: rgb(210,155,15);">Personel Veri
                                        Güncelle</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane" role="tabpanel" id="tab-1">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5"><label
                                                class="form-label">Personel Ad Soyad</label><input runat="server"
                                                class="border-secondary form-control form-control-sm" type="text"
                                                placeholder="(Örn. Bora SAPANCILAR)" style="margin-bottom: 10px;"/></div>
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5"><label
                                                class="form-label">Personel Departmanı&nbsp;</label><input runat="server"
                                                class="border-secondary form-control form-control-sm" type="text"
                                                placeholder="Bilişim" inputmode="numeric" style="margin-bottom: 10px;"/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5"><label
                                                class="form-label"/>Personel Rolü<input runat="server"
                                                class="border-secondary form-control" type="text"
                                                placeholder="Yazılım Geliştirme Personeli" style="margin-bottom: 10px;"/>
                                        </div>
                                        <div class="col-md-6 col-lg-5 col-xxl-5"><label class="form-label">Personel
                                                Eklenmek İstenen Detayları</label><textarea runat="server" class="form-control"
                                                placeholder="LinkedIn Hesabı, Öz geçmiş linki"
                                                style="padding-bottom: 50px;"></textarea></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-11 col-xxl-10"><button runat="server"
                                                class="btn btn-primary btn-lg fs-5 float-start" type="button"
                                                style="position: static;display: block;transform: rotate(0deg) scale(0.88);padding-top: 6px;margin-top: 0px;color: var(--bs-body-bg);background: var(--bs-btn-bg);">Kaydet</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane active" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label">İşlem yapmak için Personel ID seçiniz</label>
                                            <div class="dropdown"><button runat="server"
                                                    class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary"
                                                    aria-expanded="false" data-bs-toggle="dropdown" type="button"
                                                    style="color: var(--bs-body-color);--bs-body-font-size: 0rem;--bs-body-font-weight: normal;margin-right: 0px;margin-bottom: 10px;margin-left: 0px;padding-left: 100px;padding-right: 100px;">Personel
                                                    ID</button>
                                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First
                                                        Item</a><a class="dropdown-item" href="#">Second Item</a><a
                                                        class="dropdown-item" href="#">Third Item</a><a
                                                        class="dropdown-item" href="#">Menu Item</a></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label">Personel Departmanı</label>
                                            <div class="dropdown"><button runat="server"
                                                    class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary"
                                                    aria-expanded="false" data-bs-toggle="dropdown" type="button"
                                                    style="color: var(--bs-body-color);--bs-body-font-size: 0rem;--bs-body-font-weight: normal;margin-right: 0px;margin-bottom: 10px;margin-left: 0px;padding-left: 100px;padding-right: 100px;">Department</button>
                                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First
                                                        Item</a><a class="dropdown-item" href="#">Second Item</a><a
                                                        class="dropdown-item" href="#">Third Item</a><a
                                                        class="dropdown-item" href="#">Menu Item</a></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5"><label
                                                class="form-label">Personel Ad Soyad</label><input runat="server"
                                                class="border-secondary form-control form-control-sm" type="text"
                                                style="margin-bottom: 10px;"/></div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5"><label
                                                class="form-label">Personel Rolü</label><input runat="server"
                                                class="border-secondary form-control form-control-sm" type="text"
                                                inputmode="numeric" style="margin-bottom: 10px;"/></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xxl-10"><label class="form-label">Personel
                                                Detayları</label><textarea runat="server" class="form-control"
                                                style="padding-bottom: 50px;"></textarea></div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-center"><button runat="server"
                                                class="btn btn-success btn-lg fs-5 d-inline" type="button"
                                                style="position: static;display: block;transform: rotate(0deg) scale(0.88);padding-top: 6px;color: var(--bs-border-color);margin-top: 10px;margin-left: 10px;">Güncelle</button><button runat="server"
                                                class="btn btn-danger btn-lg fs-5 d-inline" type="button"
                                                style="position: static;display: block;transform: rotate(0deg) scale(0.88);padding-top: 6px;padding-right: 40px;padding-left: 40px;margin-top: 10px;margin-left: 50px;">Sil</button>
                                        </div>
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
                    <h4 class="card-title">Personel varlık detayları</h4>
                    <div class="col-sm-12 col-lg-12 col-xl-11 grid-margin stretch-card">
                        <div class="dropdown"><button runat="server"
                                class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary"
                                aria-expanded="false" data-bs-toggle="dropdown" type="button"
                                style="color: var(--bs-body-color);--bs-body-font-size: 0rem;--bs-body-font-weight: normal;margin-right: 0px;margin-bottom: 10px;margin-left: 0px;padding-left: 100px;padding-right: 100px;">Personel
                                Seçiniz</button>
                            <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a
                                    class="dropdown-item" href="#">Second Item</a><a class="dropdown-item"
                                    href="#">Third Item</a><a class="dropdown-item" href="#">Menu Item</a></div>
                        </div><label class="form-label"
                            style="text-align: center;color: var(--bs-blue);padding-left: 0px;margin-left: 0px;">Personel
                            Unvan</label>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th class="text-center"> Personel&nbsp;</th>
                                    <th class="text-center"> Kullanılan Varlık</th>
                                    <th class="text-center"> Kullanıma Başlanma zamanı</th>
                                    <th class="text-center"> Kullanım Bitişi</th>
                                    <th class="text-center"> Durum</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center"> Herman Beck </td>
                                    <td class="text-center">Laptop</td>
                                    <td class="text-center">14.08.2022</td>
                                    <td class="text-center">-</td>
                                    <td class="text-center">Kullanımda</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>