<%@ Page Language="C#" Async="true" Title="Varlık Yönetimi" AutoEventWireup="true" CodeBehind="AssetManagmentPage.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.AssetManagmentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManagerR" runat="server"></asp:ScriptManager>

        <div class="container text-center" style="color: rgb(124, 127, 145); transform: skew(0deg);">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-form-label fs-4 col-form-label" style="padding-top: 50px; border-color: rgb(13, 41, 210); color: rgb(23, 42, 162);">Alınan Varlıklar (Son 20)</label>
                    </div>
                    <div class="col-md-6 text-right">
                        <asp:TextBox runat="server" AutoPostBack="true" ID="SearchAsset"
                            CssClass="form-control d-inline-block w-auto"
                            Style="margin-top: 40px; margin-right: 10px;"
                            Placeholder="Varlık Adı Ara" OnTextChanged="SearchChanged" />

                        <asp:Button runat="server" ID="SearchAssetButton" OnClick="SearchChanged"
                            CssClass="btn btn-primary btn-sm" Style="margin-bottom: 8px; padding-right: 15px; padding-left: 15px;"
                            Text="Ara" />
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                                <asp:GridView ID="GridViewAssetList" runat="server" CssClass="table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="AssetID" HeaderText="Asset ID" />
                                        <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                                        <asp:BoundField DataField="AssetPrice" HeaderText="Varlık Fiyatı" />
                                        <asp:BoundField DataField="AssetStatus" HeaderText="Varlık Durumu" />
                                        <asp:BoundField DataField="AssetLocation" HeaderText="Varlık Konumu" />
                                        <asp:BoundField DataField="AssetBoughtDate" HeaderText="Satın Alma Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="SearchAssetButton" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="KaydetButton" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="GuncelleButton" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="SilButton" EventName="Click" />


                            <asp:AsyncPostBackTrigger ControlID="SearchAsset" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>

                </div>

            </div>
        </div>
        <div>

            <div class="tab-content">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xl-12">
                        <h4 class="text-start" style="color: var(--bs-link-color);">Yeni Varlık İşlemleri</h4>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                            <ContentTemplate>
                                <div id="SuccessMessage" runat="server" visible="false" class="alert alert-success" role="alert"><span id="SuccessMessageText" runat="server">Başarıyla Eklendi! </span></div>
                                <div id="UnsuccesfullyMessage" runat="server" visible="false" class="alert alert-primary" role="alert"><span id="UnsuccesfullyMessageText" runat="server">Eklenemedi! </span></div>
                                <div id="UpdatedAlert" runat="server" visible="false" class="alert alert-warning" role="alert"><span id="UpdatedAlertText" runat="server">Varlık Bilgileri Değişti! </span></div>
                                <div id="DeletedAlert" runat="server" visible="false" class="alert alert-danger" role="alert"><span id="DeletedAlertText" runat="server">Varlık Silindi! </span></div>
                                <div>
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <asp:LinkButton ID="LinkButtonTab1" runat="server" OnClick="LinkButtonTab1_Click" class="nav-link " role="tab" data-bs-toggle="tab" Style="color: rgb(106,24,211);" Text="Veri Ekle" /></li>
                                        <li class="nav-item" role="presentation">
                                            <asp:LinkButton ID="LinkButtonTab2" runat="server" OnClick="LinkButtonTab2_Click" class="nav-link active" role="tab" data-bs-toggle="tab" Style="color: rgb(193,60,107);" Text="Veri Güncelle/Sil"></asp:LinkButton></li>
                                    </ul>

                                    <div class="tab-content">
                                        <asp:Panel runat="server" ID="TabPanel1" Visible="false">
                                            <div class="tab-pane active" role="tabpanel" id="tab-1">
                                                <div class="row">
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Varlık İsmi</label>
                                                        <input runat="server" id="AssetNameInput" class="border-secondary form-control form-control-sm form-control" type="text" placeholder="Varlığın adı (örn. Dell Laptop)" style="margin-bottom: 10px;" />
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Fiyatı</label>
                                                        <div class="input-group input-group-sm" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; margin-left: -5px; margin-top: 0px;">
                                                            <div class="input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px; background: rgb(234,164,60);">₺</span></div>
                                                            <input runat="server" id="ProductPriceInput1" class="form-control form-control form-control" type="text" aria-label="Amount (to the nearest dollar)"
                                                                inputmode="numeric" maxlength="18" placeholder="Ürün fiyatı"  style="width: 160px; height: 35px;" />
                                                            <div class="input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                                <input runat="server" id="ProductPriceInput2" class="form-control form-control-sm border rounded-0 form-control form-control" type="text"
                                                                    aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="2" minlength="1"  style="width: 38px;" value="00" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Konumu</label>
                                                        <input runat="server" id="AssetLocationInput" class="border-secondary form-control form-control" type="text" placeholder="Varlığın bulunduğu yer." style="margin-bottom: 10px;" />
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Varlık Durumu</label>
                                                        <div style="text-align: center; border-style: groove;">
                                                            <asp:TextBox ID="VarlikDurumuInput" runat="server" CssClass="border-secondary form-control form-control-sm form-control"
                                                                Enabled="false" Text="Boşta">
                                                            </asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12 col-lg-12 col-xl-12">
                                                        <label class="form-label form-label">Satın Alma Tarihi</label>
                                                        <input runat="server" id="AssetBoughtDateInput" class="border-secondary form-control form-control" type="date" style="margin-bottom: 10px;" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <asp:Button runat="server" ID="KaydetButton" OnClick="VarlikKaydetButton_Click" class="btn btn-success btn-lg fs-5 float-start" type="button" Style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-body-bg); background: rgb(27, 188, 63);" Text="Kaydet" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="TabPanel2" Visible="true">
                                            <div class="tab-pane" role="tabpanel" id="tab-2">
                                                <div class="row">
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Varlık Seçiniz</label>
                                                        <div style="text-align: center; border-style: groove;">
                                                            <asp:DropDownList ID="DropDownListVarlikListesiAd" runat="server" CssClass="btn dropdown-toggle"
                                                                OnSelectedIndexChanged="DropDownListVarlikListesiAd_SelectedIndexChanged" AutoPostBack="true"
                                                                Style="width: 100%; border-style: groove;">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Varlık Durumu</label>
                                                        <div style="text-align: center; border-style: groove;">
                                                            <asp:DropDownList ID="DropDownListVarlikDurumChangeInput" runat="server" CssClass="btn dropdown-toggle"
                                                                Style="width: 100%; border-style: groove;">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Varlık İsmi</label>
                                                        <input runat="server" id="AssetNameChangeInput" class="border-secondary form-control form-control-sm form-control" type="text" placeholder="Varlığın adı (örn. Dell Laptop)" style="margin-bottom: 10px;" />
                                                    </div>
                                                    <div class="col-md-6 col-lg-6 col-xl-6">
                                                        <label class="form-label form-label">Fiyatı</label>
                                                        <div class="input-group" style="margin-top: -12px;">
                                                            <div class="input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px;">₺</span></div>
                                                            <input runat="server" id="ProductPriceChangeInput1" class="form-control form-control-sm form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18"  style="width: 160px; height: 35px;" />
                                                            <div class="input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                                <input runat="server" id="ProductPriceChangeInput2" class="form-control form-control-sm form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="2" minlength="1"  style="width: 38px;" value="" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <label class="form-label form-label">Satın Alma Tarihi</label>
                                                        <input runat="server" id="AssetBoughtChangeInput" class="border-secondary form-control form-control" type="date" style="margin-bottom: 10px;" />
                                                    </div>
                                                    <div class="col-md-12 col-lg-6 col-xl-12">
                                                        <label class="form-label form-label">Konumu</label>
                                                        <input runat="server" id="AssetLocationChangeInput" class="border-secondary form-control form-control" type="text" placeholder="Varlığın bulunduğu yer." style="margin-bottom: 10px;" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col" style="text-align: center;">
                                                        <asp:Button runat="server" ID="GuncelleButton" OnClick="GuncelleButton_Click" class="btn btn-warning btn-lg fs-5 d-inline" type="button" Style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; color: var(--bs-btn-color);" Text="Güncelle" />
                                                        <asp:Button runat="server" ID="SilButton" OnClick="SilButton_Click" class="btn btn-danger btn-lg fs-5 d-inline" type="button" Style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; margin-top: 0px; padding-right: 40px; padding-left: 40px;" Text="Sil" />
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="LinkButtonTab1" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="LinkButtonTab2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="KaydetButton" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="GuncelleButton" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="SilButton" EventName="Click" />


                                <asp:AsyncPostBackTrigger ControlID="DropDownListVarlikListesiAd" EventName="" />

                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Bakım Kayıtları</h4>
                    <div class="table-responsive" style="text-align: center;">
                        <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                            <asp:GridView ID="GridViewVarliklarBakimListesi" runat="server" CssClass="table" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                                    <asp:BoundField DataField="MaintenanceDate" HeaderText="Bakım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="MaintenanceDetails" HeaderText="Bakım Detaylar" />
                                    <asp:BoundField DataField="MaintenanceCost" HeaderText="Bakım Maliyeti" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
