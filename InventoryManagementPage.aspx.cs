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
                //linkTab1.Attributes["class"] = "nav-link active";
                //linkTab2.Attributes["class"] = "nav-link";
                //tab1.Attributes["class"] = "tab-pane active";
                //tab2.Attributes["class"] = "tab-pane";

                UrunListesi();
            }
            else if (Request["__EVENTTARGET"] == "SearchUrun")
            {
                AraVeGuncelle(SearchUrun.Value);
            }
            else if (Request["__EVENTTARGET"] == "DropDownListProductList")
            {
                //linkTab1.Attributes["class"] = "nav-link";
                //linkTab2.Attributes["class"] = "nav-link active";
                //tab1.Attributes["class"] = "tab-pane";
                //tab2.Attributes["class"] = "tab-pane active";
                int productId = Convert.ToInt32(DropDownListProductList.SelectedValue);

                UrunBilgileri(productId);
            }
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
        private void AraVeGuncelle(string aramaText)
        {
            var urun = entities.Inventories.Where(x => x.ProductName.StartsWith(aramaText)).ToList();
            GridViewInventory.DataSource = urun;
            GridViewInventory.DataBind();
        }
        protected void ButtonSil_Click(object sender, EventArgs e)
        {
            UrunVarMi(DeletedAlert, DeletedAlertText, "Ürün Bulunamadı.");

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
            int productId = Convert.ToInt32(DropDownListProductList.SelectedValue);
            UrunBilgileri(productId);
        }
        protected void UrunBilgileri(int productId)
        {
            
            if (productId <= 0)
            {
                return;
            }
            var product = entities.Inventories.FindAsync(productId).Result;
            ProductNameChangeInput.Value = product.ProductName;
            ProductAmountChangeInput.Value = product.ProductAmount.ToString();
            ProductPriceChangeInput1.Value = product.ProductPrice.ToString().Split(',')[0];
            ProductPriceChangeInput2.Value = product.ProductPrice.ToString().Split(',')[1];
            ProductReorderLevelChangeInput.Value = product.ReorderLevel.ToString();
        }

        protected void UrunGuncelleButton_Click(object sender, EventArgs e)
        {
            UrunVarMi(UpdatedAlert, UpdatedAlertText, "Ürün Bulunamadı.");

            int productId = Convert.ToInt32(DropDownListProductList.SelectedValue);
           
            try
            {
                var product = entities.Inventories.FindAsync(productId).Result;
                product.ProductName = ProductNameChangeInput.Value;
                product.ProductAmount = Convert.ToInt32(ProductAmountChangeInput.Value);
                product.ProductPrice = Convert.ToDecimal(ProductPriceChangeInput1.Value + "," + ProductPriceChangeInput2.Value);
                product.ReorderLevel = Convert.ToInt32(ProductReorderLevelChangeInput.Value);
                entities.SaveChangesAsync();
                UrunListesi();
                VeriKaldir();
                SuccessMessageText.InnerText = "Ürün başarıyla güncellendi.";
                SuccessMessage.Visible = true;
                transactions.ShowAfterDelete(SuccessMessage, this.Page);
            }
            catch
            {
                SuccessMessage.Visible = false;
                UnsuccesfullyMessageText.InnerText = "Ürün güncellenemedi.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }
        }
        protected void UrunKaydetButton_Click(object sender, EventArgs e)
        {
            bool productNameDuplicate = entities.Inventories.Any(x => x.ProductName == ProductNameInput.Value);

            if (ProductNameInput.Value == "" || ProductAmountInput.Value == "" || ProductPriceInput1.Value == "" || ProductPriceInput2.Value == "" || ProductReorderLevelInput.Value == "" || productNameDuplicate)
            {
                SuccessMessage.Visible = true;
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
                entities.SaveChanges();
                UrunListesi();
                VeriKaldir();
                SuccessMessageText.InnerText = "Ürün başarıyla eklendi.";
                SuccessMessage.Visible = true;
                transactions.ShowAfterDelete(SuccessMessage, this.Page);
            }
            catch
            {
                SuccessMessage.Visible = false;
                UnsuccesfullyMessageText.InnerText = "Ürün eklenemedi.";
                UnsuccesfullyMessage.Visible = true;
                transactions.ShowAfterDelete(UnsuccesfullyMessage, this.Page);
            }
        }
        private void VeriKaldir()
        {
            ProductNameInput.Value = "";
            ProductAmountInput.Value = "";
            ProductPriceInput1.Value = "";
            ProductPriceInput2.Value = "00";
            ProductReorderLevelInput.Value = "";
            ProductAmountChangeInput.Value = "";
            ProductPriceChangeInput1.Value = "";
            ProductPriceChangeInput2.Value = "";
            ProductReorderLevelChangeInput.Value = "";
        }
    }
}