<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InventoryManagementPage.aspx.cs" Inherits="AssetManagmentSite.InventoryManagementPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml"  data-bs-theme="light">
<head runat="server">
    <title>Envanter yönetim Sayfası</title>
    	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"/>
	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap"/>

</head>
<body class="text-start" style="color: rgb(124,127,145);transform: skew(0deg);">
    <div>
	<div class="container">
		<div class="row">
			<div class="col-md-6"><label class="col-form-label fs-4"
					style="padding-top: 50px;border-color: rgb(13,41,210);color: rgb(213,44,33);">Stok
					Bilgisi</label></div>
			<div class="col-md-6"><input class="float-end" type="search"
					style="border-color: var(--bs-body-color);padding-bottom: 0px;margin-bottom: 10px;margin-top: 40px;"
					placeholder="Ürün Ara" autocomplete="on"/></div>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th style="text-align: center;">Ürün ID</th>
						<th style="text-align: center;">Ürün Adı</th>
						<th style="text-align: center;">Ürün Miktarı</th>
						<th style="text-align: center;">Yeniden Sipariş Seviyesi</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ID1</td>
						<td>Urün adi1</td>
						<td>Ürün Miktari1</td>
						<td>Yeniden Siparis Seviyesi1</td>
					</tr>
					<tr></tr>
					<tr></tr>
				</tbody>
			</table>
		</div>
		<hr/>
	</div>
</div>
<div>
	<form id="form1" runat="server" class="border rounded-0 shadow-sm">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12 col-xl-12">
					<h4 class="text-start" style="color: var(--bs-primary-text-emphasis);">Envanter İşlemleri</h4>
					<div>
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item" role="presentation"><a class="nav-link" role="tab"
									data-bs-toggle="tab" href="#tab-3" style="color: rgb(45,89,218);">Stok Takip</a>
							</li>
							<li class="nav-item" role="presentation"><a class="nav-link active" role="tab"
									data-bs-toggle="tab" href="#tab-1" style="color: rgb(65,208,29);">Envanter Veri
									Girişi</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link" role="tab"
									data-bs-toggle="tab" href="#tab-2" style="color: rgb(171,15,210);">Envanter Veri
									Güncelle</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" role="tabpanel" id="tab-1">
								<div class="row">
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5"><label class="form-label">Ürün
											Adı</label><input class="border-secondary form-control form-control-sm"
											type="text" placeholder="Ürünün adı." style="margin-bottom: 10px;"
											inputmode="latin-name" maxlength="100"/></div>
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5"><label class="form-label">Ürün
											Adedi</label><input
											class="border-secondary form-control form-control-sm" type="text"
											placeholder="Ürünün mevcut miktarı." inputmode="numeric"
											style="margin-bottom: 10px;" minlength="1"/></div>
								</div>
								<div class="row">
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5"><label
											class="form-label">Yeniden Sipariş Seviyesi</label><input
											class="border-secondary form-control" type="text"
											placeholder="Yeniden sipariş için gereken minimum miktar."
											style="margin-bottom: 10px;" inputmode="numeric" minlength="1"/></div>
									<div class="col" style="text-align: right;"><button
											class="btn btn-primary btn-lg" type="button"
											style="margin-top: 20px;">Kaydet</button></div>
								</div>
							</div>
							<div class="tab-pane" role="tabpanel" id="tab-2">
								<div class="row">
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
										<label class="form-label">İşlem yapmak için Ürün ID seçiniz</label>
										<div class="dropdown"><button
												class="btn dropdown-toggle fw-normal text-center text-sm-center text-md-center link-body-emphasis border-1 border-secondary"
												aria-expanded="false" data-bs-toggle="dropdown" type="button"
												style="color: var(--bs-body-color);--bs-body-font-size: 0rem;--bs-body-font-weight: normal;margin-right: 0px;margin-bottom: 10px;margin-left: 0px;padding-left: 100px;padding-right: 100px;">Product
												Id</button>
											<div class="dropdown-menu"><a class="dropdown-item" href="#">First
													Item</a><a class="dropdown-item" href="#">Second Item</a><a
													class="dropdown-item" href="#">Third Item</a><a
													class="dropdown-item" href="#">Menu Item</a></div>
										</div>
									</div>
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
										<label class="form-label">Ürün Adı</label><input
											class="border-secondary form-control form-control-sm" type="text"
											inputmode="latin-name" style="margin-bottom: 10px;"/></div>
								</div>
								<div class="row">
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
										<label class="form-label">Ürün Miktarı</label><input
											class="border-secondary form-control form-control-sm" type="text"
											style="margin-bottom: 10px;" inputmode="numeric"/></div>
									<div class="col-md-6 col-lg-6 col-xl-6 col-xxl-5" style="text-align: center;">
										<label class="form-label" style="text-align: center;">Yeniden Sipariş
											Seviyesi</label><input
											class="border-secondary form-control form-control-sm" type="text"
											inputmode="numeric" style="margin-bottom: 10px;"/></div>
								</div>
								<div class="row">
									<div class="col"><button class="btn btn-success btn-lg fs-5 d-inline"
											type="button"
											style="position: static;display: block;transform: rotate(0deg) scale(0.88);padding-top: 6px;color: var(--bs-border-color);margin-top: 10px;margin-left: 10px;">Güncelle</button>
									</div>
								</div>
							</div>
							<div class="tab-pane" role="tabpanel" id="tab-3">
								<div class="row">
									<div class="col-md-3 col-lg-2"></div>
									<div class="col-md-3 col-lg-2"></div>
									<div class="col-md-6 col-lg-8">
										<div class="progress border rounded-pill" style="text-align: right;">
											<div class="progress-bar bg-success progress-bar-animated"
												aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
												style="width: 80%;">80%</div>
										</div>
										<div class="progress border rounded-pill" style="text-align: right;">
											<div class="progress-bar bg-warning progress-bar-animated"
												aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"
												style="width: 50%;">50%</div>
										</div>
										<div class="progress border rounded-pill" style="text-align: right;">
											<div class="progress-bar bg-danger progress-bar-animated"
												aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
												style="width: 20%;">20%</div>
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
</div>
	<script src="Assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
