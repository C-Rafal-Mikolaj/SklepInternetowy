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

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginMsg = InputValidator.isValidLogin(tbLogin.Text);
            string passMsg = InputValidator.isValidPassword(tbPassword.Text);
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


            index.insert("users", new string[] { null, tbLogin.Text, salt, hash, null});
            lValid.Text = "Stworzono użytkownika!";

        }

        protected void btnCart_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void btnLanguage_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}