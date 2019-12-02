using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["lang"] == "eng")
            {
                tbSearch.Attributes["placeholder"] = "Search";
                lbtnLogin.Text = "Log in";
                lbtnRegister.Text = "Register";
                btnLanguage.ImageUrl = "/Assets/Images/pl.svg";
                tbPassword.Attributes["placeholder"] = "Password";
                btnLogin.Text = "Login";
                linkLogin.InnerText = "Don't have an account? Register now!";
                linkReturn.InnerText = "Return to home page";
                //text.InnerText = "Log in on E-Bazarek!";
            }

            if (Session["user"] != null)
            {
                Response.Redirect("/index.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginMsg = InputValidator.isValidLogin(tbLogin.Text, (string)Session["lang"]);
            string passMsg = InputValidator.isValidPassword(tbPassword.Text, (string)Session["lang"]);
            if (loginMsg!=null)
            {
                lValid.Text = loginMsg;
                return;
            }
            if (passMsg != null)
            {
                lValid.Text = passMsg;
                return;
            }
            User user = index.getUser(tbLogin.Text);
            if (user == null)
            {
                btnLogin.Text = "Nie ma takiego użytkownika";
                return;
            }
            string salt = user.salt;
            string hash = index.encrypter.GetHash(tbPassword.Text, salt);
            if (hash == user.hash)
            {
                var array = new List<string>();
                Session["array"] = array;
                lValid.Text = "Zalogowano";
                Session["loged"] = true;
                Session["user"] = user;
                Response.Redirect("/index.aspx");
            }
        }
        protected void btnCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Cart.aspx");
        }

        protected void btnLanguage_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["lang"] == null)
            {
                Session["lang"] = "eng";
            }
            else
            {
                Session["lang"] = null;
            }
            Response.Redirect(Request.RawUrl);
        }
        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            Session["search"] = ((TextBox)((ImageButton)sender).Parent.Controls[2]).Text;
            Response.Redirect("/index.aspx");
        }
    }
}