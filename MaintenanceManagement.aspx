<%@ Page Language="C#" AutoEventWireup="true" Async="true" Title="Envanter yönetim Sayfası" CodeBehind="MaintenanceManagement.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.MaintenanceManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" id="form1">
        <asp:ScriptManager runat="server" />
        <div class="container text-start" style="color: rgb(124,127,145); transform: skew(0deg);">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-form-label fs-4 col-form-label" style="padding-top: 50px; border-color: rgb(13,41,210); color: rgb(213,44,33);">Yaklaşan Bakım Planları</label>
                    </div>
                </div>
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                            <asp:GridView ID="GridViewMaintenanceTable" runat="server" CssClass="table" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="MaintenanceRecordID" HeaderText="Bakım ID" />
                                    <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                                    <asp:BoundField DataField="MaintenanceDate" HeaderText="Bakım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="MaintenanceDetails" HeaderText="Bakım Detayları" />
                                    <asp:BoundField DataField="MaintenanceCost" HeaderText="Bakım Maliyeti" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <hr />
            </div>
            <hr />
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                <ContentTemplate>
                    <div>
                        <div class="row">
                            <div class="col-md-12 col-lg-12 col-xl-12">
                                <h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Bakım İşlemleri</h4>

                                <div>
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <asp:LinkButton runat="server" OnClick="LinkButtonTab1_Click" Text="Veri Girişi" ID="LinkButtonTab1" class="nav-link" role="tab" data-bs-toggle="tab" Style="color: rgb(65,208,29);"></asp:LinkButton></li>
                                        <li class="nav-item" role="presentation">
                                            <asp:LinkButton runat="server" OnClick="LinkButtonTab2_Click" Text="Veri Güncelle" ID="LinkButtonTab2" class="nav-link active" role="tab" data-bs-toggle="tab" Style="color: rgb(171,15,210);"></asp:LinkButton></li>
                                    </ul>

                                    <div id="SuccessMessage" runat="server" visible="false" class="alert alert-success" role="alert"><span id="SuccessMessageText" runat="server">Başarıyla Eklendi! </span></div>
                                    <div id="UnsuccesfullyMessage" runat="server" visible="false" class="alert alert-primary" role="alert"><span id="UnsuccesfullyMessageText" runat="server">Eklenemedi! </span></div>
                                    <div id="UpdatedAlert" runat="server" visible="false" class="alert alert-warning" role="alert"><span id="UpdatedAlertText" runat="server">Personel Bilgileri Değişti! </span></div>
                                    <div id="DeletedAlert" runat="server" visible="false" class="alert alert-danger" role="alert"><span id="DeletedAlertText" runat="server">Personel Silindi! </span></div>
                                    <div class="tab-content">

                                        <div class="tab-content">
                                            <asp:Panel ID="PanelTab1" runat="server" Visible="false">
                                                <div class="tab-pane" role="tabpanel" id="tab-1">
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                            <label class="form-label form-label">İşlem yapmak için Ürün ID seçiniz</label>
                                                            <div style="text-align: center; border-style: groove;">
                                                                <asp:DropDownList ID="DDLUrunInput" runat="server" CssClass="btn dropdown-toggle"
                                                                    Style="width: 100%; border-style: groove;">
                                                                </asp:DropDownList>
                                                            </div>
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
                                                                    <input runat="server" id="MaintenanceCostInput2" class="form-control form-control-sm border rounded-0 form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" style="width: 38px;" value="" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col text-center" style="text-align: right;">
                                                        <asp:Button runat="server"  OnClick="BakimKaydiGirButton_Click" ID="ButtonKaydet" class="btn btn-dark btn-lg" type="button" Style="margin-top: 20px;" Text="Bakım Kayıdı Gir" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel runat="server" ID="PanelTab2" Visible="true">
                                                <div class="tab-pane active" role="tabpanel" id="tab-2">
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                            <label class="form-label form-label">İşlem yapmak için Ürün ID seçiniz</label>
                                                            <div style="text-align: center; border-style: groove;">
                                                                <asp:DropDownList ID="DropDownListProductId" runat="server" OnSelectedIndexChanged="ProductId_DDL" CssClass="btn dropdown-toggle" AutoPostBack="true"
                                                                    Style="width: 100%; border-style: groove;">
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-xxl-5 text-center">
                                                            <label class="form-label form-label form-label">Bakım Maliyeti</label>
                                                            <div class="input-group input-group-sm" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; margin-left: -5px; margin-top: 0px;">
                                                                <div class="input-group-text input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px; background: rgb(234,164,60);">₺</span></div>
                                                                <input id="MaintenanceCostChangeInput1" runat="server" class="form-control form-control form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18" placeholder="Boş bırakılabilir." style="width: 160px; height: 35px;" />
                                                                <div class="input-group-text input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                                    <input id="MaintenanceCostChangeInput2" runat="server" class="form-control-sm form-control border rounded-0 form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" style="width: 38px;" value=".00" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                            <label class="form-label form-label" style="text-align: center;">Bakım Detayları</label>
                                                            <textarea runat="server" id="MaintenanceDetailsChangeInput" class="form-control"></textarea>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                            <label class="form-label form-label">Bakım Tarihi</label>
                                                            <input runat="server" id="MaintenanceDateChangeInput" class="form-control" type="date" />
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 10px">

                                                        <div class="col-md-6 col-xxl-5 text-center">
                                                            <asp:Button runat="server" OnClick="BakimBilgiGuncelleButon_Click" ID="ButtonGuncelle" class="btn btn-warning btn-lg" type="button" Style="position: static; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-btn-color);" Text="Bakım Bilgilerini Güncelle" />
                                                            <asp:Button runat="server" ID="ButtonSil" OnClick="SilButton_Click" class="btn btn-danger btn-lg fs-5" type="button" Style="position: static; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; padding-right: 40px; padding-left: 40px;" Text="Sil" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </asp:Panel>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <hr />
                            <h3>Bakım Kayıtları</h3>
                            <div class="row justify-content-end">
                                <div class="col-md-6 text-right">
                                    <asp:TextBox runat="server" AutoPostBack="true" ID="SearchMaintenance"
                                        CssClass="form-control d-inline-block w-auto"
                                        Style="margin-top: 40px; margin-right: 10px;" 
                                        Placeholder="Varlık Ara" OnTextChanged="SearchChanged" />

                                    <asp:Button runat="server" ID="SearchMaintenanceButton" OnClick="SearchChanged"
                                        CssClass="btn btn-primary btn-sm" Style="margin-bottom: 8px; padding-right: 15px; padding-left: 15px;"
                                        Text="Ara" />
                                </div>
                            </div>
                            <asp:Panel ID="PanelGrid" runat="server">

                                <div class="row">
                                    <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                                        <asp:GridView ID="GridViewMaintenanceTable2" runat="server" CssClass="table" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField DataField="MaintenanceRecordID" HeaderText="Bakım Id" />
                                                <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                                                <asp:BoundField DataField="MaintenanceDate" HeaderText="Bakım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="MaintenanceDetails" HeaderText="Bakım Detayları" />
                                                <asp:BoundField DataField="MaintenanceCost" HeaderText="Bakım Maliyeti" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="LinkButtonTab1" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonKaydet" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonGuncelle" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonSil" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="SearchMaintenanceButton" EventName="Click" />

                    <asp:AsyncPostBackTrigger ControlID="LinkButtonTab2" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="DDLUrunInput" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="SearchMaintenance" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DropDownListProductId" EventName="SelectedIndexChanged" />

                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</asp:Content>
