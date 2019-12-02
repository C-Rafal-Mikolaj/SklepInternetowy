using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SklepInternetowy
{
    public class Order
    {
        public int ID { get; set; }
        public string username { get; set; }
        public string item { get; set; }
        public string status { get; set; }
        public Button changeStatus { get; set; }
        public DropDownList select { get; set; }

        public Order(int ID, string username, string item, string status)
        {
            this.ID = ID;
            this.username = username;
            this.item = item;
            this.status = status;
        }

        public HtmlGenericControl getSmallHtml()
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes.Add("class", "orderItem");
            HtmlGenericControl id = new HtmlGenericControl("div");
            id.Attributes.Add("class", "orderID");
            id.InnerText = "ID: " + this.ID;
            container.Controls.Add(id);
            HtmlGenericControl username = new HtmlGenericControl("div");
            username.Attributes.Add("class", "orderUsername");
            username.InnerText = "Username: " + this.username;
            container.Controls.Add(username);
            HtmlGenericControl item = new HtmlGenericControl("div");
            item.Attributes.Add("class", "orderIt");
            item.InnerText = "Item: " + this.item;
            container.Controls.Add(item);
            
            HtmlGenericControl status = new HtmlGenericControl("div");
            status.Attributes.Add("class", "orderStatus");
            status.InnerText = "Status: " + this.status;
            container.Controls.Add(status);
            DropDownList select = new DropDownList();
            this.select = select;
            ListItem ocz = new ListItem();
            string oczek = "oczekujące";
            ocz.Text = oczek;
            ocz.Value = oczek;
            select.Items.Add(ocz);
            ListItem real = new ListItem();
            string wreal = "w realizacji";
            real.Text = wreal;
            real.Value = wreal;
            select.Items.Add(real);
            ListItem zreal = new ListItem();
            string zreali = "zrealizowano";
            zreal.Text = zreali;
            zreal.Value = zreali;
            select.Items.Add(zreal);
            container.Controls.Add(select);
            Button stat = new Button();
            stat.Attributes.Add("ID", this.ID.ToString());
            stat.Text = "Zmień status";
            this.changeStatus = stat;
            container.Controls.Add(stat);
            return container;
        }

        public HtmlGenericControl getSmallHtmlUser()
        {
            HtmlGenericControl container = new HtmlGenericControl("div");
            container.Attributes.Add("class", "orderItem");
            HtmlGenericControl id = new HtmlGenericControl("div");
            id.Attributes.Add("class", "orderID");
            id.InnerText = "ID: " + this.ID;
            container.Controls.Add(id);
            HtmlGenericControl username = new HtmlGenericControl("div");
            username.Attributes.Add("class", "orderUsername");
            username.InnerText = "Username: " + this.username;
            container.Controls.Add(username);
            HtmlGenericControl item = new HtmlGenericControl("div");
            item.Attributes.Add("class", "orderIt");
            item.InnerText = "Item: " + this.item;
            container.Controls.Add(item);
            
            HtmlGenericControl status = new HtmlGenericControl("div");
            status.Attributes.Add("class", "orderStatus");
            status.InnerText = "Status: " + this.status;
            container.Controls.Add(status);
            
            return container;
        }
    }
}