﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class PersonelManagmentPage : System.Web.UI.Page
    {
        AssetManagmentEntities entities = new AssetManagmentEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PersonelListesi();
            }
            else if (Request["__EVENTTARGET"] == "SearchInput")
            {
                AraVeGuncelle(SearchInput.Value);
            }
        }

        private void AraVeGuncelle(string aramaText)
        {
            var emp = entities.Employees.Where(x => x.EmployeeName.StartsWith(aramaText)).ToList();
            GridViewPersonelList.DataSource = emp;
            GridViewPersonelList.DataBind();
        }

        private void PersonelListesi()
        {
            var employeeNames = entities.Employees.Select(x => new { x.EmployeeID, x.EmployeeName }).ToList();
            // İlk indexe boş bir öğe ekleme
            DropDownListPersonelId.DataSource = employeeNames;
            DropDownListPersonelId.DataTextField = "EmployeeName";
            DropDownListPersonelId.DataValueField = "EmployeeID";
            DropDownListPersonelId.DataBind();

            DropDownListPersonelId.Items.Insert(0, new ListItem("", "-1"));



            var employeeList = entities.Employees.ToList();
            GridViewPersonelList.DataSource = employeeList;
            GridViewPersonelList.DataBind();
        }
        protected async void ButtonEkle_Click(object sender, EventArgs e)
        {
            bool empNameDuplicate = entities.Employees.Any(x => x.EmployeeName == NameSurnameInput.Value);
            if (NameSurnameInput.Value == "" || EmployeeDepartmentInput.Value == "" || EmployeeRoleInput.Value == "" || DetailsInput.Value == "" || empNameDuplicate)
            {

                if (empNameDuplicate)
                {
                    UnsuccesfullyMessage.InnerText = "Bu isimde bir personel zaten var.";
                }
                UnsuccesfullyMessage.InnerText = "Personel Eklenemedi.";

                UnsuccesfullyMessage.Visible = true;
                ShowAfterDelete(UnsuccesfullyMessage);
                return;
            }
            try
            {
                Employee emp = new Employee()
                {
                    EmployeeName = NameSurnameInput.Value,
                    EmployeeDepartment = EmployeeDepartmentInput.Value,
                    EmployeeRole = EmployeeRoleInput.Value,
                    EmployeeDetails = DetailsInput.Value
                };
                entities.Employees.Add(emp);
                await entities.SaveChangesAsync();
                SuccessMessageText.InnerText = "Personel Başarıyla Eklendi!";
                PersonelListesi();

            }
            catch
            {
                UnsuccesfullyMessageText.InnerText = "Personel Eklenemedi.";
                UnsuccesfullyMessage.Visible = true;
                ShowAfterDelete(UnsuccesfullyMessage);

            }
            finally
            {
                SuccessMessage.Visible = true;
                if (UnsuccesfullyMessage.Visible)
                {
                    SuccessMessage.Visible = false;
                    ShowAfterDelete(UnsuccesfullyMessage);
                }

                ShowAfterDelete(SuccessMessage);
                VeriKaldir();

            }
        }

        private void ShowAfterDelete(HtmlGenericControl Alert)
        {
            string script = "setTimeout(function() { document.getElementById('" + Alert.ClientID + "').style.display = 'none'; }, 5000);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "HideAlert", script, true);
        }

        protected async void ButtonGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                int employeeId = PersonelIdGetir();

                if (employeeId > 0)
                {
                    var employee = entities.Employees.FindAsync(employeeId);
                    employee.Result.EmployeeName = NameSurnameChangeInput.Value;
                    //employee.Result.EmployeeDepartment = DropDownListPersonelDepartments.SelectedValue;
                    employee.Result.EmployeeDepartment = PersonelDepartmanChangeInput.Text;
                    employee.Result.EmployeeRole = PersonelRoleChangeInput.Value;
                    employee.Result.EmployeeDetails = PersonelDetailsChangeInput.Value;
                    await entities.SaveChangesAsync();
                    UpdatedAlertText.InnerText = "Personel Bilgileri Değişti!";
                    PersonelListesi();
                }
                else
                {
                    UpdatedAlertText.InnerText = "Personel Bulunamadı!";

                }
            }
            catch (Exception)
            {
                UpdatedAlertText.InnerText = "Güncelleme işlemi başarısız oldu. Tekrar deneyiniz.";
            }
            finally
            {
                UpdatedAlert.Visible = true;
                // 10 saniye sonra uyarı mesajını gizle
                ShowAfterDelete(UpdatedAlert);
                VeriKaldir();
            }

        }

        private int PersonelIdGetir()
        {
            return Convert.ToInt32(DropDownListPersonelId.SelectedValue);
        }

        protected async void ButtonSil_Click(object sender, EventArgs e)
        {
            try
            {
                int empID = PersonelIdGetir();
                var emp = entities.Employees.FindAsync(empID);
                entities.Employees.Remove(emp.Result);
                await entities.SaveChangesAsync();
                DeletedAlertText.InnerText = "Personel Kayıttan Silindi!";
                PersonelListesi();
            }
            catch (Exception)
            {
                DeletedAlertText.InnerText = "Silme işlemi başarısız oldu.";
            }
            finally
            {
                DeletedAlert.Visible = true;
                // 10 saniye sonra uyarı mesajını gizle
                ShowAfterDelete(DeletedAlert);
                VeriKaldir();
            }
        }
        private void VeriKaldir()
        {
            NameSurnameInput.Value = "";
            EmployeeDepartmentInput.Value = "";
            EmployeeRoleInput.Value = "";
            DetailsInput.Value = "";
            NameSurnameChangeInput.Value ="";
            PersonelDepartmanChangeInput.Text = "";
            PersonelRoleChangeInput.Value = "";
            PersonelDetailsChangeInput.Value = "";
        }
        protected void PersonelIdDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            int employeeId = PersonelIdGetir();

            if (employeeId > 0)
            {
                var employee = entities.Employees.Find(employeeId);
                //var departments = entities.Employees.Select(x => x.EmployeeDepartment).Distinct().ToList();

                //DropDownListPersonelDepartments.DataSource = departments;
                //DropDownListPersonelDepartments.DataBind();

                NameSurnameChangeInput.Value = employee.EmployeeName;
                PersonelDepartmanChangeInput.Text = employee.EmployeeDepartment;
                //DropDownListPersonelDepartments.SelectedValue = employee.EmployeeDepartment;
                PersonelRoleChangeInput.Value = employee.EmployeeRole;
                PersonelDetailsChangeInput.Value = employee.EmployeeDetails;
            }
            else
            {
                PersonelAraAlert.Visible = false;
                ShowAfterDelete(PersonelAraAlert);
                VeriKaldir();
            }
        }
    }
}