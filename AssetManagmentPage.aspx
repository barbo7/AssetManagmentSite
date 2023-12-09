<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssetManagmentPage.aspx.cs" Inherits="AssetManagmentSite.AssetManagmentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Varlık Yönetimi</title>
 <style>
        .container {
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .form-group {
            display: flex;
            max-width: 600px; /* Toplam genişlik */
        }
        .left, .right {
            flex: 1;
        }
        .left {
            text-align: right; /* Sol taraftaki label'ları sağa hizalar */
            padding-right: 10px; /* Sağdaki textbox'larla arasındaki boşluk */
        }
        .right {
            text-align: left; /* Sağ taraftaki textbox'ları sola hizalar */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Varlık Listesi</h2>
           
        <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataKeyNames="ID" Width="593px">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Isim" HeaderText="Varlık İsmi" ReadOnly="True" />
                <asp:BoundField DataField="SatınAlmaTarihi" HeaderText="Satın Alma Tarihi" ReadOnly="True" />
                <asp:BoundField DataField="Durum" HeaderText="Durum" ReadOnly="True" />
                <asp:BoundField DataField="Konum" HeaderText="Varlık Konumu" ReadOnly="True" />

            </Columns>
        </asp:GridView>
        <h2>Yeni Varlık Ekle</h2>
    <div class="container">
            <div class="form-group">
                <div class="left">
                    <asp:Label ID="Label1" runat="server" Text="İsim"></asp:Label><br />
                    <asp:Label ID="Label2" runat="server" Text="Satın Alma Tarihi"></asp:Label><br />
                    <asp:Label ID="Label3" runat="server" Text="Fiyat"></asp:Label><br />
                    <asp:Label ID="Label4" runat="server" Text="Durum"></asp:Label><br />
                    <asp:Label ID="Label5" runat="server" Text="Konum"></asp:Label><br />
                </div>
                <div class="right">
                    <asp:TextBox ID="txtIsim" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="txtSatınAlmaTarihi" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="txtFiyat" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="txtDurum" runat="server"></asp:TextBox><br />
                    <asp:TextBox ID="txtKonum" runat="server"></asp:TextBox><br />
                </div>
            </div>
        </div>
        <asp:Button ID="btnEkle" runat="server" Text="Ekle" OnClick="btnEkle_Click" />

        </div>
    </form>
</body>
</html>
