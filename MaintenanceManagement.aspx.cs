using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class MaintenanceManagement : System.Web.UI.Page
    {
        AssetManagmentEntities db = new AssetManagmentEntities();
        Transactions transaction = new Transactions();


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
            var gridViewMaintenance = from m in db.MaintenanceRecords
                                      join a in db.Assets on m.AssetID equals a.AssetID
                                      select new
                                      {
                                          m.MaintenanceRecordID,
                                          a.AssetName,
                                          m.MaintenanceDate,
                                          m.MaintenanceDetails,
                                          m.MaintenanceCost
                                      };

            GridViewMaintenanceTable2.DataSource = gridViewMaintenance.ToList();
            GridViewMaintenanceTable2.DataBind();

            var oneMonthLater = DateTime.Now.AddMonths(1);

            var maintenance = from m in db.MaintenanceRecords
                              join a in db.Assets on m.AssetID equals a.AssetID
                              where m.MaintenanceDate >= DateTime.Now && m.MaintenanceDate <= oneMonthLater
                              select new {
                                  m.MaintenanceRecordID,
                                  a.AssetName,
                                  m.MaintenanceDate,
                                  m.MaintenanceDetails,
                                  m.MaintenanceCost
                              };

            GridViewMaintenanceTable.DataSource = maintenance.ToList();
            GridViewMaintenanceTable.DataBind();

            var mrAssetName = from a in db.Assets
                              select new
                              {
                                  a.AssetName,
                                  a.AssetID
                              };
            DDLUrunInput.DataSource = mrAssetName.ToList();
            DDLUrunInput.DataTextField = "AssetName";
            DDLUrunInput.DataValueField = "AssetID";
            DDLUrunInput.DataBind();
            DDLUrunInput.Items.Insert(0, new ListItem("", "0"));
            DDLUrunInput.SelectedIndex = 0;


            var mrAssetName2 = (from a in db.Assets
                                join m in db.MaintenanceRecords on a.AssetID equals m.AssetID
                                select new
                                {
                                    a.AssetName,
                                    m.MaintenanceRecordID
                                }).AsEnumerable() // Veritabanından veriyi çek ve belleğe al
                               .Select(am => new
                               {
                                   veri = $"{am.AssetName} ({am.MaintenanceRecordID})",
                                   am.MaintenanceRecordID
                               }).ToList();

            DropDownListProductId.DataSource = mrAssetName2;
            DropDownListProductId.DataTextField = "veri";
            DropDownListProductId.DataValueField = "MaintenanceRecordID";
            DropDownListProductId.DataBind();
            DropDownListProductId.Items.Insert(0, new ListItem("", "0"));
            DropDownListProductId.SelectedIndex = 0;

        }

        protected async void BakimKaydiGirButton_Click(object sender, EventArgs e)
        {
            if (DDLUrunInput.SelectedIndex == 0 && string.IsNullOrEmpty(MaintenanceDateInput.Value) && string.IsNullOrEmpty(MaintenanceDetailsInput.Value))
            {
                UnsuccesfullyMessageText.InnerText = "Lütfen gerekli alanları doldurunuz.";
                UnsuccesfullyMessage.Visible = true;
                transaction.ShowAfterDelete(UnsuccesfullyMessage, this);
                return;
            }
          
            MaintenanceRecord mr = new MaintenanceRecord();

            mr.AssetID = Convert.ToInt32(DDLUrunInput.SelectedValue);
            mr.MaintenanceDate = Convert.ToDateTime(MaintenanceDateInput.Value);
            mr.MaintenanceDetails = MaintenanceDetailsInput.Value;
            if (!string.IsNullOrEmpty(MaintenanceCostInput1.Value) && !string.IsNullOrEmpty(MaintenanceCostInput2.Value))
                mr.MaintenanceCost = Convert.ToDecimal(MaintenanceCostInput1.Value + "," + MaintenanceCostInput2.Value);

            db.MaintenanceRecords.Add(mr);
            await db.SaveChangesAsync();
            VeriTemizle();
        }
        protected async void SilButton_Click(object sender, EventArgs e)
        {
            if (DropDownListProductId.SelectedIndex == 0 || string.IsNullOrEmpty(DropDownListProductId.Text))
            {
                DeletedAlertText.InnerText = "Lütfen gerekli alanları doldurunuz.";
                DeletedAlert.Visible = true;
                transaction.ShowAfterDelete(DeletedAlert, this);
                return;
            }
            int id = Convert.ToInt32(DropDownListProductId.SelectedValue);
            MaintenanceRecord mr = await db.MaintenanceRecords.FirstOrDefaultAsync(x => x.MaintenanceRecordID == id);
            db.MaintenanceRecords.Remove(mr);
            await db.SaveChangesAsync();
            DeletedAlertText.InnerText = "Bakım bilgileri silindi.";
            DeletedAlert.Visible = true;
            transaction.ShowAfterDelete(DeletedAlert, this);

            VeriGuncelle();
            VeriTemizle();
            VeriGetir();
        }
        protected async void BakimBilgiGuncelleButon_Click(object sender, EventArgs e)
        {
            if (DropDownListProductId.SelectedIndex == 0)
            {
                UpdatedAlertText.InnerText = "Lütfen gerekli alanları doldurunuz.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this);
                VeriTemizle();
                return;
            }
            int id = Convert.ToInt32(DropDownListProductId.SelectedValue);
            MaintenanceRecord mr = await db.MaintenanceRecords.FirstOrDefaultAsync(x => x.MaintenanceRecordID == id);

            mr.MaintenanceDate = DateTime.Parse(MaintenanceDateChangeInput.Value);
            mr.MaintenanceDetails = MaintenanceDetailsChangeInput.Value;
            decimal cost = decimal.Parse(MaintenanceCostChangeInput1.Value + "," + MaintenanceCostChangeInput2.Value);
            mr.MaintenanceCost = cost;
            await db.SaveChangesAsync();

            UpdatedAlertText.InnerText = "Bakım bilgileri güncellendi.";
            UpdatedAlert.Visible = true;
            transaction.ShowAfterDelete(UpdatedAlert, this);

            VeriTemizle();
            VeriGetir();
        }
        void VeriTemizle()
        {
            DDLUrunInput.SelectedIndex = 0;
            MaintenanceDateInput.Value = "";
            MaintenanceDetailsInput.Value = "";
            MaintenanceCostInput1.Value = "";
            MaintenanceCostInput2.Value = "";

            DropDownListProductId.SelectedIndex = 0;
            MaintenanceCostChangeInput1.Value = "";
            MaintenanceCostChangeInput2.Value = "";
            MaintenanceDateChangeInput.Value = "";
            MaintenanceDetailsChangeInput.Value = "";
        }
        protected void LinkButtonTab1_Click(object sender, EventArgs e)
        {
            UpdatedAlert.Visible = false;
            DeletedAlert.Visible = false;
            LinkButtonTab1.CssClass = "nav-link active";
            LinkButtonTab2.CssClass = "nav-link ";
            PanelTab1.Visible = true;
            PanelTab2.Visible = false;
        }
        protected void LinkButtonTab2_Click(object sender, EventArgs e)
        {
            SuccessMessage.Visible = false;
            UnsuccesfullyMessage.Visible = false;
            LinkButtonTab1.CssClass = "nav-link ";
            LinkButtonTab2.CssClass = "nav-link active";
            PanelTab2.Visible = true;
            PanelTab1.Visible = false;
        }
        protected  void ProductId_DDL(object sender, EventArgs e)
        {
             VeriGuncelle();
        }

        private void VeriGuncelle()
        {
            int id = Convert.ToInt32(DropDownListProductId.SelectedValue);

            if (id < 1)
            {
                UpdatedAlertText.InnerText = "Lütfen bir varlık seçiniz.";
                UpdatedAlert.Visible = true;
                transaction.ShowAfterDelete(UpdatedAlert, this);
                return;
            }
            MaintenanceRecord mr = db.MaintenanceRecords.FirstOrDefault(x => x.MaintenanceRecordID == id);
            if (mr != null)
            {
                var mrAssetName = from a in db.Assets
                                  where a.AssetID == id
                                  select a.AssetName;
                MaintenanceDateChangeInput.Value = mr.MaintenanceDate.ToString("yyyy-MM-dd");
                MaintenanceDetailsChangeInput.Value = mr.MaintenanceDetails;
                if (mr.MaintenanceCost != null)
                {
                    MaintenanceCostChangeInput1.Value = mr.MaintenanceCost.ToString().Split(',')[0];
                    MaintenanceCostChangeInput2.Value = mr.MaintenanceCost.ToString().Split(',')[1];
                }
                else
                {
                    MaintenanceCostChangeInput1.Value = "";
                    MaintenanceCostChangeInput2.Value = "";
                }

            }
        }


        protected void SearchChanged(object sender, EventArgs e)
        {
            var gridViewMaintenance = from m in db.MaintenanceRecords
                                      join a in db.Assets on m.AssetID equals a.AssetID
                                      where a.AssetName.StartsWith(SearchMaintenance.Text)
                                      select new
                                      {
                                          m.MaintenanceRecordID,
                                          a.AssetName,
                                          m.MaintenanceDate,
                                          m.MaintenanceDetails,
                                          m.MaintenanceCost
                                      };

            GridViewMaintenanceTable2.DataSource = gridViewMaintenance.ToList();
            GridViewMaintenanceTable2.DataBind();

        }
    }
}