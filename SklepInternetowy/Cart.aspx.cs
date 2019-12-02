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
    public partial class Cart : System.Web.UI.Page
    {

        public static MySqlConnection connect()
        {
            string myconnection =
               "SERVER=localhost;" +
               "DATABASE=Sklep;" +
               "UID=root;" +
               "PASSWORD=;";

            MySqlConnection connection = new MySqlConnection(myconnection);

            try
            {

                connection.Open();
                Console.WriteLine("Connected");
                return connection;

            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.WriteLine("Error");
            }
            return null;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["lang"] == "eng")
            {
                tbSearch.Attributes["placeholder"] = "Search";
                lbtnLogin.Text = "Log in";
                lbtnRegister.Text = "Register";
                btnLanguage.ImageUrl = "/Assets/Images/pl.svg";
                TRname.Text = "Name";
                TRprice.Text = "Price";
                sv.Text = "Confirm";
                clr.Text = "Clear your cart";
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
                btn.Attributes.Add("href", "/Account.aspx");
                btn.Text = "Witaj " + ((User)Session["user"]).username + "!";
                if ((string)Session["lang"] == "eng")
                {
                    btn.Text = "Welcome " + ((User)Session["user"]).username + "!";
                }
                login.Controls.Add(btn);
                List<string> all = (List<string>)Session["array"];
                double sum = 0;
                for (int i = 0; i < all.Count; i++)
                {
                    TableRow row = new TableRow();
                    MySqlConnection conn = connect();
                    MySqlCommand command = conn.CreateCommand();

                    command.CommandText = "SELECT * FROM produkty WHERE name = '" + all[i] + "'";

                    MySqlDataReader reader = command.ExecuteReader();
                    List<Product> data = new List<Product>();
                    while (reader.Read())
                    {
                        data.Add(new Product((int)reader["ID"], (string)reader["name"], (string)reader["description"], (double)reader["price"], (string)reader["color"], (string)reader["image"], (string)reader["category"]));
                    }
                    TableCell cell1 = new TableCell();
                    int j = i + 1;
                    string myString = j.ToString();
                    cell1.Text = myString;
                    row.Cells.Add(cell1);
                    TableCell cell2 = new TableCell();
                    cell2.Text = data[0].name;
                    row.Cells.Add(cell2);
                    TableCell cell3 = new TableCell();
                    string myString2 = data[0].price.ToString();
                    sum += data[0].price;
                    cell3.Text = myString2;
                    row.Cells.Add(cell3);
                    myTable.Rows.Add(row);

                }
                string suma;
                if ((string)Session["lang"] == "eng")
                {
                    suma = "Total: " + sum.ToString();
                }
                else
                {
                    suma= "W sumie: " + sum.ToString();
                }
                HtmlGenericControl div = new HtmlGenericControl("div");
                div.Attributes.Add("class", "sumTotal");
                div.InnerText = suma;
                tableContainer.Controls.Add(div);
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

        protected void clr_Click(object sender, EventArgs e)
        {
            List<string> array = new List<string>();
            Session["array"] = array;
            Response.Redirect("/index.aspx");
        }

        protected void sv_Click(object sender, EventArgs e)
        {
            List<string> all = (List<string>)Session["array"];
            for (int i = 0; i < all.Count; i++)
            {
                TableRow row = new TableRow();
                MySqlConnection conn = connect();
                MySqlConnection conn2 = connect();
                MySqlCommand command = conn.CreateCommand();
                command.CommandText = "SELECT * FROM produkty WHERE name = '" + all[i] + "'";
                MySqlDataReader reader = command.ExecuteReader();
                List<Product> data = new List<Product>();
                while (reader.Read())
                {
                    data.Add(new Product((int)reader["ID"], (string)reader["name"], (string)reader["description"], (double)reader["price"], (string)reader["color"], (string)reader["image"], (string)reader["category"]));
                    
                }
                MySqlCommand command2 = conn2.CreateCommand();
                command2.CommandText = "INSERT INTO orders (username, item,status) VALUES ('" + ((User)Session["user"]).username + "'" + ", " + "'" + data[0].ID + "'" + ", " + "'oczekujace'" + ");";
                command2.ExecuteReader(); 
                
                
            }
            List<string> array = new List<string>();
            Session["array"] = array;
            //index.MessageBox(this, "Dziękujemy za zakupy!");
            Response.Redirect("/index.aspx");
        }
    }
}