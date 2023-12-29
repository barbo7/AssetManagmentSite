<%@ Page Language="C#" AutoEventWireup="true" Async="true" Title="Personel Varlık Atama ve İade Sayfası" CodeBehind="AssetAssignment.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.AssetAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container mt-4">
            <h2><span style="color: rgb(24, 127, 231);">Personel Varlık Yönetimi</span></h2>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="SuccessMessage" runat="server" visible="false" class="alert alert-success" role="alert"><span id="SuccessMessageText" runat="server">Başarıyla Eklendi! </span></div>
                    <div id="UnsuccesfullyMessage" runat="server" visible="false" class="alert alert-primary" role="alert"><span id="UnsuccesfullyMessageText" runat="server">Eklenemedi! </span></div>
                    <div id="UpdatedAlert" runat="server" visible="false" class="alert alert-warning" role="alert"><span id="UpdatedAlertText" runat="server">Varlık Bilgileri Değişti! </span></div>
                    <div id="DeletedAlert" runat="server" visible="false" class="alert alert-danger" role="alert"><span id="DeletedAlertText" runat="server">Varlık Silindi! </span></div>
                    <div>
                        <div class="tab-content">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <asp:LinkButton ID="LinkButtonTab1" runat="server" OnClick="LinkButtonTab1_Click" class="nav-link active" role="tab" data-bs-toggle="tab" Style="color: rgb(106,24,211);" Text="Veri Atama" /></li>
                                <li class="nav-item" role="presentation">
                                    <asp:LinkButton ID="LinkButtonTab2" runat="server" OnClick="LinkButtonTab2_Click" class="nav-link" role="tab" data-bs-toggle="tab" Style="color: rgb(193,60,107);" Text="Varlık İade"></asp:LinkButton></li>
                            </ul>
                            <asp:Panel runat="server" ID="TabPanel1" Visible="true">
                                <div class="tab-pane active" role="tabpanel">
                                    <h4 class="text-start" style="font-size: 24px; color: rgb(195,19,188);">Yeni Varlık Ataması</h4>
                                    <div class="row" style="text-align: center;">
                                        <div class="col">
                                            <label class="form-label">Personel Seçiniz</label>
                                            <div style="text-align: center; border-style: groove;">
                                                <asp:DropDownList ID="DropDownListPersonelListesi" runat="server" CssClass="btn dropdown-toggle"
                                                    Style="width: 100%; border-style: groove;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label class="form-label">Varlık Seçiniz&nbsp;</label>
                                            <div style="text-align: center; border-style: groove;">
                                                <asp:DropDownList ID="DropDownListVarlikListesi" runat="server" CssClass="btn dropdown-toggle"
                                                    Style="width: 100%; border-style: groove;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label class="form-label">Kullanıma Başlama Tarihi</label>
                                            <input runat="server" id="StartDateInput" class="form-control" type="date" style="text-align: center;" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-center">
                                            <asp:Button runat="server" Text="Varlık Talebi Gönder" ID="VarlikEkleButton" OnClick="VarlikEkleButton_Click" class="btn btn-success btn-lg" type="button" Style="margin-top: 10px;" />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                            <asp:Panel runat="server" ID="TabPanel2" Visible="false">
                                <div class="tab-pane" role="tabpanel">
                                    <h4><span style="color: rgb(20, 119, 218);">Varlık İade İşlemleri</span></h4>
                                    <div class="row text-center">
                                        <div class="col-md-6">
                                            <label class="form-label">Personel Seçiniz</label>
                                            <div style="text-align: center; border-style: groove;">
                                                <asp:DropDownList ID="DropDownListPersonelAdlariIade" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_PersonelAdlariIade" CssClass="btn dropdown-toggle"
                                                    Style="width: 100%; border-style: groove;">
                                                </asp:DropDownList>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">İade Edilecek Varlığı Seçiniz</label>
                                            <div style="text-align: center; border-style: groove;">
                                                <asp:DropDownList ID="DropDownListVarlikListesiIade" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_VarlikListesiIade" CssClass="btn dropdown-toggle"
                                                    Style="width: 100%; border-style: groove;">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-xl-12 text-center">
                                            <label class="form-label">İade Sebebi</label><textarea runat="server" id="AssetDescriptionIade" style="width: 100%; height: 80.6px; margin-bottom: 10px;"></textarea><label class="form-label">Kullanıma Başlangıç Tarihi</label>

                                        </div>
                                        <div class="col-md-6 col-xl-12">
                                            <label class="form-label">Kullanıma Başlama Tarihi</label>
                                            <input runat="server" id="UsageStartDateIade" class="form-control" type="date" style="text-align: center; margin-bottom: 10px;" readonly />
                                        </div>
                                        <div class="col-md-6 col-xl-12 text-center">
                                            <label class="form-label">İade Ediliş Tarihi</label><input runat="server" id="UsageEndDateIade" class="form-control" type="date" style="width: 100%; text-align: center;" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col text-center">
                                            <asp:Button class="btn btn-warning text-center" runat="server" OnClick="IadeButton_Click" type="submit" Style="margin-top: 10px;" Text="İade Talebinde Bulun"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DropDownListPersonelAdlariIade" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="DropDownListVarlikListesiIade" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="VarlikEkleButton" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>

            <div class="card mt-4">
                <div class="card-body">
                    <h4 style="color: rgb(16,221,110);">Mevcut Varlık Atamaları</h4>

                    <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="MyGridView" runat="server" CssClass="table" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                                <asp:BoundField DataField="EmployeeName" HeaderText="Personel Adı" />
                                <asp:BoundField DataField="UsageDateStart" HeaderText="Kullanmaya Başlama Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="UsageDateEnd" HeaderText="Kullanım Bitiş Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="AssetStatus" HeaderText="Varlık Durumu" />
                                <asp:BoundField DataField="AssetDescription" HeaderText="Varlık Açıklaması" />
                                <%--bunun yerine iade etmeyi sağlayan bi şey gelebilr--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="card mt-4">
                <div class="card-body">
                    <h4 style="color: rgb(200,100,9);">Varlık İade / Atama Geçmişi</h4>
                    <div style="text-align: center; border-style: groove;">
                        <asp:DropDownList ID="DropDownListAssetAssignmentEmployeePast" runat="server" CssClass="btn dropdown-toggle"
                            Style="width: 100%; border-style: groove;">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <table class="table">
                            <thead style="text-align: center;">
                                <tr>
                                    <th>Personel Adı</th>
                                    <th>Talep Türü</th>
                                    <th>Talep Detayları</th>
                                    <th>Talep Durumu</th>
                                    <th>Onaylayan<br />
                                        Adı</th>
                                    <th>Talep Tarihi</th>
                                    <th>Onaylanma Tarihi</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                    <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="EmployeeName" HeaderText="Personel Adı" />
                                <asp:BoundField DataField="RequestType" HeaderText="Talep Türü" />
                                <asp:BoundField DataField="RequestDetails" HeaderText="Talep Detayları" />
                                <asp:BoundField DataField="RequestStatus" HeaderText="Talep Durumu" />
                                <asp:BoundField DataField="ApprovedBy" HeaderText="Onaylayan Adı" />
                                <asp:BoundField DataField="RequestDate" HeaderText="Talep Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ApprovedDate" HeaderText="Onaylanma Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="card mt-4"></div>
        </div>
    </form>

</asp:Content>
