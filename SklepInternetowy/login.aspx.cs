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

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginMsg = InputValidator.isValidLogin(tbLogin.Text);
            string passMsg = InputValidator.isValidPassword(tbPassword.Text);
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
                lValid.Text = "Zalogowano";
                Session["user"] = user;
                Response.Redirect("/index.aspx");
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