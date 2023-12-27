using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace AssetManagmentSite
{
    public partial class InventoryManagementPage : System.Web.UI.Page
    {
        AssetManagmentEntities entities = new AssetManagmentEntities();
        Transactions transactions = new Transactions();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {
                VeriKaldir();
                UrunListesi();
            }

        }
        protected void SearchChanged(object sender, EventArgs e)
        {
            var urun = entities.Inventories.Where(x => x.ProductName.StartsWith(SearchUrun.Text)).ToList();
            GridViewInventory.DataSource = urun;
            GridViewInventory.DataBind();
        }
        private void UrunListesi()
        {
            var urunList = entities.Inventories.ToList();
            GridViewInventory.DataSource = urunList;
            GridViewInventory.DataBind();
            var urunAdlarıList = entities.Inventories.Select(x => new { x.ProductID, x.ProductName }).ToList();
            DropDownListProductList.DataSource = urunAdlarıList;
            DropDownListProductList.DataTextField = "ProductName";
            DropDownListProductList.DataValueField = "ProductID";
            DropDownListProductList.DataBind();
            DropDownListProductList.Items.Insert(0, new ListItem("", "-1"));

        }

        protected async void ButtonSil_Click(object sender, EventArgs e)
        {
            UrunVarMi(DeletedAlert, DeletedAlertText, "Ürün Bulunamadı.");

            int productId = Convert.ToInt32(DropDownListProductList.SelectedValue);
            try
            {
                var product = await entities.Inventories.FindAsync(productId);
                entities.Inventories.Remove(product);
                await entities.SaveChangesAsync();
                UrunListesi();
                VeriKaldir();
                DeletedAlertText.InnerText = "Ürün başarıyla silindi.";
                DeletedAlert.Visible = true;
                transactions.ShowAfterDelete(DeletedAlert, this.Page);
            }
            catch(Exception)
            {
                DeletedAlertText.InnerText = "Ürün silinemedi.";
                DeletedAlert.Visible = true;
                transactions.ShowAfterDelete(DeletedAlert, this.Page);
            }

        }

        private void UrunVarMi(HtmlGenericControl alert, HtmlGenericControl alertText, string text)
        {
            int productId = Convert.ToInt32(DropDownListProductList.SelectedValue);
            if (productId <= 0)
            {
                VeriKaldir();
                alert.Visible = true;
                alertText.InnerText = text;
                transactions.ShowAfterDelete(alert, this.Page);
                return;
            }
        }
        protected void PersonelIdDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            SuccessMessage.Visible = false;
            UnsuccesfullyMessage.Visible = false;
            UpdatedAlert.Visible = false;
            DeletedAlert.Visible = false;

            int productId = Convert.ToInt32(DropDownListProductList.SelectedValue);
            if (productId <= 0)
            {
                VeriKaldir();
                return;
            }
            UrunBilgileri(productId);
        }
        protected async void UrunBilgileri(int productId)
        {

            if (productId <= 0)
            {
                return;
            }
            var product = await entities.Inventories.FindAsync(productId);
            ProductNameChangeInput.Value = product.ProductName;
            ProductAmountChangeInput.Value = product.ProductAmount.ToString();
            ProductPriceChangeInput1.Value = product.ProductPrice.ToString().Split(',')[0];
            ProductPriceChangeInput2.Value = product.ProductPrice.ToString().Split(',')[1];
            ProductReorderLevelChangeInput.Value = product.ReorderLevel.ToString();
        }

        protected async void UrunGuncelleButton_Click(object sender, EventArgs e)
        {
            UrunVarMi(UpdatedAlert, UpdatedAlertText, "Ürün Bulunamadı.");

            int productId = Convert.ToInt32(DropDownListProductList.SelectedItem.Value);

            try
            {
                var product = await entities.Inventories.FindAsync(productId);
                product.ProductName = ProductNameChangeInput.Value;
                product.ProductAmount = Convert.ToInt32(ProductAmountChangeInput.Value);
                product.ProductPrice = Convert.ToDecimal(ProductPriceChangeInput1.Value + "," + ProductPriceChangeInput2.Value);
                product.ReorderLevel = Convert.ToInt32(ProductReorderLevelChangeInput.Value);
                await entities.SaveChangesAsync();
                UrunListesi();
                VeriKaldir();
                SuccessMessageText.InnerText = "Ürün başarıyla güncellendi.";
                SuccessMessage.Visible = true;
                transactions.ShowAfterDelete(SuccessMessage, this.Page);
            }
            catch(Exception ex)
            {
                SuccessMessage.Visible = false;
                UnsuccesfullyMessageText.InnerText = ex.Message;
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }
        }
        protected async void UrunKaydetButton_Click(object sender, EventArgs e)
        {
            bool productNameDuplicate = entities.Inventories.Any(x => x.ProductName == ProductNameInput.Value);

            if (ProductNameInput.Value == "" || ProductAmountInput.Value == "" || ProductPriceInput1.Value == "" || ProductPriceInput2.Value == "" || ProductReorderLevelInput.Value == "" || productNameDuplicate)
            {
                UnsuccesfullyMessageText.Visible = true;
                UnsuccesfullyMessageText.InnerText = "Lütfen tüm alanları doldurunuz.";
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
                return;
            }
            try
            {
                Inventory inv = new Inventory()
                {
                    ProductName = ProductNameInput.Value,
                    ProductAmount = Convert.ToInt32(ProductAmountInput.Value),
                    ProductPrice = Convert.ToDecimal(ProductPriceInput1.Value + "," + ProductPriceInput2.Value),
                    ReorderLevel = Convert.ToInt32(ProductReorderLevelInput.Value)
                };
                entities.Inventories.Add(inv);
                await entities.SaveChangesAsync();
                UrunListesi();
                VeriKaldir();
                SuccessMessageText.InnerText = "Ürün başarıyla eklendi.";
                SuccessMessage.Visible = true;
                transactions.ShowAfterDelete(SuccessMessage, this.Page);
            }
            catch(Exception)
            {
                SuccessMessage.Visible = false;
                UnsuccesfullyMessageText.InnerText = "Ürün eklenemedi.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }
        }
        protected void LinkButtonTab1_Click(object sender, EventArgs e)
        {
            PanelTab1.Visible=true;
            PanelTab2.Visible = false;
        }
        protected void LinkButtonTab2_Click(object sender, EventArgs e)
        {
            PanelTab2.Visible = true;
            PanelTab1.Visible = false;
        }
        private void VeriKaldir()
        {
            ProductNameInput.Value = "";
            ProductAmountInput.Value = "";
            ProductPriceInput1.Value = "";
            ProductPriceInput2.Value = "00";
            ProductNameChangeInput.Value = "";
            ProductReorderLevelInput.Value = "";
            ProductAmountChangeInput.Value = "";
            ProductPriceChangeInput1.Value = "";
            ProductPriceChangeInput2.Value = "00";
            ProductReorderLevelChangeInput.Value = "";
        }
    }
}