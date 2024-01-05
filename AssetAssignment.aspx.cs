using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class AssetAssignment : System.Web.UI.Page
    {
        AssetManagmentEntities db = new AssetManagmentEntities();
        Transactions transactions = new Transactions();
        List<string> assetStats = new List<string>() {  "Kullanimda", "İade Edildi" };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VeriListele();
            }
        }

        private void VeriListele()
        {
            var personelList = from emp in db.Employees
                               select new
                               {
                                   emp.EmployeeID,
                                   emp.EmployeeName
                               };
            DropDownListPersonelListesi.DataSource = personelList.ToList();
            DropDownListPersonelListesi.DataTextField = "EmployeeName";
            DropDownListPersonelListesi.DataValueField = "EmployeeID";
            DropDownListPersonelListesi.DataBind();
            DropDownListPersonelListesi.Items.Insert(0, new ListItem("", "-1"));

            var assetList = from a in db.Assets
                            where a.AssetStatus == "Boşta" || a.AssetStatus == "Boşta - İade Edildi"
                            select new
                            {
                                a.AssetID,
                                a.AssetName
                            };
            DropDownListVarlikListesi.DataSource = assetList.ToList();
            DropDownListVarlikListesi.DataTextField = "AssetName";
            DropDownListVarlikListesi.DataValueField = "AssetID";
            DropDownListVarlikListesi.DataBind();
            DropDownListVarlikListesi.Items.Insert(0, new ListItem("", "-1"));

            var personelListIade = from emp in db.Employees
                                   join usageR in db.UsageRegistrations on emp.EmployeeID equals usageR.PersonelID
                                   where usageR.Status == "Kullanımda" 
                                   select new { emp.EmployeeID, emp.EmployeeName };
            DropDownListPersonelAdlariIade.DataSource = personelListIade.ToList().Distinct();
            DropDownListPersonelAdlariIade.DataTextField = "EmployeeName";
            DropDownListPersonelAdlariIade.DataValueField = "EmployeeID";
            DropDownListPersonelAdlariIade.DataBind();
            DropDownListPersonelAdlariIade.Items.Insert(0, new ListItem("", "-1"));

            var usageTable = from usage in db.UsageRegistrations
                             join emp in db.Employees on usage.PersonelID equals emp.EmployeeID
                                join asset in db.Assets on usage.AssetID equals asset.AssetID
                                select new
                                {
                                    asset.AssetName,
                                    emp.EmployeeName,
                                    usage.UsageDateStart,
                                    usage.UsageDateEnd,
                                    usage.Status
                                };
            GridViewAssetAssignment.DataSource = usageTable.ToList();
            GridViewAssetAssignment.DataBind();

            DropDownListAssetAssignmentChoices.DataSource = assetStats;
            DropDownListAssetAssignmentChoices.DataBind();
            DropDownListAssetAssignmentChoices.Items.Insert(0, new ListItem("", "-1"));
        }

        protected async void VarlikEkleButton_Click(object sender, EventArgs e)
        {
            int employeeId = Convert.ToInt32(DropDownListPersonelListesi.SelectedValue);
            int assetId = Convert.ToInt32(DropDownListVarlikListesi.SelectedValue);

            if (employeeId <= 0 || assetId <= 0)
            {
                UnsuccesfullyMessageText.InnerText = "Lütfen Personel veya Varlık adını boş bırakmayınız.";

                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
                return;
            }

            try
            {
                UsageRegistration usageRegistration = new UsageRegistration()
                {
                    AssetID = assetId,
                    PersonelID = employeeId,
                    UsageDateStart = Convert.ToDateTime(StartDateInput.Value),
                    UsageDateEnd = null,
                    Status = "Kullanımda"
                };
                db.UsageRegistrations.Add(usageRegistration);

                Asset assett = await db.Assets.FindAsync(assetId);
                assett.AssetStatus = "Kullanımda";
                await db.SaveChangesAsync();

                VeriListele();
                //VeriTemizle();
                SuccessMessageText.InnerText = "Varlık başarıyla atandı!";
                SuccessMessage.Visible = true;
                transactions.ShowAfterDelete(SuccessMessage, this.Page);
            }
            catch (Exception)
            {
                UnsuccesfullyMessageText.InnerText = "Varlık atanırken bir sıkıntı oluştu.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }

        }
        protected async void IadeButton_Click(object sender, EventArgs e)
        {
            int employeeId = Convert.ToInt32(DropDownListPersonelAdlariIade.SelectedValue);
            int assetId = Convert.ToInt32(DropDownListVarlikListesiIade.SelectedValue);
            if (employeeId <= 0 || assetId <= 0)
            {
                DeletedAlertText.InnerText = "Lütfen Personel veya Varlık adını boş bırakmayınız.";

                DeletedAlert.Visible = true;
                transactions.ShowAfterDelete(DeletedAlert, this.Page);
                return;
            }
            try
            {
                var usageR = await db.UsageRegistrations.Where(x => x.PersonelID == employeeId && x.AssetID == assetId).Select(x => x.UsageRegistrationID).FirstOrDefaultAsync();
                if (usageR > 0)
                {
                    UsageRegistration usageRegistration = await db.UsageRegistrations.FindAsync(usageR);
                    usageRegistration.UsageDateEnd = Convert.ToDateTime(UsageEndDateIade.Value);
                    usageRegistration.Status = "İade Edildi";
                    await db.SaveChangesAsync();

                    Asset assett = db.Assets.Find(assetId);
                    assett.AssetStatus = "Boşta - İade Edildi";
                    db.SaveChanges();

                    VeriListele();
                    //VeriTemizle();
                    SuccessMessageText.InnerText = "Varlık başarıyla iade edildi!";
                    SuccessMessage.Visible = true;
                    transactions.ShowAfterDelete(SuccessMessage, this.Page);
                }
                else
                {
                    UpdatedAlertText.InnerText = "Varlık atanmamış!";
                    UpdatedAlert.Visible = true;
                    transactions.ShowAfterDelete(UpdatedAlert, this.Page);
                }
            }
            catch (Exception)
            {
                UnsuccesfullyMessageText.InnerText = "Varlık iade edilirken bir sıkıntı oluştu.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }

        }

        protected void DDL_PersonelAdlariIade(object sender, EventArgs e)
        {
            int employeeId = Convert.ToInt32(DropDownListPersonelAdlariIade.SelectedValue);
            if (employeeId <= 0)
            {
                return;
            }
            var assetListIade = from usageR in db.UsageRegistrations
                                join a in db.Assets on usageR.AssetID equals a.AssetID
                                where usageR.PersonelID == employeeId
                                select new { a.AssetID, a.AssetName };
            DropDownListVarlikListesiIade.DataSource = assetListIade.ToList();
            DropDownListVarlikListesiIade.DataTextField = "AssetName";
            DropDownListVarlikListesiIade.DataValueField = "AssetID";
            DropDownListVarlikListesiIade.DataBind();
            if(DropDownListVarlikListesiIade.Items.Count > 0)
            {
                DDL_VarlikListesiIade(sender, e);
            }
        }
        protected  void DDL_VarlikListesiIade(object sender, EventArgs e)
        {
            int employeeId = Convert.ToInt32(DropDownListPersonelAdlariIade.SelectedValue);
            int assetId = Convert.ToInt32(DropDownListVarlikListesiIade.SelectedValue);
            if (employeeId <= 0 || assetId <= 0)
            {
                return;
            }

            var usageDatas =  db.UsageRegistrations.Where(x => x.PersonelID == employeeId && x.AssetID == assetId).Select(u => u.UsageRegistrationID).FirstOrDefault();

            UsageRegistration usageData =  db.UsageRegistrations.Find(usageDatas);
            UsageStartDateIade.Value = usageData.UsageDateStart.ToString("yyyy-MM-dd");
            UsageEndDateIade.Value = DateTime.Now.ToString("yyyy-MM-dd");
        }

        protected void DDL_AssetAssignmentChoices(object sender, EventArgs e)
        {
            var usageReg = from usageR in db.UsageRegistrations
                           join emp in db.Employees on usageR.PersonelID equals emp.EmployeeID
                            join asset in db.Assets on usageR.AssetID equals asset.AssetID
                            where usageR.Status == DropDownListAssetAssignmentChoices.SelectedItem.Text
                            select new
                            {
                                 asset.AssetName,
                                 emp.EmployeeName,
                                 usageR.UsageDateStart,
                                 usageR.UsageDateEnd,
                                 usageR.Status
                            };
            GridViewAssetAssignment.DataSource = usageReg.ToList();
            GridViewAssetAssignment.DataBind();
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
            TabPanel1.Visible = false;
            TabPanel2.Visible = true;
        }

    }
}