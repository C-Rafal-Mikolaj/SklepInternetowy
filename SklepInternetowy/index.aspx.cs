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
        protected void Page_Load(object sender, EventArgs e)
        {
            connect();
            tbSearch.Attributes.Add("placeholder", "Wyszukaj");

            //Ładowanie produktów
            List<Product> products = getProducts();
            int i = 0;
            HtmlGenericControl[] containers = new HtmlGenericControl[(int)(products.Count/4)+1];
            for(int j =0;j<containers.Length;j++)
            {
                containers[j] = new HtmlGenericControl("div");
                containers[j].Attributes["class"] = "row";
            }
            foreach(Product product in products)
            {
                containers[(int)(i/4)].Controls.Add(product.getHtmlSmall());
                product.btnBuy.Click += btnBuy_Click;
                i++;
            }
            if(i%4!=0)
                for(int j = 0; j < 4 - i % 4; j++) {
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
            foreach(string category in categories)
            {
                LinkButton btn = new LinkButton();
                btn.Text = category[0].ToString().ToUpper()+category.Substring(1);
                btn.CssClass = "dropdown-item";

                pCategory.Controls.Add(btn);
            }

            //Ładowanie kolorów
            List<string> colors = getColors();
            foreach (string color in colors)
            {
                LinkButton btn = new LinkButton();
                btn.Text = color[0].ToString().ToUpper() + color.Substring(1);
                btn.CssClass = "dropdown-item";

                pColor.Controls.Add(btn);
            }


        }

        MySqlConnection connect()
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

        public int insert(string table, string[] Values)
        {

            MySqlConnection conn = connect();
            if (conn == null) return -1;
            MySqlCommand command = conn.CreateCommand();
            command.CommandText = "INSERT INTO "+table+" VALUES ('";
            string val = "";
            foreach (string value in Values)
            {
                val += value + ", ";
            }
            val = val.Remove(val.Length-2);
            command.CommandText += val+")";

            command.ExecuteNonQuery();
            return 0;
        }

        public List<Product> getProducts()
        {
            MySqlConnection conn = connect();
            if (conn == null) return null;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT * FROM produkty";
            MySqlDataReader reader = command.ExecuteReader();
            List<Product> data = new List<Product>();
            while (reader.Read())
            {
                data.Add(new Product((int)reader["ID"],(string)reader["name"], (string)reader["description"], (double)reader["price"], (string)reader["color"], (string)reader["image"], (string)reader["category"]));
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

        protected void lbtnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            
        }
    }
}