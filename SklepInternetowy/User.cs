using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public class User
    {
        public string username { get; set; }
        public string salt { get; set; }
        public string hash { get; set; }
        public bool admin { get; set; }
        public Button delete { get; set; }
        public Button btnAdmin { get; set; }

        public User(string username, string salt, string hash, bool admin)
        {
            this.username = username;
            this.salt = salt;
            this.hash = hash;
            this.admin = admin;
        }

        public HtmlGenericControl getSmallHtml()
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes.Add("class", "userItem");
            HtmlGenericControl username = new HtmlGenericControl("div");
            username.Attributes.Add("class", "userUsername");
            username.InnerText = "Username: "+this.username;
            container.Controls.Add(username);
            HtmlGenericControl admin = new HtmlGenericControl("div");
            admin.Attributes.Add("class", "userAdmin");
            admin.InnerText = "Is admin: "+this.admin.ToString();
            container.Controls.Add(admin);
            Button btnDelete = new Button();
            btnDelete.Attributes.Add("class", "userDelete");
            btnDelete.Attributes.Add("username", this.username);
            btnDelete.Text = "Delete";
            this.delete = btnDelete;
            container.Controls.Add(btnDelete);
            Button btnAdmin = new Button();
            btnAdmin.Attributes.Add("class", "userBtnAdmin");
            btnAdmin.Attributes.Add("username", this.username);
            btnAdmin.Attributes.Add("admin", this.admin.ToString());
            btnAdmin.Text = this.admin? "Take admin":"Give admin";
            this.btnAdmin = btnAdmin;
            container.Controls.Add(btnAdmin);

            return container;
        }

        
    }
}