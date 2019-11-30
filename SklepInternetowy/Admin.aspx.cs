using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("/index.aspx");
            }
            else
            {
                if (!((User)Session["user"]).admin)
                {
                    Response.Redirect("/Account.aspx");
                }
                login.Controls.Clear();
                Image img = new Image();
                img.ImageUrl = "~/Assets/Images/user.png";
                img.Width = 40;
                img.Height = 40;
                login.Controls.Add(img);
                LinkButton btn = new LinkButton();
                btn.ID = "lbtnUser";
                btn.Attributes.Add("href", "/Account.aspx");
                btn.Text = "Witaj " + ((User)Session["user"]).username + "!";
                login.Controls.Add(btn);
            }
        }
        protected void btnCart_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnLanguage_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}