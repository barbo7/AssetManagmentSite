using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class AssetManagmentPage : System.Web.UI.Page
    {
        AssetManagmentEntities db = new AssetManagmentEntities();
        Transactions transaction = new Transactions();
        List<string> Durumu = new List<string>() { "", "Boşta", "Arızalı" };


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VeriTemizle();
                VeriGetir();
            }

        }
        private void VeriGetir()
        {
            var assetList = db.Assets.ToList();
            GridViewAssetList.DataSource = assetList;
            GridViewAssetList.DataBind();

            var maintenanceList = from mr in db.MaintenanceRecords
                                  join a in db.Assets on mr.AssetID equals a.AssetID
                                  select new
                                  {
                                      a.AssetName,
                                      mr.MaintenanceDate,
                                      mr.MaintenanceDetails,
                                      mr.MaintenanceCost
                                  };
            GridViewVarliklarBakimListesi.DataSource = maintenanceList.ToList();
            GridViewVarliklarBakimListesi.DataBind();

            var assetNames = from a in db.Assets
                             select new
                             {
                                 a.AssetName,
                                 a.AssetID
                             };
            DropDownListVarlikListesiAd.DataSource = assetNames.ToList();
            DropDownListVarlikListesiAd.DataTextField = "AssetName";
            DropDownListVarlikListesiAd.DataValueField = "AssetID";
            DropDownListVarlikListesiAd.DataBind();


            DropDownListVarlikListesiAd.Items.Insert(0, new ListItem("", "-1"));


            DropDownListVarlikDurumChangeInput.DataSource = Durumu;
            DropDownListVarlikDurumChangeInput.DataBind();

            var MaintenanceDatas = from m in db.MaintenanceRecords
                                   join a in db.Assets on m.AssetID equals a.AssetID
                                   select new
                                   {
                                       a.AssetName,
                                       m.MaintenanceDate,
                                       m.MaintenanceDetails,
                                       m.MaintenanceCost
                                   };

            GridViewVarliklarBakimListesi.DataSource = MaintenanceDatas.ToList();
            GridViewVarliklarBakimListesi.DataBind();
        }
        protected void SearchChanged(object sender, EventArgs e)
        {
            var assetList = db.Assets.Where(a => a.AssetName.StartsWith(SearchAsset.Text)).ToList();
            GridViewAssetList.DataSource = assetList;
            GridViewAssetList.DataBind();
        }
        private void VeriTemizle()
        {
            AssetNameInput.Value = "";
            AssetLocationInput.Value = "";
            ProductPriceInput1.Value = "";
            ProductPriceInput2.Value = "00";
            AssetBoughtDateInput.Value = "";
            AssetBoughtChangeInput.Value = "";
            AssetNameChangeInput.Value = "";
            AssetLocationChangeInput.Value = "";
            ProductPriceChangeInput1.Value = "";
            ProductPriceChangeInput2.Value = "00";
        }

        protected async void VarlikKaydetButton_Click(object sender, EventArgs e)
        {
            bool AssetNameDuplicate = await db.Assets.AnyAsync(x => x.AssetName == AssetNameInput.Value);

            if (AssetNameDuplicate)
            {
                UnsuccesfullyMessageText.InnerText = "Bu isimde bir varlık zaten var.";
                UnsuccesfullyMessage.Visible = true;
                transaction.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
                return;
            }
            else if (AssetNameInput.Value == "" || AssetLocationInput.Value == "" || ProductPriceInput1.Value == "" || ProductPriceInput2.Value == "" || AssetBoughtDateInput.Value == "")
            {
                UpdatedAlertText.InnerText = "Lütfen tüm alanları doldurunuz.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this.Page);
                return;
            }
            try
            {
                Asset asset = new Asset()
                {
                    AssetName = AssetNameInput.Value,
                    AssetLocation = AssetLocationInput.Value,
                    AssetStatus = VarlikDurumuInput.Text,
                    AssetPrice = decimal.Parse(ProductPriceInput1.Value + "," + ProductPriceInput2.Value),
                    AssetBoughtDate = Convert.ToDateTime(AssetBoughtDateInput.Value)
                };
                db.Assets.Add(asset);
                await db.SaveChangesAsync();
                VeriGetir();
                VeriTemizle();
                SuccessMessageText.InnerText = "Varlık başarıyla eklendi.";
                SuccessMessage.Visible = true;
                transaction.ShowAfterDelete(SuccessMessage, this.Page);
            }
            catch (Exception ex)
            {
                UnsuccesfullyMessageText.InnerText = ex.Message;
                UnsuccesfullyMessage.Visible = true;
                transaction.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }
        }
        protected async void DropDownListVarlikListesiAd_SelectedIndexChanged(object sender, EventArgs e)
        {
            int AssetId = Convert.ToInt32(DropDownListVarlikListesiAd.SelectedValue);
            if (AssetId <= 0)
            {
                UpdatedAlertText.InnerText = "Lütfen bir varlık seçiniz.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this.Page);
                return;
            }


            var asset = await db.Assets.FindAsync(AssetId);
            AssetNameChangeInput.Value = asset.AssetName;
            AssetLocationChangeInput.Value = asset.AssetLocation;
            ProductPriceChangeInput1.Value = asset.AssetPrice.ToString().Split(',')[0];
            ProductPriceChangeInput2.Value = asset.AssetPrice.ToString().Split(',')[1];
            AssetBoughtChangeInput.Value = asset.AssetBoughtDate.ToString("yyyy-MM-dd");
            DropDownListVarlikDurumChangeInput.Items.Clear();
            DropDownListVarlikDurumChangeInput.Items.Add(new ListItem(asset.AssetStatus, "0")); // Yeni değeri DropDownList'e ekle
            DropDownListVarlikDurumChangeInput.Items.FindByValue("0").Selected = true; // Yeni değeri seçili hale getir
        }
        protected async void GuncelleButton_Click(object sender, EventArgs e)
        {
            int AssetId = Convert.ToInt32(DropDownListVarlikListesiAd.SelectedValue);
            if (AssetId <= 0)
            {
                UpdatedAlertText.InnerText = "Lütfen bir varlık seçiniz.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this.Page);
                return;
            }
            else if (string.IsNullOrEmpty(AssetBoughtChangeInput.Value) || string.IsNullOrEmpty(AssetNameChangeInput.Value) || string.IsNullOrEmpty(AssetLocationChangeInput.Value) || string.IsNullOrEmpty(ProductPriceChangeInput1.Value) || string.IsNullOrEmpty(ProductPriceChangeInput2.Value))
            {
                UpdatedAlertText.InnerText = "Lütfen tüm alanları doldurunuz.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this.Page);
                return;
            }
            try
            {
                var asset = await db.Assets.FindAsync(AssetId);

                asset.AssetBoughtDate = Convert.ToDateTime(AssetBoughtChangeInput.Value);
                asset.AssetName = AssetNameChangeInput.Value;
                asset.AssetPrice = Convert.ToDecimal(ProductPriceChangeInput1.Value + "," + ProductPriceChangeInput2.Value);
                asset.AssetBoughtDate = Convert.ToDateTime(AssetBoughtChangeInput.Value);
                asset.AssetStatus = DropDownListVarlikDurumChangeInput.SelectedValue.ToString();
                asset.AssetLocation = AssetLocationChangeInput.Value;
                await db.SaveChangesAsync();
                VeriGetir();
                VeriTemizle();
                UpdatedAlertText.InnerText = "Varlık başarıyla güncellendi.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this.Page);
            }
            catch (Exception)
            {
                UpdatedAlertText.InnerText = "Varlık güncellenemedi.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this.Page);
            }
        }
        protected async void SilButton_Click(object sender, EventArgs e)
        {
            int AssetId = Convert.ToInt32(DropDownListVarlikListesiAd.SelectedValue);
            if (AssetId <= 0)
            {
                DeletedAlertText.InnerText = "Lütfen bir varlık seçiniz.";
                DeletedAlert.Visible = true;
                transaction.ShowAfterDelete(DeletedAlert, this.Page);
                return;
            }
            try
            {
                var asset = await db.Assets.FindAsync(AssetId);
                db.Assets.Remove(asset);
                await db.SaveChangesAsync();
                VeriGetir();
                VeriTemizle();
                DeletedAlertText.InnerText = "Varlık başarıyla silindi!.";
                DeletedAlert.Visible = true;
                transaction.ShowAfterDelete(DeletedAlert, this.Page);
            }
            catch (Exception)
            {
                DeletedAlertText.InnerText = "Varlık Silinemedi.";
                DeletedAlert.Visible = true;
                transaction.ShowAfterDelete(DeletedAlert, this.Page);
            }
        }
        protected void LinkButtonTab1_Click(object sender, EventArgs e)
        {
            LinkButtonTab1.CssClass = "nav-link active";
            LinkButtonTab2.CssClass = "nav-link";
            TabPanel1.Visible = true;
            TabPanel2.Visible = false;
        }
        protected void LinkButtonTab2_Click(object sender, EventArgs e)
        {
            LinkButtonTab1.CssClass = "nav-link ";
            LinkButtonTab2.CssClass = "nav-link active";
            TabPanel2.Visible = true;
            TabPanel1.Visible = false;
        }
    }
}
