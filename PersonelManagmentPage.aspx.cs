using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class PersonelManagmentPage : System.Web.UI.Page
    {
        AssetManagmentEntities entities = new AssetManagmentEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            PersonelListesi();
        }

        private void PersonelListesi()
        {
            var employeeList = entities.Employees.ToList();
            GridViewPersonelList.DataSource = employeeList;
            GridViewPersonelList.DataBind();
        }
        protected void ButtonEkle_Click(object sender, EventArgs e)
        {
            if(NameSurnameInput.Value == "" || EmployeeDepartmentInput.Value == "" || EmployeeRoleInput.Value == "" || DetailsInput.Value == "")
            {
                return;
            }
            Employee emp = new Employee()
            {
                EmployeeName = NameSurnameInput.Value,
                EmployeeDepartment = EmployeeDepartmentInput.Value,
                EmployeeRole = EmployeeRoleInput.Value,
                EmployeeDetails = DetailsInput.Value
            };
            entities.Employees.Add(emp);
            entities.SaveChanges();

            PersonelListesi();
        }
    }
}