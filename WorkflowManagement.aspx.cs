using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class WorkflowManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Task> tasks = new List<Task>
            {
                // Verileri buraya ekleyin
            };
            if (!IsPostBack)
            {
                // GridView'ı veri kaynağına bağlama
                GridViewMevcutGorevler.DataSource = tasks; // tasks, yukarıda oluşturduğunuz veri listesidir.
                GridViewMevcutGorevler.DataBind();
            }
        }

    }
}