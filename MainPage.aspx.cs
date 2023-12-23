using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class MainPagee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AssetManagmentEntities assetManagmentEntities = new AssetManagmentEntities();
                //Inventory inventorie = new Inventory();
                //inventorie.ProductAmount = 500;
                //inventorie.ProductName = "Kağıt";
                //inventorie.ReorderLevel = 200;
                //inventorie.ProductPrice = 100;

                //assetManagmentEntities.Inventories.Add(inventorie);
                //assetManagmentEntities.SaveChanges();
                var productList = from inv in assetManagmentEntities.Inventories
                                  select new {inv.ProductName,inv.ProductAmount,inv.ProductPrice,inv.ReorderLevel }; 

                GridViewLowStockTable.DataSource = productList.ToList();
                GridViewLowStockTable.DataBind();

                //Employee employee = new Employee(); 
                //employee.EmployeeID = 1;
                //employee.EmployeeName = "Bora";
                //employee.EmployeeDepartment= "bilişim";
                //employee.EmployeeRole = "yazılım";
                //employee.EmployeeDetails = "test";


                //Request req = new Request();
                //req.EmployeeID= 1;
                //req.RequestType = "DENEME";
                //req.RequestDetails = "uZATMA";
                //req.RequestDate = DateTime.Now;
                //req.RequestStatus = "Onay Bekliyor";

                //assetManagmentEntities.Employees.Add(employee);
                //assetManagmentEntities.Requests.Add(req);
                //assetManagmentEntities.SaveChanges();

                var requuestList = from r in assetManagmentEntities.Requests
                                   join em in assetManagmentEntities.Employees on r.EmployeeID equals em.EmployeeID
                                   select new {em.EmployeeName,r.RequestID, r.RequestType, r.RequestDetails, r.RequestDate, r.RequestStatus };

                //Maintenance Record alanında tarihe göre veri çekilmesi gerekiyor.


                //GridView'e veri kaynağını atayın ve bağlayın
                GridViewConfirmations.DataSource = requuestList.ToList();
                GridViewConfirmations.DataBind();
            }
           

        }
        protected void GridViewLowStockTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Satırdaki AvailableQuantity ve EssentialQuantity değerlerini al
                int ProductAmount = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ProductAmount"));
                int ReorderLevel = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ReorderLevel"));

                decimal reorderAlarm = ReorderLevel / 2;


                // StockStatus Label'ını bul
                Label stockStatusLabel = e.Row.FindControl("StockStatus") as Label;

                if (stockStatusLabel != null)
                {
                    // Stok durumuna göre Label'ın metnini ayarla
                    stockStatusLabel.Text = ProductAmount <= reorderAlarm ? "Stok Az" : "Stok Yeterli";
                    stockStatusLabel.ForeColor = ProductAmount <= reorderAlarm ? System.Drawing.Color.Black : System.Drawing.Color.White;
                    stockStatusLabel.BackColor = ProductAmount <= reorderAlarm ? System.Drawing.Color.Red : System.Drawing.Color.Green;
                    stockStatusLabel.Font.Size = 11;
                }
            }
        }

        protected void GridViewConfirmations_RowDataBound  (object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("RequestStatus");
                if (lblStatus != null)//şartı detaylandırmak lazım
                {
                    // Verilere bağlayarak Label içeriğini ve diğer özellikleri ayarlayın
                    //Product product = (Product)e.Row.DataItem; // Product, Entity Framework modelinizin tipi olmalıdır
                    //lblStatus.Text = product.Status; // Status verisini burada ayarlayın
                    lblStatus.ForeColor = System.Drawing.Color.White; // Metin rengi
                    lblStatus.Font.Size = 11;
                    lblStatus.BorderColor = System.Drawing.Color.YellowGreen;//Değişecek
                    lblStatus.BackColor = System.Drawing.Color.DarkOrange; // Arka plan rengi
                }
            }
        }

        protected void btn_onayla_Click(object sender, EventArgs e)
        {
            IsaretliMi();
        }

        private void IsaretliMi()
        {
            foreach (GridViewRow gvrow in GridViewConfirmations.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox") as CheckBox;
                if (checkbox.Checked)
                {
                    var reqID = gvrow.FindControl("LabelRequestID") as Label;//Buradan gelen veriyi istediğim şekilde manipüle edebilirim.
                }
            }
        }
    }
}