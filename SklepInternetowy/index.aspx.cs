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
    public partial class index : System.Web.UI.Page
    {
        public static Encrypter encrypter = new Encrypter();

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["lang"] == "eng")
            {
                tbSearch.Attributes["placeholder"] = "Search";
                lbtnLogin.Text = "Log in";
                lbtnRegister.Text = "Register";
                btnLanguage.ImageUrl = "/Assets/Images/pl.svg";
                btnSort.Text = "Sort by";
                btnCategory.Text = "Category";
                btnColor.Text = "Color";
            }

            if (Session["user"] != null)
            {
                login.Controls.Clear();
                Image img = new Image();
                img.ImageUrl = "~/Assets/Images/user.png";
                img.Width = 40;
                img.Height = 40;
                login.Controls.Add(img);
                LinkButton btn = new LinkButton();
                btn.ID = "lbtnUser";
                btn.Click += lbtnUser_Click;
                btn.Text = "Witaj " + ((User)Session["user"]).username + "!";
                if ((string)Session["lang"] == "eng")
                {
                    btn.Text = "Welcome " + ((User)Session["user"]).username + "!";
                }
                login.Controls.Add(btn);
            }

            //Ładowanie produktów
            List<Product> products;
            if (Session["search"]!=null)
            {
                products = searchProducts((string)Session["search"]);
                Session["search"] = null;

            }
            else
            {
                products = getProducts("wszystkie", "all");
            }
            
            int i = 0;
            try
            {
                HtmlGenericControl[] containers = new HtmlGenericControl[(int)(products.Count / 4) + 1];
                for (int j = 0; j < containers.Length; j++)
                {
                    containers[j] = new HtmlGenericControl("div");
                    containers[j].Attributes["class"] = "row";
                }
                foreach (Product product in products)
                {
                    containers[(int)(i / 4)].Controls.Add(product.getHtmlSmall());
                    product.btnBuy.Click += btnBuy_Click;
                    if ((string)Session["lang"] == "eng")
                    {
                        product.btnBuy.Text = "Buy now";
                    }
                    i++;
                }
                if (i % 4 != 0)
                    for (int j = 0; j < 4 - i % 4; j++)
                    {
                        HtmlGenericControl col = new HtmlGenericControl("div");
                        col.Attributes["class"] = "col productEmpty";
                        containers[(int)(i / 4)].Controls.Add(col);
                    }
                for (int j = 0; j < containers.Length; j++)
                {
                    pItems.Controls.Add(containers[j]);
                }

                //Ładowanie kategorii
                List<string> categories = getCategories();
                foreach (string category in categories)
                {
                    LinkButton btn = new LinkButton();
                    btn.Text = category[0].ToString().ToUpper() + category.Substring(1);
                    btn.Click += choosingCategories;
                    btn.CommandArgument = category[0].ToString().ToUpper() + category.Substring(1);
                    btn.CssClass = "dropdown-item";

                    pCategory.Controls.Add(btn);
                }
                LinkButton btnW = new LinkButton();
                btnW.Text = "Wszystkie";
                btnW.Click += choosingCategories;
                btnW.CommandArgument = "wszystkie";
                btnW.CssClass = "dropdown-item";
                pCategory.Controls.Add(btnW);
                //Ładowanie kolorów
                List<string> colors = getColors();
                foreach (string color in colors)
                {
                    LinkButton btn = new LinkButton();
                    btn.Text = color[0].ToString().ToUpper() + color.Substring(1);
                    btn.Click += choosingColors;
                    btn.CssClass = "dropdown-item";

                    pColor.Controls.Add(btn);
                }
                LinkButton btnW2 = new LinkButton();
                btnW2.Text = "Wszystkie";
                btnW2.Click += choosingColors;
                btnW2.CommandArgument = "wszystkie";
                btnW2.CssClass = "dropdown-item";
                pColor.Controls.Add(btnW2);
            }catch(Exception ex)
            {
                MessageBox(this, "Brak połączenia z bazą danych");
            }
        }

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

        public static int insert(string table, string[] Values)
        {

            MySqlConnection conn = connect();
            if (conn == null) return -1;
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "INSERT INTO " + table + " VALUES ('";
            string val = "";
            foreach (string value in Values)
            {
                val += value + "', '";
            }
            val = val.Remove(val.Length - 3);
            command.CommandText += val + ")";

            command.ExecuteNonQuery();
            return 0;
        }

        public List<Product> searchProducts(string query)
        {
            MySqlConnection conn = connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT * FROM produkty WHERE name LIKE '%"+query+"%' ORDER BY price ASC";

            MySqlDataReader reader = command.ExecuteReader();
            List<Product> data = new List<Product>();
            while (reader.Read())
            {
                data.Add(new Product((int)reader["ID"], (string)reader["name"], (string)reader["description"], (double)reader["price"], (string)reader["color"], (string)reader["image"], (string)reader["category"]));
            }
            return data;
        }

        public List<Product> getProducts(string type, string type2)
        {
            MySqlConnection conn = connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();
            if (type == "wszystkie")
            {
                command.CommandText = "SELECT * FROM produkty";
            }
            else if (type2 == "category")
            {
                command.CommandText = "SELECT * FROM produkty WHERE category = '" + type + "'";
            }
            else if (type2 == "color")
            {
                command.CommandText = "SELECT * FROM produkty WHERE color = '" + type + "'";
            }
            else if (type == "wszystkieDESC")
            {
                command.CommandText = "SELECT * FROM produkty ORDER BY price DESC";
            }
            else if (type == "wszystkieASC")
            {
                command.CommandText = "SELECT * FROM produkty ORDER BY price ASC";
            }
            MySqlDataReader reader = command.ExecuteReader();
            List<Product> data = new List<Product>();
            while (reader.Read())
            {
                data.Add(new Product((int)reader["ID"], (string)reader["name"], (string)reader["description"], (double)reader["price"], (string)reader["color"], (string)reader["image"], (string)reader["category"]));
            }
            return data;
        }

        public List<string> getCategories()
        {
            MySqlConnection conn = connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT category FROM produkty GROUP BY category";
            MySqlDataReader reader = command.ExecuteReader();
            List<string> data = new List<string>();
            while (reader.Read())
            {
                data.Add((string)reader[0]);
            }
            return data;
        }

        public List<string> getColors()
        {
            MySqlConnection conn = connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT color FROM produkty GROUP BY color";
            MySqlDataReader reader = command.ExecuteReader();
            List<string> data = new List<string>();
            while (reader.Read())
            {
                data.Add((string)reader[0]);
            }
            return data;
        }

        public static User getUser(string username)
        {
            MySqlConnection conn = connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT * FROM users WHERE username='" + username + "'";
            MySqlDataReader reader = command.ExecuteReader();
            User user;
            reader.Read();
            if (!reader.HasRows)
                return null;
            user = new SklepInternetowy.User((string)reader["username"], (string)reader["salt"], (string)reader["hash"], (bool)reader["admin"]);
            return user;
        }

        protected void choosingCategories(object sender, EventArgs e)
        {
            LinkButton now = (LinkButton)sender;
            string txt = now.Text;
            pItems.Controls.Clear();
            txt = txt.ToLower();
            List<Product> products = getProducts(txt, "category");
            int i = 0;
            HtmlGenericControl[] containers = new HtmlGenericControl[(int)(products.Count / 4) + 1];
            for (int j = 0; j < containers.Length; j++)
            {
                containers[j] = new HtmlGenericControl("div");
                containers[j].Attributes["class"] = "row";
            }
            foreach (Product product in products)
            {
                containers[(int)(i / 4)].Controls.Add(product.getHtmlSmall());
                product.btnBuy.Click += btnBuy_Click;
                i++;
            }
            if (i % 4 != 0)
                for (int j = 0; j < 4 - i % 4; j++)
                {
                    HtmlGenericControl col = new HtmlGenericControl("div");
                    col.Attributes["class"] = "col productEmpty";
                    containers[(int)(i / 4)].Controls.Add(col);
                }
            for (int j = 0; j < containers.Length; j++)
            {
                pItems.Controls.Add(containers[j]);
            }
        }
        protected void choosingColors(object sender, EventArgs e)
        {
            LinkButton now = (LinkButton)sender;
            string txt = now.Text;
            pItems.Controls.Clear();
            txt = txt.ToLower();
            List<Product> products = getProducts(txt, "color");
            int i = 0;
            HtmlGenericControl[] containers = new HtmlGenericControl[(int)(products.Count / 4) + 1];
            for (int j = 0; j < containers.Length; j++)
            {
                containers[j] = new HtmlGenericControl("div");
                containers[j].Attributes["class"] = "row";
            }
            foreach (Product product in products)
            {
                containers[(int)(i / 4)].Controls.Add(product.getHtmlSmall());
                product.btnBuy.Click += btnBuy_Click;
                i++;
            }
            if (i % 4 != 0)
                for (int j = 0; j < 4 - i % 4; j++)
                {
                    HtmlGenericControl col = new HtmlGenericControl("div");
                    col.Attributes["class"] = "col productEmpty";
                    containers[(int)(i / 4)].Controls.Add(col);
                }
            for (int j = 0; j < containers.Length; j++)
            {
                pItems.Controls.Add(containers[j]);
            }
        }
        protected void btnDesc(object sender, EventArgs e)
        {
            pItems.Controls.Clear();
            List<Product> products = getProducts("wszystkieDESC", "AAA");
            int i = 0;
            HtmlGenericControl[] containers = new HtmlGenericControl[(int)(products.Count / 4) + 1];
            for (int j = 0; j < containers.Length; j++)
            {
                containers[j] = new HtmlGenericControl("div");
                containers[j].Attributes["class"] = "row";
            }
            foreach (Product product in products)
            {
                containers[(int)(i / 4)].Controls.Add(product.getHtmlSmall());
                product.btnBuy.Click += btnBuy_Click;
                i++;
            }
            if (i % 4 != 0)
                for (int j = 0; j < 4 - i % 4; j++)
                {
                    HtmlGenericControl col = new HtmlGenericControl("div");
                    col.Attributes["class"] = "col productEmpty";
                    containers[(int)(i / 4)].Controls.Add(col);
                }
            for (int j = 0; j < containers.Length; j++)
            {
                pItems.Controls.Add(containers[j]);
            }
        }
        protected void btnAsc(object sender, EventArgs e)
        {
            pItems.Controls.Clear();
            List<Product> products = getProducts("wszystkieASC", "AAA");
            int i = 0;
            HtmlGenericControl[] containers = new HtmlGenericControl[(int)(products.Count / 4) + 1];
            for (int j = 0; j < containers.Length; j++)
            {
                containers[j] = new HtmlGenericControl("div");
                containers[j].Attributes["class"] = "row";
            }
            foreach (Product product in products)
            {
                containers[(int)(i / 4)].Controls.Add(product.getHtmlSmall());
                product.btnBuy.Click += btnBuy_Click;
                i++;
            }
            if (i % 4 != 0)
                for (int j = 0; j < 4 - i % 4; j++)
                {
                    HtmlGenericControl col = new HtmlGenericControl("div");
                    col.Attributes["class"] = "col productEmpty";
                    containers[(int)(i / 4)].Controls.Add(col);
                }
            for (int j = 0; j < containers.Length; j++)
            {
                pItems.Controls.Add(containers[j]);
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

        protected void lbtnUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Account.aspx");
        }
        protected void btnBuy_Click(object sender, EventArgs e)
        {
            
            try
            {
                Button now = (Button)sender;
                List<string> previous = (List<string>)Session["array"];
                previous.Add(now.ToolTip);
                Session["array"] = previous;
                string spoko = "";
            }
            catch
            {
                string failed = "";
            }
            
        }

        public static void MessageBox(System.Web.UI.Page page, string strMsg)
        {
            //+ character added after strMsg "')"
            ScriptManager.RegisterClientScriptBlock(page, page.GetType(), "alertMessage", "alert('" + strMsg + "')", true);

        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            Session["search"] = ((TextBox)((ImageButton)sender).Parent.Controls[2]).Text;
            Response.Redirect(Request.RawUrl);
        }
    }
}