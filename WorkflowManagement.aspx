<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkflowManagement.aspx.cs" Inherits="AssetManagmentSite.WorkflowManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
    <title>Görev ve Proje Yönetimi</title>
    <link rel="stylesheet" href="Assets/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
  <div class="container">
        <h2 class="my-4"><span style="color: rgb(38, 96, 247);">İş Akışı ve Görev Yönetim</span></h2>
        <section></section>
        <section></section>
        <section class="text-center">
            <div class="row">
                <div class="col text-end">
                    <h2 class="text-start section-header"><span style="color: rgb(239, 48, 197);">Mevcut Görevlerin Son Durumları</span></h2>
                    <input type="search" placeholder="Departmana Göre Ara" style="margin-bottom: 10px;"/>
                    <div style="text-align: center;">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Görev Adı</th>
                                    <th>Adım</th>
                                    <th>Departman</th>
                                    <th>Durum</th>
                                    <th>Başlangıç Tarihi</th>
                                    <th>Tamamlanma Tarihi</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <h2 class="section-header"><span style="color: rgb(247, 41, 66);">Devam Eden Görev Güncelleme</span></h2>
            <form><label class="form-label" for="workflowId">Devam etmek için iş akışı ismini seçiniz</label>
                <div class="dropdown" style="text-align: center;border-style: groove;"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="height: 50.6px;width: 500.475px;border-style: groove;">İş Akış İsmi Seçiniz</button>
                    <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                </div>
                <div class="form-group"><label class="form-label" for="workflowStep">Adım</label></div>
                <div class="dropdown" style="text-align: center;border-style: groove;"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="height: 50.6px;width: 500.475px;border-style: groove;">İşlem Yapacağınız Adımı Seçiniz</button>
                    <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                </div>
                <div class="form-group"><label class="form-label" for="workflowStatus">Durum</label><select class="form-control" id="workflowStatus" style="text-align: center;">
                        <option value="">Devam Ediyor</option>
                        <option value="">Tamamlandı</option>
                        <option value="">Bekliyor</option>
                    </select></div>
                <div class="form-group"><label class="form-label" for="workflowStartDate">Başlangıç Tarihi</label>
                    <input class="form-control form-control" type="date" id="workflowStartDate" style="text-align: center;"/></div>
                <div class="form-group"><label class="form-label" for="workflowEndDate">Tamamlanma Tarihi</label>
                    <input class="form-control form-control" type="date" id="workflowEndDate" style="text-align: center;"/>
                    <div class="row">
                        <div class="col" style="text-align: center;"><button class="btn btn-warning fs-4 text-center" type="button" style="background: rgb(255,186,7);color: rgb(255,255,255);margin-top: 10px;">Görev Güncelle</button></div>
                    </div>
                </div>
            </form>
        </section>
        <div class="col" style="text-align: right;">
            <h2 class="text-start section-header"><span style="color: rgb(125, 132, 100);">Görev Listesi</span></h2>
            <input class="form-control-sm" type="search" placeholder="Görev ara" style="width: 250px;text-align: center;font-size: 20px;"/>
            <div style="text-align: center;">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Başlık</th>
                            <th>İlişkili Departman</th>
                            <th>Durum</th>
                            <th>Açıklama</th>
                            <th>Adımlar</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <section></section>
        <form class="text-center">
            <h2 class="text-start section-header"><span style="color: rgb(245, 140, 16);">Görev Ekle</span></h2>
            <div class="text-start form-group"><label class="form-label" for="taskTitle">Görev Başlığı</label>
                <input class="form-control form-control" type="text" id="taskTitle" placeholder="Görev Adı" style="text-align: center;"/></div>
            <div class="text-start form-group"><label class="form-label" for="taskDescription">Açıklama</label><textarea class="form-control form-control" id="taskDescription" placeholder="Görev Açıklaması" style="height: 80.6px;text-align: center;"></textarea></div>
            <div class="text-start form-group"><label class="form-label" for="taskDescription">Adımlar</label><textarea class="form-control form-control" id="taskDescription-1" placeholder="İzlenecek Adımlar(Satır Satır Giriniz Shift+Enter özelliğini kullanarak.)" style="height: 80.6px;text-align: center;"></textarea></div>
            <div class="text-start form-group"><label class="form-label" for="taskStartDate">Başlangıç Tarihi</label>
                <input class="form-control form-control" type="date" id="taskStartDate"/></div>
            <div class="text-center form-group"><label class="form-label" for="taskAssignee">Sorumlu Kişi/Ekip</label>
                <div class="dropdown" style="border-style: groove;"><button class="btn dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button" style="width: 400px;height: 40.6px;">Departman Seçiniz</button>
                    <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                </div>
            </div><button class="btn btn-success btn-lg" style="margin-bottom: 10px;" type="submit">Görev Ekle</button>
        </form>
    </div>
</body>
</html>
