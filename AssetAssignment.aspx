<%@ Page Language="C#" AutoEventWireup="true" Title="Personel Varlık Atama ve İade Sayfası" CodeBehind="AssetAssignment.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.AssetAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">

        <div class="container mt-4">
            <h2><span style="color: rgb(24, 127, 231);">Personel Varlık Yönetimi</span></h2>
            <div class="card mt-4">
                <div class="card-body text-center">
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
                    <div class="row" style="text-align: center;">
                        <div class="col">
                            <label class="form-label">Açıklama</label><textarea runat="server" id="AssetDescriptionInput" class="form-control" style="height: 80.6px;"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label class="form-label">Kullanıma Başlama Tarihi</label>
                            <input runat="server" id="StartDateInput" class="form-control" type="date" style="text-align: center;" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <button runat="server" onclick="VarlikEkleButton_Click" class="btn btn-success btn-lg" type="button" style="margin-top: 10px;">Varlık Talebi Gönder</button>
                        </div>
                    </div>
                </div>
            </div>
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
                                <asp:BoundField DataField="RequestDate" HeaderText="Talep Tarihi"  DataFormatString="{0:dd/MM/yyyy}"/>
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
