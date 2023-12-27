using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class AssetManagmentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void VarlikKaydetButton_Click(object sender, EventArgs e)
        {

        }
        protected void GuncelleButton_Click(object sender, EventArgs e)
        {

        }
        protected void SilButton_Click(object sender, EventArgs e)
        {

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