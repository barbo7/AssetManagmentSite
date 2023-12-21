<%@ Page Language="C#" AutoEventWireup="true" Title="Dashboard" CodeBehind="MainPage.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.MainPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        @font-face {
	font-family: 'Material Design Icons';
	src: url(../../assets/fonts/materialdesignicons-webfont.eot?v=3.9.97) format('embedded-opentype'),
	url(../../assets/fonts/materialdesignicons-webfont.eot) format('embedded-opentype'),
	url(../../assets/fonts/materialdesignicons-webfont.woff2?v=3.9.97) format('woff2'),
	url(../../assets/fonts/materialdesignicons-webfont.woff?v=3.9.97) format('woff'),
	url(../../assets/fonts/materialdesignicons-webfont.ttf?v=3.9.97) format('truetype');
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

     <div class="container">
          <h2 class="text-center" style="margin-top: 30px;">Özet Panosu</h2>
        <div class="row text-start">
            <div class="col-md-6 col-lg-6">
                <div class="card card-rounded">
                    <div class="card-body border rounded-0 border-3 shadow card-rounded" style="border-radius: 0;">
                        <h4 class="card-title card-title-dash">Recent Events</h4>
                        <div class="align-items-center list border-bottom py-2">
                            <div class="wrapper w-100">
                                <p class="mb-2 font-weight-medium"> Change in Directors </p>
                                <div></div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center"><i class="text-muted mdi mdi-calendar me-1"></i>
                                        <p class="text-muted mb-0 text-small">Mar 14, 2019</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="align-items-center list pt-3">
                            <div class="wrapper w-100">
                                <p class="mb-0"><a class="fw-bold text-primary" href="#">Show all <i class="mdi mdi-arrow-right ms-2"></i></a></p>
                            </div>
                        </div>
                        <div></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="card card-rounded">
                    <div class="card-body border rounded-0 border-3 shadow">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="card-title card-title-dash">Activities</h4>
                            <p class="mb-0">20 finished, 5 remaining</p>
                        </div>
                        <ul class="bullet-line-list">
                            <li>
                                <div class="d-flex justify-content-between">
                                    <div><span class="text-light-green">Ben Tossell</span></div>
                                    <p>Just now</p>
                                </div>
                            </li>
                        </ul>
                        <div class="align-items-center list pt-3">
                            <hr/>
                            <div class="wrapper w-100">
                                <p class="mb-0"><a class="fw-bold text-primary" href="#">Show all <i class="mdi mdi-arrow-right ms-2"></i></a></p>
                            </div>
                        </div>
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
                                <p class="card-description">SELECT ProductName, CurrentQuantity, ReorderLevel FROM Inventory WHERE CurrentQuantity &lt;= (ReorderLevel/2)</p>
                                <div class="table-responsive" style="text-align: center;">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th style="width: 120.172px;">Ürün Adı</th>
                                                <th style="width: 57px;">Mevcut Miktar</th>
                                                <th style="width: 100.547px;">Durumu</th>
                                                <th style="width: 100.547px;">İstenilen Stok Seviyesi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Filtre Kahve</td>
                                                <td style="text-align: center;width: 140.734px;">30</td>
                                                <td style="text-align: center;"><label class="form-label border rounded-pill border-1 badge badge-danger" style="color: rgb(255,255,255);border-color: rgb(227,195,27);background: #aa0909;">&nbsp;<br/><strong><span style="color: var(--tw-prose-bold);">Düşük Stok Uyarısı</span></strong><br/><br/></label></td>
                                                <td>60</td>
                                            </tr>
                                            <tr></tr>
                                            <tr></tr>
                                        </tbody>
                                    </table>
                                </div><a class="fw-bold text-primary" href="#" style="padding-bottom: 0px;">Show all <i class="mdi mdi-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-md-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="alert alert-danger" role="alert"><span class="fs-5" style="color: rgb(179,27,15);">Bakım Gerektiren Varlıklar...</span></div>
                                <p class="card-description">SELECT AssetName, LastMaintenanceDate, Status FROM Assets WHERE Status = 'Needs Maintenance' OR NextMaintenanceDate &lt; GETDATE()</p>
                                <div class="table-responsive" style="margin-bottom: 15px;">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th> Varlık Adı</th>
                                                <th class="text-center"> Son Bakım Tarihi /<br/>Planlanan Bakım Tarihi</th>
                                                <th> Varlık Durumu</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="py-1">Kahve Makinesi</td>
                                                <td> May 15, 2023</td>
                                                <td>Bakım Gerekli</td>
                                            </tr>
                                            <tr></tr>
                                        </tbody>
                                    </table>
                                </div><a class="fw-bold text-primary" href="#" style="padding-bottom: 0px;">Show all <i class="mdi mdi-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="bildirim">
                    <div class="col">
                        <div class="card card-rounded">
                            <div class="card-body border rounded-0 border-3 shadow">
                                <div class="alert alert-info fs-4" role="alert"><span style="color: rgb(40,128,164);">Onay Bekleyen İşlemler...</span></div>
                                <div class="d-sm-flex justify-content-between align-items-start">
                                    <div>
                                        <p class="card-subtitle card-subtitle-dash">You have 50+ new requests</p>
                                    </div>
                                    <div></div>
                                </div>
                                <div class="table-responsive text-center mt-1">
                                    <table class="table select-table">
                                        <thead>
                                            <tr>
                                                <th><div class="form-check form-check-flat mt-0"><label class="form-check-label">
                                                    <input aria-checked="false" class="form-check-input" type="checkbox"/><i class="input-helper"></i></label></div></th>
                                                <th>Personel</th>
                                                <th>Talep Türü</th>
                                                <th>Talep detay</th>
                                                <th>Talep durumu</th>
                                                <th>Talep tarihi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><div class="form-check form-check-flat mt-0"><label class="form-check-label">
                                                    <input aria-checked="false" class="form-check-input" type="checkbox"/><i class="input-helper"></i></label></div></td>
                                                <td>Bora S..</td>
                                                <td>Talep Türü(örn Varlık,Bakım)</td>
                                                <td>Bakım tarihi yaklaştı.</td>
                                                <td class="text-center"><label class="form-label border rounded-pill border-1 badge badge-danger" style="color: rgb(0,0,0);border-color: rgb(227,195,27);background: #f9c50b;">&nbsp;<br/><strong><span style="color: var(--tw-prose-bold);">Bekleniyor</span></strong><br/><br/></label></td>
                                                <td><label class="form-label">12.12.2023</label></td>
                                            </tr>
                                            <tr></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col text-center" style="padding-top: 0px;margin-top: 20px;"><button class="btn btn-success border rounded-pill" type="button">Onayla</button><button class="btn btn-danger border rounded-pill" type="button" style="margin-left: 40px;">Reddet</button></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>