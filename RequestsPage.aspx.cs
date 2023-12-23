using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class RequestsPage : System.Web.UI.Page
    {
        AssetManagmentEntities entities = new AssetManagmentEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TalepGonderButton_Click(object sender, EventArgs e)
        {
            //Request req = new Request()
            //{
            //    EmployeeID = 1,
            //    RequestType = TalepTuruInput.Value,
            //    RequestDetails = TalepDetayInput.Value,
            //    RequestDate = DateTime.Now,
            //    RequestStatus = "Onay Bekliyor"
            //};
            //entities.Requests.Add(req);
            //entities.SaveChanges();
        }
    }
}