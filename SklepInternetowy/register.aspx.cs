using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public partial class register : System.Web.UI.Page
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
                btnLogin.Text = "Register";
                linkLogin.InnerText = "Already have an account? Login now!";
                linkReturn.InnerText = "Return to home page";
                text.InnerText = "Register on E-Bazarek!";
            }

            if (Session["user"] != null)
            {
                Response.Redirect("/index.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginMsg = InputValidator.isValidLogin(tbLogin.Text ,(string)Session["lang"]);
            string passMsg = InputValidator.isValidPassword(tbPassword.Text, (string)Session["lang"]);
            if (loginMsg != null)
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
            if (user != null)
            {
                lValid.Text = "Taki użytkownik już istnieje! Wybierz inny login";
                return;
            }

            string salt = index.encrypter.GetSalt();
            string hash = index.encrypter.GetHash(tbPassword.Text, salt);


            index.insert("users", new string[] { tbLogin.Text, salt, hash, null});
            lValid.Text = "Stworzono użytkownika!";

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