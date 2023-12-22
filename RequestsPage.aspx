<%@ Page Language="C#" AutoEventWireup="true" Title="Talep Sayfası" CodeBehind="RequestsPage.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.RequestsPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <form id="form1" runat="server">

       <div class="container">
        <h2><span style="color:rgb(224, 14, 127);">Talep Sayfası</span></h2>
            <div class="row" style="text-align:center;">
                <div class="col"><label class="form-label form-label">Personel Seçiniz</label>
                    <asp:DropDownList ID="DropDownListEmployee" runat="server" 
                        CssClass="form-control" 
                        style="width: 100%; background-color: white; border: 1px solid #ced4da;">
                    </asp:DropDownList>
                </div>
                <div class="col"><label class="form-label form-label">Talep Türü</label>
                    <asp:DropDownList ID="DropDownListRequestType" runat="server" 
                        CssClass="form-control" 
                        style="width: 100%;background-color: white; border: 1px solid #ced4da;">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" style="text-align:center;">
                <div class="col"><label class="form-label form-label">Açıklama</label>
                    <textarea runat="server" id="description" class="form-control form-control" style="height:80.6px;"></textarea></div>
            </div>
            <div class="row">
                <div class="col text-center"><button runat="server" class="btn btn-primary btn-lg" type="submit" style="margin-top:10px;">Talep İsteği Gönder</button></div>
            </div>

        <div class="row">
         <h3><span style="color: rgb(9, 143, 241);">Talep Geçmişi</span></h3>
        <div class="col">
                <div class="card-body border-3 shadow border rounded-0">
                        <asp:GridView ID="GridViewRequests" runat="server" CssClass="table">
                        <Columns>
                        <asp:BoundField DataField="Employee" HeaderText="Personel"/>
                        <asp:BoundField DataField="RequestType" HeaderText="Talep Türü"/>
                        <asp:BoundField DataField="Detail" HeaderText="Talep detay"/>
                        <asp:BoundField DataField="RequestDate" HeaderText="Talep tarihi" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="ApprovedByEmployee" HeaderText="Onaylayan Personel"/>
                        <asp:BoundField DataField="ApprovedDate" HeaderText="Onay Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                        </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</form>

</asp:Content>