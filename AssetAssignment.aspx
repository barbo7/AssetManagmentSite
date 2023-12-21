<%@ Page Language="C#" AutoEventWireup="true" Title="Personel Varlık Atama ve İade Sayfası" CodeBehind="AssetAssignment.aspx.cs" MasterPageFile="~/MasterPage.Master" Inherits="AssetManagmentSite.AssetAssignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <h2><span style="color: rgb(24, 127, 231);">Personel Varlık Yönetimi</span></h2>
        <div class="card mt-4">
            <div class="card-body text-center">
                <h4 class="text-start" style="font-size: 24px;color: rgb(195,19,188);">Yeni Varlık Ataması</h4>
                <form id="asset-assignment-form">
                    <div class="row" style="text-align: center;">
                        <div class="col"><label class="form-label">Personel Seçiniz</label>
                            <div class="dropdown"><button class="btn dropdown-toggle text-center" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="width: 400px;border-style: groove;border-color: var(--bs-btn-color);">Dropdown </button>
                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                            </div>
                        </div>
                        <div class="col"><label class="form-label">Varlık Seçiniz&nbsp;</label>
                            <div class="dropdown"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="width: 400px;border-style: groove;border-color: var(--bs-btn-color);">Dropdown </button>
                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="text-align: center;">
                        <div class="col"><label class="form-label">Açıklama</label><textarea class="form-control" style="height: 80.6px;"></textarea></div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="form-label">Kullanıma Başlama Tarihi</label>
                            <input runat="server" class="form-control" type="date" style="text-align: center;"/></div>
                    </div>
                </form>
                <div class="row">
                    <div class="col"><button class="btn btn-success btn-lg" type="button" style="margin-top: 10px;">Varlık Talebi Gönder</button></div>
                </div>
            </div>
        </div>
        <div class="card mt-4">
            <div class="card-body">
                <h4 style="color: rgb(16,221,110);">Mevcut Varlık Atamaları</h4>
                <div>
                    <table class="table">
                        <thead>
                            <tr class="text-center">
                                <th>Varlık<br/>Adı</th>
                                <th>Personel<br/>Adı</th>
                                <th class="text-center">Kullanmaya<br/>Başlama Tarihi</th>
                                <th class="text-center">Kullanım<br/>Bitiş Tarihi</th>
                                <th>Varlık<br/>Durumu</th>
                                <th class="text-center">İade<br/>Talebi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card mt-4">
            <div class="card-body">
                <h4 style="color: rgb(200,100,9);">Varlık İade / Atama Geçmişi</h4>
                <div class="dropdown"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button">Sırala</button>
                    <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                </div>
                <div>
                    <table class="table">
                        <thead style="text-align: center;">
                            <tr>
                                <th>Personel Adı</th>
                                <th>Talep Türü</th>
                                <th>Talep Detayları</th>
                                <th>Talep Durumu</th>
                                <th>Onaylayan<br/>Adı</th>
                                <th>Talep Tarihi</th>
                                <th>Onaylanma Tarihi</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card mt-4"></div>
    </div>
    </asp:Content>
