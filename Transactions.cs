using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI;

namespace AssetManagmentSite
{
    public class Transactions
    {
        public void ShowAfterDelete(HtmlGenericControl Alert, Page currentPage)
        {
            string script = "setTimeout(function() { document.getElementById('" + Alert.ClientID + "').style.display = 'none'; }, 5000);";
            ScriptManager.RegisterStartupScript(currentPage, currentPage.GetType(), "HideAlert", script, true);
        }
    }
}