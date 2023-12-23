<%@ Page Language="C#" Title="Dashboard" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="AssetManagmentSite.MainPagee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        @font-face {
            font-family: 'Material Design Icons';
            src: url(../../assets/fonts/materialdesignicons-webfont.eot?v=3.9.97) format('embedded-opentype'), url(../../assets/fonts/materialdesignicons-webfont.eot) format('embedded-opentype'), url(../../assets/fonts/materialdesignicons-webfont.woff2?v=3.9.97) format('woff2'), url(../../assets/fonts/materialdesignicons-webfont.woff?v=3.9.97) format('woff'), url(../../assets/fonts/materialdesignicons-webfont.ttf?v=3.9.97) format('truetype');
            font-weight: normal;
            font-style: normal;
            font-display: auto;
        }

        .bullet-line-list {
            padding-left: 30px;
            position: relative;
            list-style-type: none;
            margin-bottom: 0;
        }

        .rtl .bullet-line-list {
            padding-left: unset;
            padding-right: 30px;
        }

        .bullet-line-list li {
            position: relative;
            padding-bottom: 10px;
        }

            .bullet-line-list li:last-child {
                padding-bottom: 0;
            }

            .bullet-line-list li:before {
                width: 13px;
                height: 13px;
                left: -28px;
                top: 6px;
                border: 4px solid #E9EDFB;
                margin-right: 15px;
                z-index: 2;
                background: #1F3BB3;
            }

        .rtl .bullet-line-list li:before {
            left: unset;
            right: -45px;
        }

        .bullet-line-list li:before {
            content: "";
            position: absolute;
            border-radius: 100%;
        }

        .bullet-line-list:after {
            content: "";
            border: 1px solid #dee2e6;
            position: absolute;
            top: 3px;
            bottom: 0;
            left: 7px;
        }

        .rtl .bullet-line-list:after {
            left: unset;
            right: 7px;
        }

        .bullet-line-list:last-child:after {
            display: none;
        }
    </style>
    <form runat="server" id="form1">
        <div class="container">
            <h2 class="text-center" style="margin-top: 30px;">Özet Panosu</h2>
            <div class="row text-start">

                <div class="col-md-6 col-lg-6">
                    <div class="card card-rounded">
                        <div class="card-body border rounded-0 border-3 shadow card-rounded" style="border-radius: 0;">
                            <h4 class="card-title card-title-dash text-center">Son Alınan Varlıklar(Son 5)</h4>
                            <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                                <asp:GridView ID="GridViewLastAssets" runat="server" CssClass="table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="AssetName" HeaderText="Varlık Adı" />
                                        <asp:BoundField DataField="BoughtDate" HeaderText="Alım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="align-items-center list pt-3">
                                <div class="wrapper w-100">
                                    <p class="mb-0"><a class="fw-bold text-primary" href="AssetManagmentPage.aspx">Hepsini Göster <i class="mdi mdi-arrow-right ms-2"></i></a></p>
                                </div>
                            </div>
                            <div></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="card card-rounded">
                        <div class="card-body border rounded-0 border-3 shadow card-rounded" style="border-radius: 0;">
                            <h4 class="card-title card-title-dash text-center">İş Akışı</h4>
                            <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                                <asp:GridView ID="GridViewWorkflow" runat="server" CssClass="table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="RelatedDepartment" HeaderText="İlişkili Departman" />
                                        <asp:BoundField DataField="Step" HeaderText="Mevcut Adım" />
                                        <asp:BoundField DataField="WorkflowName" HeaderText="İş Akışı Adı" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="align-items-center list pt-3">
                                <div class="wrapper w-100">
                                    <p class="mb-0"><a class="fw-bold text-primary" href="WorkflowManagement.aspx">Hepsini Göster <i class="mdi mdi-arrow-right ms-2"></i></a></p>
                                </div>
                            </div>
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <h2 class="mt-4 mb-3">Bildirimler ve Uyarılar</h2>
                    <div class="row">
                        <div class="col pb-md-0 mb-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="alert alert-warning" role="alert"><span class="fs-5" style="color: rgb(69,51,11);"><strong>Stok Düşüklüğü...</strong></span></div>
                                    <%--<p class="card-description">SELECT ProductName, CurrentQuantity, ReorderLevel FROM Inventory WHERE CurrentQuantity &lt;= (ReorderLevel/2)</p>--%>



                                    <div style="text-align: center;" class="card-body border-3 shadow border rounded-0">
                                        <asp:GridView ID="GridViewLowStockTable" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDataBound="GridViewLowStockTable_RowDataBound">
                                            <Columns>

                                                <asp:BoundField DataField="ProductName" HeaderText="Ürün Adı" />
                                                <asp:BoundField DataField="ProductAmount" HeaderText="Mevcut Miktar" />
                                                <asp:BoundField DataField="ReorderLevel" HeaderText="İstenilen Stok Seviyesi" />
                                                <asp:BoundField DataField="ProductPrice" HeaderText="Ürün Fiyatı" />
                                                <asp:TemplateField HeaderText="Durumu">
                                                    <ItemTemplate>
                                                        <asp:Label ID="StockStatus" class="form-label border rounded-pill border-1 badge badge-danger" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                    <a class="fw-bold text-primary" href="InventoryManagementPage.aspx" style="padding-bottom: 0px;">Hepsini Göster <i class="mdi mdi-arrow-right ms-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col mb-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="alert alert-danger" role="alert"><span class="fs-5" style="color: rgb(179,27,15);">Bakım Gerektiren Varlıklar...</span></div>
                                    <%--<p class="card-description">SELECT AssetName, LastMaintenanceDate, Status FROM Assets WHERE Status = 'Needs Maintenance' OR NextMaintenanceDate &lt; GETDATE()</p>--%>
                                    <div style="text-align: center; margin-bottom: 15px;" class="card-body border-3 shadow border rounded-0">
                                        <asp:GridView ID="GridViewMaintenanceTable" runat="server" CssClass="table">
                                            <Columns>
                                                <asp:BoundField DataField="ProductName" HeaderText="Ürün Adı" />
                                                <asp:BoundField DataField="PlannedMaintenanceDate" HeaderText="Planlanan Bakım Tarihi" DataFormatString="{0:dd/MM/yyyy}" />
                                                <asp:BoundField DataField="AssetStatus" HeaderText="Varlık Durumu" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <a class="fw-bold text-primary" href="MaintenanceManagement.aspx" style="padding-bottom: 0px;">Hepsini Göster <i class="mdi mdi-arrow-right ms-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" id="bildirim">
                        <div class="col">
                            <div class="card card-rounded">
                                <div class="card-body border rounded-0 border-3 shadow">
                                    <div class="alert alert-info fs-4" role="alert"><span style="color: rgb(40,128,164);">Onay Bekleyen İşlemler...</span></div>
                                    <asp:GridView ID="GridViewConfirmations" class="table select-table" OnRowDataBound="GridViewConfirmations_RowDataBound" AutoGenerateColumns="False" runat="server">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Onaylama Kutucuğu">

                                                <ItemTemplate>
                                                    <asp:CheckBox class="form-check" ID="CheckBox" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Request ID" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="LabelRequestID" runat="server" Text='<%# Bind("RequestID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Personel Adı">
                                                <ItemTemplate>
                                                    <asp:Label ID="PersonelName" class="form-label" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Talep Türü">
                                                <ItemTemplate>
                                                    <asp:Label ID="RequestType" class="form-label" runat="server" Text='<%# Bind("RequestType") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Talep Detayları">
                                                <ItemTemplate>
                                                    <asp:Label ID="RequestDetails" class="form-label" runat="server" Text='<%# Bind("RequestDetails") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Talep Tarihi">
                                                <ItemTemplate>
                                                    <asp:Label ID="RequestDate" class="form-label" runat="server" Text='<%# Bind("RequestDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Talep Durumu">
                                                <ItemTemplate>
                                                    <strong>
                                                        <asp:Label ID="RequestStatus" class="form-label border rounded-pill border-1 badge badge-danger" runat="server" Text='<%# Bind("RequestStatus") %>'></asp:Label></strong>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                    <div class="row">
                                        <div class="col text-center" style="padding-top: 0px; margin-top: 20px;">
                                            <asp:Button ID="btn_onayla" class="btn btn-success border rounded-pill" runat="server" OnClick="btn_onayla_Click" Text="Onayla" />

                                            <asp:Button runat="server" class="btn btn-danger border rounded-pill" type="button" OnClick="btn_reddet_Click" Style="margin-left: 20px;" Text="Reddet" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</asp:Content>
