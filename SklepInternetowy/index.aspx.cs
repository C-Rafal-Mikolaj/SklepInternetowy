using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            connect();
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

        public int reader(string table)
        {
            MySqlConnection conn = connect();
            if (conn == null) return -1;
            MySqlCommand command = conn.CreateCommand();

            command.CommandText = "SELECT * FROM "+table;
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                return (int)reader["ID"];
            }
            return -1;
        }

    }
}