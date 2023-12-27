using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class MaintenanceManagement : System.Web.UI.Page
    {
        AssetManagmentEntities entities = new AssetManagmentEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BakimKaydiGirButton_Click(object sender, EventArgs e)
        {
         
        }
        protected void BakimBilgiGuncelleButon_Click(object sender, EventArgs e)
        {
            
        }
        protected void LinkButtonTab1_Click(object sender, EventArgs e)
        {
            LinkButtonTab1.CssClass = "nav-link active";
            LinkButtonTab2.CssClass = "nav-link ";
            PanelTab1.Visible = true;
            PanelTab2.Visible = false;
        }
        protected void LinkButtonTab2_Click(object sender, EventArgs e)
        {
            LinkButtonTab1.CssClass = "nav-link ";
            LinkButtonTab2.CssClass = "nav-link active";
            PanelTab2.Visible = true;
            PanelTab1.Visible = false;
        }
        protected void ProductId_DDL(object sender, EventArgs e)
        {
           
        }
        protected void SearchChanged(object sender, EventArgs e)
        {
            //var urun = entities.MaintenanceRecords.Where(x => x..StartsWith(SearchMaintenance.Text)).ToList();
            //GridViewMaintenanceTable.DataSource = urun;
            //GridViewMaintenanceTable.DataBind();
        }
    }
}