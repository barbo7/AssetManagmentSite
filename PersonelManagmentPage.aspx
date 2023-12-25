<%@ Page Async="true" Language="C#" AutoEventWireup="true" Title="Personel Yönetim Sayfası" MasterPageFile="~/MasterPage.Master" CodeBehind="PersonelManagmentPage.aspx.cs" Inherits="AssetManagmentSite.PersonelManagmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" id="form1" class="border rounded-0 shadow-sm">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container text-start">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-form-label fs-4"
                            style="padding-top: 50px; border-color: rgb(13,41,210); color: rgb(213,44,33);">
                            Personel
                        Listesi</label>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:TextBox runat="server" AutoPostBack="true" ID="SearchEmployee"
                            CssClass="form-control d-inline-block w-auto"
                            Style="margin-top: 40px; margin-right: 10px;"
                            Placeholder="Personel Ara" OnTextChanged="EmployeeSearch" />

                        <asp:Button runat="server" ID="SearchEmployeeButton" OnClick="EmployeeSearch"
                            CssClass="btn btn-primary btn-sm" Style="margin-bottom: 8px; padding-right: 15px; padding-left: 15px;"
                            Text="Ara" />
                    </div>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <%--GridView'i bir UpdatePanel içine koyun. Bu, AJAX postback sırasında sadece GridView'in güncellenmesini sağlayacaktır.--%>
                    <ContentTemplate>
                        <div class="table-responsive">
                            <div style="text-align: center; background-color: white" class="card-body border-3 shadow border rounded-0">
                                <asp:GridView ID="GridViewPersonelList" runat="server" CssClass="table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="EmployeeID" HeaderText="Personel ID" />
                                        <asp:BoundField DataField="EmployeeName" HeaderText="Ad Soyad" />
                                        <asp:BoundField DataField="EmployeeDepartment" HeaderText="Departmanı" />
                                        <asp:BoundField DataField="EmployeeRole" HeaderText="Rolü" />
                                        <asp:BoundField DataField="EmployeeDetails" HeaderText="Personel Detayları" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="SearchEmployeeButton" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="SearchEmployee" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>

                <hr />
            </div>
            <div>
                <div id="SuccessMessage" runat="server" visible="false" class="alert alert-success" role="alert"><span id="SuccessMessageText" runat="server">Başarıyla Eklendi! </span></div>
                <div id="UnsuccesfullyMessage" runat="server" visible="false" class="alert alert-primary" role="alert"><span id="UnsuccesfullyMessageText" runat="server">Eklenemedi! </span></div>
                <div id="UpdatedAlert" runat="server" visible="false" class="alert alert-warning" role="alert"><span id="UpdatedAlertText" runat="server">Personel Bilgileri Değişti! </span></div>
                <div id="DeletedAlert" runat="server" visible="false" class="alert alert-danger" role="alert"><span id="DeletedAlertText" runat="server">Personel Silindi! </span></div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Personel İşlemleri</h4>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link " role="tab"
                                    data-bs-toggle="tab" href="#tab-1" style="color: rgb(92,220,33);">Personel
                                        Ekle</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab"
                                    data-bs-toggle="tab" href="#tab-2" style="color: rgb(210,155,15);">Personel Veri
                                        Güncelle</a></li>
                            </ul>

                            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                <ContentTemplate>
                                    <div class="tab-content">
                                        <div class="tab-pane " role="tabpanel" id="tab-1">

                                            <div class="row">
                                                <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                                    <label
                                                        class="form-label">
                                                        Personel Ad Soyad</label>
                                                    <input runat="server"
                                                        class="border-secondary form-control form-control-sm" id="NameSurnameInput" type="text"
                                                        placeholder="(Örn. Bora SAPANCILAR)" style="margin-bottom: 10px;" />
                                                </div>
                                                <div class="col-md-6 col-lg-5 col-xl-6 col-xxl-5">
                                                    <label
                                                        class="form-label">
                                                        Personel Departmanı&nbsp;</label><input id="EmployeeDepartmentInput" runat="server" class="border-secondary form-control form-control-sm" type="text" placeholder="Bilişim" inputmode="numeric" style="margin-bottom: 10px;" />
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
                                                    <div class="col-lg-11 col-xxl-10">
                                                        <asp:Button runat="server" OnClick="ButtonEkle_Click"
                                                            CssClass="btn btn-primary btn-lg fs-5 float-start"
                                                            Text="Kaydet"
                                                            Style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-body-bg); background: var(--bs-btn-bg);" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                        <div class="tab-pane active" role="tabpanel" id="tab-2">

                                            <div class="row">
                                                <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                    <label class="form-label">İşlem yapmak için Personel seçiniz</label>
                                                    <asp:DropDownList ID="DropDownListPersonelId" runat="server"
                                                        CssClass="form-control"
                                                        AutoPostBack="true"
                                                        OnSelectedIndexChanged="PersonelIdDDL_SelectedIndexChanged"
                                                        Style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                                                    </asp:DropDownList>

                                                </div>
                                                <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                    <label class="form-label">Personel Departmanı</label>
                                                    <asp:TextBox ID="PersonelDepartmanChangeInput" runat="server" CssClass="form-control"></asp:TextBox>

                                                    <%--<asp:DropDownList ID="DropDownListPersonelDepartments" runat="server"
                    CssClass="form-control"
                    Style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                </asp:DropDownList>--%>
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
                                                    <asp:Button runat="server" Text="Güncelle" OnClick="ButtonGuncelle_Click"
                                                        class="btn btn-success btn-lg fs-5 d-inline" type="submit" ID="ButtonGuncelle"
                                                        Style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; color: var(--bs-border-color); margin-top: 10px; margin-left: 10px;" />
                                                    <asp:Button runat="server" Text="Sil" OnClick="ButtonSil_Click"
                                                        class="btn btn-danger btn-lg fs-5 d-inline" type="submit" ID="ButtonSil"
                                                        Style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; padding-right: 40px; padding-left: 40px; margin-top: 10px; margin-left: 50px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownListPersonelId" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div id="PersonelAraAlert" runat="server" visible="false" class="alert alert-dismissible" role="alert"><span id="PersonelAraText" runat="server">Lütfen Mevcut Bir Personel Seçiniz! </span></div>
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
