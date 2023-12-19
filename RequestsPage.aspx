<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestsPage.aspx.cs" Inherits="AssetManagmentSite.RequestsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Talep Sayfası</title>
    <link rel="stylesheet" href="Assets/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
       <div class="container">
        <h2><span style="color:rgb(224, 14, 127);">Talep Sayfası</span></h2>
        <form id="asset-assignment-form">
            <div class="row" style="text-align:center;">
                <div class="col"><label class="form-label form-label">Personel Seçiniz</label>
                    <div class="dropdown"><button class="btn dropdown-toggle text-center" aria-expanded="false" data-bs-toggle="dropdown" style="width:400px;border-style:groove;border-color:var(--bs-btn-color);" type="button">Dropdown </button>
                        <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                    </div>
                </div>
                <div class="col"><label class="form-label form-label">Talep Türü</label>
                    <div class="dropdown"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" style="width:400px;border-style:groove;border-color:var(--bs-btn-color);" type="button">Dropdown </button>
                        <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                    </div>
                </div>
            </div>
            <div class="row" style="text-align:center;">
                <div class="col"><label class="form-label form-label">Açıklama</label><textarea class="form-control form-control" style="height:80.6px;"></textarea></div>
            </div>
            <div class="row">
                <div class="col text-center"><button class="btn btn-primary btn-lg" type="button" style="margin-top:10px;">Talep İsteği Gönder</button></div>
            </div>
        </form>
        <div class="row">
            <div class="col">
                <div class="card card-rounded">
                    <div class="card-body border-3 shadow border rounded-0">
                        <div class="d-sm-flex justify-content-between align-items-start">
                            <div></div>
                        </div>
                        <h3><span style="color: rgb(9, 143, 241);">Talep Geçmişi</span></h3>
                        <div class="table-responsive text-center mt-1">
                            <table class="table select-table">
                                <thead>
                                    <tr>
                                        <th>Personel</th>
                                        <th>Talep Türü</th>
                                        <th>Talep detay</th>
                                        <th>Talep tarihi</th>
                                        <th>Talep durumu</th>
                                        <th>Onaylayan Personel</th>
                                        <th>Onay Tarihi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="Assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
