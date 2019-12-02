using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((string)Session["lang"] == "eng")
            {
                tbSearch.Attributes["placeholder"] = "Search";
                lbtnLogin.Text = "Log in";
                lbtnRegister.Text = "Register";
                btnLanguage.ImageUrl = "/Assets/Images/pl.svg";
                lbtnLogout.Text = "Log out";
                lbtnOrders.Text = "Your orders";
                yourOrders.InnerText = "Your orders";
                yourOrders.InnerHtml = yourOrders.InnerText;
            }

            if (Session["user"] == null)
            {
                Response.Redirect("/index.aspx");
            }
            else
            {
                if (((User)Session["user"]).admin)
                {
                    Response.Redirect("/Admin.aspx");
                }
                login.Controls.Clear();
                Image img = new Image();
                img.ImageUrl = "~/Assets/Images/user.png";
                img.Width = 40;
                img.Height = 40;
                login.Controls.Add(img);
                LinkButton btn = new LinkButton();
                btn.ID = "lbtnUser";
                btn.Attributes.Add("href","/Account.aspx");
                btn.Text = "Witaj " + ((User)Session["user"]).username + "!";
                if ((string)Session["lang"] == "eng")
                {
                    btn.Text = "Welcome " + ((User)Session["user"]).username + "!";
                }
                login.Controls.Add(btn);
            }

            List<Order> orders = getOrders();
            foreach (Order order in orders)
            {
                Orders.Controls.Add(order.getSmallHtmlUser());
            }

        }

        public List<Order> getOrders()
        {
            MySqlConnection conn = index.connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT orders.ID, orders.username, produkty.name, orders.status FROM orders INNER JOIN produkty ON orders.item=produkty.ID WHERE orders.username='"+ ((User)Session["user"]).username+ "'";
            MySqlDataReader reader = command.ExecuteReader();
            List<Order> data = new List<Order>();
            while (reader.Read())
            {
                data.Add(new Order((int)reader["ID"], (string)reader["username"], (string)reader["name"], (string)reader["status"]));
            }
            return data;
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

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["array"] = null;
            Session["user"] = null;
            Response.Redirect("/index.aspx");
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            Session["search"] = ((TextBox)((ImageButton)sender).Parent.Controls[2]).Text;
            Response.Redirect("/index.aspx");
        }
    }
}