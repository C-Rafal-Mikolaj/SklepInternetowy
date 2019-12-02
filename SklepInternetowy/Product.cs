using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public class Product
    {
        public int ID { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public double price { get; set; }
        public string color { get; set; }
        public string imgUrl { get; set; }
        public string category { get; set; }
        public string currency { get; set; }
        public string buy { get; set; }
        public Button btnBuy { get; set; }

        public Product(int ID, string name, string description, double price, string color, string imgUrl, string category)
        {
            this.ID = ID;
            this.name = name;
            this.description = description;
            this.price = price;
            this.color = color;
            this.imgUrl = imgUrl;
            this.category = category;
            this.currency = "zł";
            this.buy = "Kup teraz";
        }

        public HtmlGenericControl getHtmlSmall()
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes["class"] = "product col";
            HtmlGenericControl img = new HtmlGenericControl("img");
            img.Attributes["class"] = "productImg";
            img.Attributes["src"] = this.imgUrl;
            img.Attributes["alt"] = this.name;
            container.Controls.Add(img);
            HtmlGenericControl name = new HtmlGenericControl("div");
            name.Attributes["class"] = "productName";
            name.InnerText = this.name;
            container.Controls.Add(name);
            HtmlGenericControl category = new HtmlGenericControl("div");
            category.Attributes["class"] = "productCategory";
            category.InnerText = this.category;
            container.Controls.Add(category);
            HtmlGenericControl color = new HtmlGenericControl("div");
            color.Attributes["class"] = "productName";
            color.InnerText = this.color;
            container.Controls.Add(color);
            HtmlGenericControl price = new HtmlGenericControl("div");
            price.Attributes["class"] = "productName";
            price.InnerText = this.price.ToString() + " " + this.currency;
            container.Controls.Add(price);

            Button button = new Button();
            button.ToolTip = this.name;
            button.Text = this.buy;
            button.CssClass = "productBuy";
            this.btnBuy = button;
            container.Controls.Add(button);

            return container;
        }
    }
}