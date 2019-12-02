using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public partial class Admin : System.Web.UI.Page
    {
        public static string visible = "mngUsers";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["lang"] == "eng")
            {
                tbSearch.Attributes["placeholder"] = "Search";
                lbtnLogin.Text = "Log in";
                lbtnRegister.Text = "Register";
                btnLanguage.ImageUrl = "/Assets/Images/pl.svg";
                lbtnAddItem.Text = "Add new item";
                lbtnLogout.Text = "Log out";
                lbtnMngOrders.Text = "Manage orders";
                lbtnMngUsers.Text = "Manage users";
                usersTitle.InnerText = "Users";
                ordersTitle.InnerText = "Orders";
                itemsTitle.InnerText = "Items";
                btnAdd.Text = "Add";
                divName.InnerText = "Name: ";
                divDesc.InnerText = "Description: ";
                divPrice.InnerText = "Price: ";
                divPicture.InnerText = "Picture: ";
                divCategory.InnerText = "Category: ";
                divColor.InnerText = "Color: ";
            }

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
                if ((string)Session["lang"] == "eng")
                {
                    btn.Text = "Welcome " + ((User)Session["user"]).username + "!";
                }
                login.Controls.Add(btn);
            }

            for (int i = 0; i < content.Controls.Count; i++)
            {
                if (content.Controls[i].ID != visible)
                {
                    content.Controls[i].Visible = false;
                }
            }

            List<User> users = getUsers();
            foreach (User user in users)
            {
                mngUsers.Controls.Add(user.getSmallHtml());
                user.delete.Click += this.deleteUser;
                user.btnAdmin.Click += this.toggleAdmin;
            }

            List<Order> orders = getOrders();
            int a = 0;
            foreach (Order order in orders)
            {
                mngOrders.Controls.Add(order.getSmallHtml());
                order.changeStatus.Click += changeStatus;
                order.select.ID = a + "orderSelect";
                a++;
            }

        }


        public List<User> getUsers()
        {
            MySqlConnection conn = index.connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT * FROM users";
            MySqlDataReader reader = command.ExecuteReader();
            List<User> data = new List<User>();
            while (reader.Read())
            {
                data.Add(new User((string)reader["username"], (string)reader["salt"], (string)reader["hash"], (bool)reader["admin"]));
            }
            return data;
        }

        public List<Order> getOrders()
        {
            MySqlConnection conn = index.connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT orders.ID, orders.username, produkty.name, orders.status FROM orders INNER JOIN produkty ON orders.item=produkty.ID";
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
            Session["user"] = null;
            Response.Redirect("/index.aspx");
        }

        protected void lbtnMngUsers_Click(object sender, EventArgs e)
        {
            visible = "mngUsers";
            Response.Redirect(Request.RawUrl);
        }

        protected void lbtnMngOrders_Click(object sender, EventArgs e)
        {
            visible = "mngOrders";
            Response.Redirect(Request.RawUrl);
        }

        protected void lbtnAddItem_Click(object sender, EventArgs e)
        {
            visible = "addItem";
            Response.Redirect(Request.RawUrl);
        }

        public void deleteUser(object sender, EventArgs e)
        {
            MySqlConnection conn = index.connect();
            if (conn == null) return;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "DELETE FROM users WHERE username='" + ((Button)sender).Attributes["username"] + "'";
            MySqlDataReader reader = command.ExecuteReader();

            Response.Redirect(Request.RawUrl);
        }

        public void toggleAdmin(object sender, EventArgs e)
        {

            MySqlConnection conn = index.connect();
            if (conn == null) return;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "UPDATE users SET admin=" + (((Button)sender).Attributes["admin"] == "True" ? "'0'" : "'1'") + " WHERE username='" + ((Button)sender).Attributes["username"] + "'";
            MySqlDataReader reader = command.ExecuteReader();

            Response.Redirect(Request.RawUrl);
        }

        public void changeStatus(object sender, EventArgs e)
        {
            DropDownList select = (DropDownList)((Button)sender).Parent.Controls[5];

            var value =select.SelectedValue;
            MySqlConnection conn = index.connect();
            if (conn == null) return;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "UPDATE orders SET status='" + value + "' WHERE ID='" + ((Button)sender).Attributes["ID"] + "'";
            MySqlDataReader reader = command.ExecuteReader();

            Response.Redirect(Request.RawUrl);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (fuPicture.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(fuPicture.FileName);
                    fuPicture.SaveAs(Server.MapPath("~/Assets/Images/Uploaded/") + filename);
                    lStatus.Text = "Upload status: File uploaded!";
                    index.insert("produkty", new string[] { null, tbName.Text, tbDesc.Text, tbPrice.Text, tbColor.Text, "/Assets/Images/Uploaded/" + filename, tbCategory.Text });
                }
                catch (Exception ex)
                {
                    lStatus.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    return;
                }
            }
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            Session["search"] = ((TextBox)((ImageButton)sender).Parent.Controls[2]).Text;
            Response.Redirect("/index.aspx");
        }
    }
}