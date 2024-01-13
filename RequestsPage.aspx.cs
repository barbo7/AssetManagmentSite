using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Util;

namespace AssetManagmentSite
{
    public partial class RequestsPage : System.Web.UI.Page
    {
        AssetManagmentEntities entities = new AssetManagmentEntities();
        Transactions transactions = new Transactions();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                VeriListele();
        }
        private void VeriListele()
        {
            var personelList = from p in entities.Employees
                               select new
                               {
                                   p.EmployeeID,
                                   p.EmployeeName
                               };
            DropDownListEmployee.DataSource = personelList.ToList();
            DropDownListEmployee.DataTextField = "EmployeeName";
            DropDownListEmployee.DataValueField = "EmployeeID";
            DropDownListEmployee.DataBind();
            DropDownListEmployee.Items.Insert(0, new ListItem("", "-1"));
            string[] requestTypies = { "", "Varlık Talepleri", "Teknik Destek ve Bakım Talepleri", "Proje Kaynak Talepleri", "Raporlama ve Veri Analizi Talepleri" };
            DropDownListRequestType.DataSource = requestTypies;
            DropDownListRequestType.DataBind();

            TabloYenile();
        }

        private void TabloYenile()
        {
            var requestList = entities.Requests.ToList();
            GridViewRequests.DataSource = requestList;
            GridViewRequests.DataBind();
        }

        protected async void TalepGonderButton_Click(object sender, EventArgs e)
        {
            int employeeId = Convert.ToInt32(DropDownListEmployee.SelectedValue);
            string requestType = DropDownListRequestType.SelectedValue;
            if (employeeId <= 0 || string.IsNullOrEmpty(requestType) || string.IsNullOrEmpty(description.Value))
            {
                UnsuccesfullyMessageText.InnerText = "Bilgileri boş geçmeyiniz.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
                return;
            }

            try
            {

                Request req = new Request()
                {
                    EmployeeID = employeeId,
                    RequestType = requestType,
                    RequestDetails = description.Value,
                    RequestDate = DateTime.Now
                };
                entities.Requests.Add(req);
                await entities.SaveChangesAsync();
                SuccessMessageText.InnerText = "Talebiniz başarıyla gönderildi.";
                SuccessMessage.Visible = true;
                transactions.ShowAfterDelete(SuccessMessage, this.Page);
                TabloYenile();
            }
            catch (Exception)
            {
                UnsuccesfullyMessageText.InnerText = "Talebiniz gönderilirken bir hatayla karşılaşıldı.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }
        }
    }
}