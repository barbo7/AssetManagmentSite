<%@ Page Language="C#" Async="true" AutoEventWireup="true" Title="Talep Sayfası" CodeBehind="RequestsPage.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.RequestsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server">
        <div id="SuccessMessage" runat="server" visible="false" class="alert alert-success" role="alert"><span id="SuccessMessageText" runat="server">Başarıyla Eklendi! </span></div>
        <div id="UnsuccesfullyMessage" runat="server" visible="false" class="alert alert-primary" role="alert"><span id="UnsuccesfullyMessageText" runat="server">Eklenemedi! </span></div>
        <div class="container">
            <h2><span style="color: rgb(224, 14, 127);">Talep Sayfası</span></h2>
            <div class="row" style="text-align: center;">
                <div class="col">
                    <label class="form-label form-label">Personel Seçiniz</label>
                    <asp:DropDownList ID="DropDownListEmployee" runat="server"
                        CssClass="form-control"
                        Style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                    </asp:DropDownList>
                </div>
                <div class="col">
                    <label class="form-label form-label">Talep Türü</label>
                    <asp:DropDownList ID="DropDownListRequestType" runat="server"
                        CssClass="form-control"
                        Style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" style="text-align: center;">
                <div class="col">
                    <label class="form-label form-label">Açıklama</label>
                    <textarea runat="server" id="description" class="form-control form-control" style="height: 80.6px;"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col text-center">
                    <asp:Button ID="TalepGonderButton" OnClick="TalepGonderButton_Click" runat="server" class="btn btn-primary btn-lg" type="submit" Style="margin-top: 10px;" Text="Talep İsteği Gönder" />
                </div>
            </div>

            <div class="row">
                <h3><span style="color: rgb(9, 143, 241);">Talep Geçmişi</span></h3>
                <div class="col">

                    <div class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="GridViewRequests" AutoGenerateColumns="false" runat="server" CssClass="table">
                            <Columns>
                                <asp:BoundField DataField="EmployeeID" HeaderText="Personel" />
                                <asp:BoundField DataField="RequestType" HeaderText="Talep Türü" />
                                <asp:BoundField DataField="RequestDetails" HeaderText="Talep detay" />
                                <asp:BoundField DataField="RequestStatus" HeaderText="Talep Durumu" />
                                <asp:BoundField DataField="RequestDate" HeaderText="Talep tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="ApprovedBy" HeaderText="Onaylayan Personel" />
                                <asp:BoundField DataField="ApprovedDate" HeaderText="Onay Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>
    </form>

</asp:Content>
