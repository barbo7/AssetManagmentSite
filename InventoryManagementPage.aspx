<%@ Page Language="C#" AutoEventWireup="true" Title="Envanter Yönetimi" CodeBehind="InventoryManagementPage.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.InventoryManagementPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container text-start" style="color: rgb(124,127,145); transform: skew(0deg);">
            <div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="col-form-label fs-4"
                            style="padding-top: 50px; border-color: rgb(13,41,210); color: rgb(213,44,33);">
                            Stok
						Bilgisi</label>
                    </div>
                    <div class="col-md-6">
                        <input runat="server" class="float-end" type="search" id="SearchUrun"
                            style="border-color: var(--bs-body-color); padding-bottom: 0px; margin-bottom: 10px; margin-top: 40px;"
                            placeholder="Ürün Ara" autocomplete="on" />
                    </div>
                </div>
                <div class="table-responsive">
                    <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="GridViewWorkflow" runat="server" CssClass="table" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="ProductID" HeaderText="Ürün ID" />
                                <asp:BoundField DataField="ProductName" HeaderText="Ürün Adı" />
                                <asp:BoundField DataField="ProductAmount" HeaderText="Mevcut Miktar" />
                                <asp:BoundField DataField="ProductPrice" HeaderText="Fiyatı" />
                                <asp:BoundField DataField="ReorderLevel" HeaderText="Yeniden Sipariş Seviyesi" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </div>
            <hr />
            <div>
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xl-12">
                            <h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Envanter İşlemleri</h4>
                            <div>
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item" role="presentation"><a class="nav-link" role="tab" data-bs-toggle="tab" href="#tab-1" style="color: rgb(65,208,29);">Veri Girişi</a></li>
                                    <li class="nav-item" role="presentation"><a class="nav-link active" role="tab" data-bs-toggle="tab" href="#tab-2" style="color: rgb(171,15,210);">Veri Güncelle</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane" role="tabpanel" id="tab-1">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                                <label class="form-label form-label">Ürün Adı</label>
                                                <input runat="server" id="ProductNameInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="latin-name" maxlength="100" placeholder="Ürünün adı." style="margin-bottom: 10px;" />
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                                <label class="form-label form-label">Ürün Adedi</label>
                                                <input runat="server" id="ProductAmountInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="numeric" minlength="1" placeholder="Ürünün mevcut miktarı." style="margin-bottom: 10px;" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5">
                                                <label class="form-label form-label">Yeniden Sipariş Seviyesi</label>
                                                <input runat="server" id="ProductReorderLevelInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="numeric" minlength="1" placeholder="Yeniden sipariş için gereken minimum miktar."
                                                    style="margin-bottom: 10px;" />
                                            </div>
                                            <div class="col-md-6 col-xxl-5">
                                                <label class="form-label form-label">Ürün Fiyatı</label>
                                                <div class="input-group input-group-sm" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px; margin-left: -5px; margin-top: 0px;">
                                                    <div class="input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px; background: rgb(234,164,60);">₺</span></div>
                                                    <input runat="server" id="ProductPriceInput1" class="form-control form-control form-control" type="text" aria-label="Amount (to the nearest dollar)"
                                                        inputmode="numeric" maxlength="18" placeholder="Ürün fiyatı" required="" style="width: 160px; height: 35px;" />
                                                    <div class="input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                        <input runat="server" id="ProductPriceInput2" class="form-control form-control-sm border rounded-0 form-control form-control" type="text"
                                                            aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" required="" style="width: 38px;" value=".00" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col text-center" style="text-align: right;">
                                            <asp:Button runat="server" class="btn btn-dark btn-lg" OnClick="UrunKaydetButton_Click" type="button" style="margin-top: 5px;" Text="Kaydet"/>
                                        </div>
                                    </div>
                                    <div class="tab-pane active" role="tabpanel" id="tab-2">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                <label class="form-label form-label">İşlem yapmak için Ürün ID seçiniz</label>
                                                <div style="text-align: center; border-style: groove;">
                                                    <asp:DropDownList ID="DropDownListProductList" runat="server" CssClass="btn dropdown-toggle"
                                                        Style="width: 100%; border-style: groove;">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                <label class="form-label form-label">Ürün Adı</label>
                                                <input runat="server" id="ProductNameChangeInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="latin-name" style="margin-bottom: 10px;" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                <label class="form-label form-label">Ürün Miktarı</label>
                                                <input runat="server" id="ProductAmountChangeInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="numeric" style="margin-bottom: 10px;" />
                                            </div>
                                            <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
                                                <label class="form-label form-label" style="text-align: center;">Yeniden Sipariş Seviyesi</label>
                                                <input runat="server" id="ProductReorderLevelChangeInput" class="border-secondary form-control form-control-sm form-control" type="text" inputmode="numeric" style="margin-bottom: 10px;" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-xxl-5" style="text-align: center;">
                                                <label class="form-label form-label" style="text-align: center;">Ürün Fiyatı</label>
                                                <div class="input-group" style="margin-top: -12px;">
                                                    <div class="input-group-text input-group-text input-group-prepend" style="height: 35px;"><span class="text-white bg-primary input-group-text" style="height: 30px;">₺</span></div>
                                                    <input runat="server" id="ProductPriceChangeInput1" class="form-control form-control-sm form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" inputmode="numeric" maxlength="18" required="" style="width: 160px; height: 35px;" />
                                                    <div class="input-group-text input-group-text input-group-append" style="padding-left: 12px; width: 60px; height: 35px;">
                                                        <input runat="server" id="ProductPriceChangeInput2" class="form-control form-control-sm form-control form-control" type="text" aria-label="Amount (to the nearest dollar)" autocomplete="on" inputmode="numeric" maxlength="3" minlength="2" required="" style="width: 38px;" value=".00" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xxl-5 text-end" style="text-align: right;">
                                                <asp:Button runat="server" class="btn btn-success btn-lg fs-5 d-inline" OnClick="UrunGuncelleButton_Click" type="button" style="position: static; display: block; transform: rotate(0deg) scale(0.88); padding-top: 6px; color: var(--bs-border-color); margin-top: 10px; margin-left: 10px;" Text="Güncelle"/>
                                            </div>
                                            <asp:UpdateProgress runat="server"></asp:UpdateProgress>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h3>Stok Takip</h3>
                    <div class="row">
                        <div class="col-md-3 col-lg-2"></div>
                        <div class="col-md-3 col-lg-2"></div>
                        <div class="col-md-6 col-lg-8">
                            <div class="progress border rounded-pill" style="text-align: right;">
                                <div class="progress-bar bg-success progress-bar-animated" aria-valuenow="80"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
                                    80%
                                </div>
                            </div>
                            <div class="progress border rounded-pill" style="text-align: right;">
                                <div class="progress-bar bg-warning progress-bar-animated" aria-valuenow="50"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
                                    50%
                                </div>
                            </div>
                            <div class="progress border rounded-pill" style="text-align: right;">
                                <div class="progress-bar bg-danger progress-bar-animated" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
                                    20%
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </form>
</asp:Content>
