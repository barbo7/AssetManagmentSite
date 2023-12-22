﻿<%@ Page Language="C#" AutoEventWireup="true" Title="Personel Yönetim Sayfası" MasterPageFile="~/MasterPage.Master" CodeBehind="PersonelManagmentPage.aspx.cs" Inherits="AssetManagmentSite.PersonelManagmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" id="form1" class="border rounded-0 shadow-sm">
        <div class="container text-start">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-form-label fs-4"
                            style="padding-top: 50px; border-color: rgb(13,41,210); color: rgb(213,44,33);">
                            Personel
                        Listesi</label>
                    </div>
                    <div class="col-md-6">
                        <input runat="server" class="float-end" type="search"
                            style="border-color: var(--bs-body-color); padding-bottom: 0px; margin-bottom: 10px; margin-top: 40px;"
                            placeholder="Personel Ara" />
                    </div>
                </div>
                <div class="table-responsive">
                    <div style="text-align: center; background-color:white" class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="MyGridView" runat="server" CssClass="table">
                            <Columns>
                                <asp:BoundField DataField="PersonelId" HeaderText="Personel ID" />
                                <asp:BoundField DataField="NameSurname" HeaderText="Ad Soyad" />
                                <asp:BoundField DataField="Department" HeaderText="Departmanı" />
                                <asp:BoundField DataField="Role" HeaderText="Rolü" />
                                <asp:BoundField DataField="ApprovedDate" HeaderText="Personel Detayları" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </div>
            <div>
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
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                            <label
                                                class="form-label">
                                                Personel Ad Soyad</label><input runat="server"
                                                    class="border-secondary form-control form-control-sm" id="NameSurnameInput" type="text"
                                                    placeholder="(Örn. Bora SAPANCILAR)" style="margin-bottom: 10px;" />
                                        </div>
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                            <label
                                                class="form-label">
                                                Personel Departmanı&nbsp;</label><input id="EmployeeDepartmentInput" runat="server"
                                                    class="border-secondary form-control form-control-sm" type="text"
                                                    placeholder="Bilişim" inputmode="numeric" style="margin-bottom: 10px;" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                            <label class="form-label">Personel Rolü</label>
                                            <input runat="server" id="EmployeeRoleInput" class="border-secondary form-control" type="text" placeholder="Yazılım Geliştirme Personeli" style="width: 100%; margin-bottom: 10px;" />
                                        </div>
                                        <div class="col-md-7 col-lg-6 col-xxl-6">
                                            <label class="form-label">Personel Eklenmek İstenen Detayları</label>
                                            <textarea runat="server" class="form-control" placeholder="LinkedIn Hesabı, Öz geçmiş linki" id="DetailsInput" style="width: 100%; padding-bottom: 50px;"></textarea>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-11 col-xxl-10">
                                            <button runat="server"
                                                class="btn btn-primary btn-lg fs-5 float-start" type="submit"
                                                style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-body-bg); background: var(--bs-btn-bg);">
                                                Kaydet</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane active" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label">İşlem yapmak için Personel ID seçiniz</label>
                                            <asp:DropDownList ID="DropDownListPersonelId" runat="server"
                                                CssClass="form-control"
                                                Style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label">Personel Departmanı</label>
                                            <asp:DropDownList ID="DropDownListPersonelDepartments" runat="server"
                                                CssClass="form-control"
                                                Style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                            <label
                                                class="form-label">
                                                Personel Ad Soyad</label><input runat="server" id="NameSurnameChangeInput"
                                                    class="border-secondary form-control form-control-sm" type="text"
                                                    style="margin-bottom: 10px;" />
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                            <label
                                                class="form-label">
                                                Personel Rolü</label><input runat="server" id="PersonelRoleChangeInput"
                                                    class="border-secondary form-control form-control-sm" type="text"
                                                    inputmode="numeric" style="margin-bottom: 10px;" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xxl-12">
                                            <label class="form-label">
                                                Personel
                                                Detayları</label><textarea runat="server" id="PersonelDetailsChangeInput" class="form-control"
                                                    style="padding-bottom: 50px;"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-center">
                                            <button runat="server"
                                                class="btn btn-success btn-lg fs-5 d-inline" type="submit" id="ButtonGuncelle"
                                                style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; color: var(--bs-border-color); margin-top: 10px; margin-left: 10px;">
                                                Güncelle</button>
                                            <button runat="server"
                                                class="btn btn-danger btn-lg fs-5 d-inline" type="submit" id="ButtonSil"
                                                style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; padding-right: 40px; padding-left: 40px; margin-top: 10px; margin-left: 50px;">
                                                Sil</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Personel varlık detayları</h4>
                        <div class="col-sm-12 col-lg-12 col-xl-11 grid-margin stretch-card">
                            <label style="text-align: start">Personel Seçiniz</label>
                            <asp:DropDownList ID="DropDownListPersonel" runat="server"
                                CssClass="form-control"
                                Style="width: 20%; background-color: white; border: 1px solid #ced4da;">
                            </asp:DropDownList>
                            <label class="form-label" id="PersonelRoleInput"
                                style="text-align: center; color: var(--bs-blue); padding-left: 40px; margin-left: 0px;">
                                Personel
                            Unvan</label>
                        </div>
                        <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table">
                                <Columns>
                                    <asp:BoundField DataField="Employee" HeaderText="Personel" />
                                    <asp:BoundField DataField="UsingAsset" HeaderText="Kullanılan Varlık" />
                                    <asp:BoundField DataField="StartedDate" HeaderText="Kullanıma Başlama Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="CompletionDate" HeaderText="Kullanım Bitiş Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="Status" HeaderText="Durum" />

                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
