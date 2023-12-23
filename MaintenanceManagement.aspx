<%@ Page Language="C#" AutoEventWireup="true" Title="Envanter yönetim Sayfası" CodeBehind="MaintenanceManagement.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.MaintenanceManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" id="form1">
        <div class="container text-start" style="color: rgb(124,127,145); transform: skew(0deg);">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-form-label fs-4 col-form-label" style="padding-top: 50px; border-color: rgb(13,41,210); color: rgb(213,44,33);">Yaklaşan Bakım Planları</label>
                    </div>
                    <div class="col-md-6">
                        <input runat="server" type="search" autocomplete="on" class="float-end" placeholder="Ürün Ara" style="border-color: var(--bs-body-color); padding-bottom: 0px; margin-bottom: 10px; margin-top: 40px;" />
                    </div>
                </div>
                <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                    <asp:GridView ID="GridViewMaintenanceTable" runat="server" CssClass="table">
                        <Columns>
                            <asp:BoundField DataField="MaintenanceId" HeaderText="Bakım ID" />
                            <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                            <asp:BoundField DataField="MaintenanceDate" HeaderText="Bakım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="MaintenanceDetails" HeaderText="Bakım Detayları" />
                            <asp:BoundField DataField="MaintenanceCost" HeaderText="Bakım Maliyeti" />
                        </Columns>
                    </asp:GridView>
                </div>
                <hr />
            </div>
            <hr />
            <div>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Bakım İşlemleri</h4>
                        <div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-1" style="color: rgb(65,208,29);">Veri Girişi</a></li>
                                <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-2" style="color: rgb(171,15,210);">Veri Güncelle</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane" role="tabpanel" id="tab-1">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5 text-center">
                                            <label class="form-label form-label">Varlık Adı</label>
                                            <input runat="server" id="AssetNameInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="latin-name" maxlength="100" placeholder="Ürünün adı." style="margin-bottom: 10px;" />
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5 text-center">
                                            <label class="form-label form-label">Bakım Tarihi</label>
                                            <input runat="server" id="MaintenanceDateInput" class="form-control" type="date" />
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 20px">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5 text-center">
                                            <label class="form-label form-label">Bakım Detayları</label>
                                            <textarea runat="server" id="MaintenanceDetailsInput" class="form-control"></textarea>
                                        </div>
                                        <div class="col-md-6 col-xxl-5 text-center">
                                            <label class="form-label form-label">Bakım Maliyeti</label>
                                            <div class="input-group input-group-sm" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; margin-left: -5px; margin-top: 0px;">
                                                <div class="input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px; background: rgb(234,164,60);">₺</span></div>
                                                <input runat="server" id="MaintenanceCostInput1" class="form-control form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18" placeholder="Boş bırakılabilir." style="width: 160px; height: 35px;" />
                                                <div class="input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                    <input runat="server" id="MaintenanceCostInput2" class="form-control form-control-sm border rounded-0 form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" style="width: 38px;" value=".00" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col text-center" style="text-align: right;">
                                        <asp:Button runat="server" OnClick="BakimKaydiGirButton_Click" ID="ButtonKaydet" class="btn btn-dark btn-lg" type="submit" Style="margin-top: 20px;" Text="Bakım Kayıdı Gir" />
                                    </div>
                                </div>
                                <div class="tab-pane active" role="tabpanel" id="tab-2">
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label form-label">İşlem yapmak için Ürün ID seçiniz</label>
                                            <div style="text-align: center; border-style: groove;">
                                                <asp:DropDownList ID="DropDownListProductId" runat="server" CssClass="btn dropdown-toggle"
                                                    Style="width: 100%; border-style: groove;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label form-label">Varlık Adı</label>
                                            <input runat="server" id="AssetNameChaneInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="latin-name" style="margin-bottom: 10px;" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label form-label">Bakım Tarihi</label>
                                            <input runat="server" id="MaintenanceDateChangeInput" class="form-control" type="date" />
                                        </div>
                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                            <label class="form-label form-label" style="text-align: center;">Bakım Detayları</label>
                                            <textarea runat="server" id="MaintenanceDetailsChangeInput" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xxl-5 text-center">
                                            <label class="form-label form-label form-label">Bakım Maliyeti</label>
                                            <div class="input-group input-group-sm" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; margin-left: -5px; margin-top: 0px;">
                                                <div class="input-group-text input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px; background: rgb(234,164,60);">₺</span></div>
                                                <input id="MaintenanceCostChangeInput1" class="form-control form-control form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18" placeholder="Boş bırakılabilir." style="width: 160px; height: 35px;" />
                                                <div class="input-group-text input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                    <input id="MaintenanceCostChangeInput2" class="form-control-sm form-control border rounded-0 form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" style="width: 38px;" value=".00" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-xxl-5 text-center">
                                            <asp:Button runat="server" OnClick="BakimBilgiGuncelleButon_Click" ID="ButtonGuncelle" class="btn btn-warning btn-lg" type="button" Style="margin-top: 20px;" Text="Bakım Bilgilerini Güncelle" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <h3>Bakım Kayıtları</h3>
                <div class="row">
                    <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="GridViewMaintenanceTable2" runat="server" CssClass="table">
                            <Columns>
                                <asp:BoundField DataField="MaintenanceId2" HeaderText="Bakım Id" />
                                <asp:BoundField DataField="AssetName2" HeaderText="Varlık Adı" />
                                <asp:BoundField DataField="MaintenanceDate2" HeaderText="Bakım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="MaintenanceDetails2" HeaderText="Bakım Detayları" />
                                <asp:BoundField DataField="MaintenanceCost2" HeaderText="Bakım Maliyeti" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
