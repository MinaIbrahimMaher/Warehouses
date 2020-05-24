using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class ExportPermission : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
            if (!Page.IsPostBack)
            {
                //WH
                FriendsEntities ent = new FriendsEntities();

                var WH = (from itm in ent.Warehouses
                          select new { itm.WH_Id, itm.WH_Name });
                DropDownList1.DataSource = WH;
                DropDownList1.DataTextField = "WH_Name";
                DropDownList1.DataValueField = "WH_Id";
                DropDownList1.DataBind();

                //Item
                FriendsEntities ent2 = new FriendsEntities();

                var itms = (from itm in ent2.Items
                            select new { itm.Item_Id, itm.Item_Name });
                DropDownList2.DataSource = itms;
                DropDownList2.DataTextField = "Item_Name";
                DropDownList2.DataValueField = "Item_Id";
                DropDownList2.DataBind();

                //Customer
                FriendsEntities ent3 = new FriendsEntities();

                var custs = (from itm in ent3.Customers
                             select new { itm.Customer_Id, itm.Customer_Name });
                DropDownList3.DataSource = custs;
                DropDownList3.DataTextField = "Customer_Name";
                DropDownList3.DataValueField = "Customer_Id";
                DropDownList3.DataBind();
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
            }

            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {

        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            try { 
            Ex_Per_Item epi = new Ex_Per_Item();
            epi.Ex_Per_Id = int.Parse(TextBox2.Text);
            epi.Ex_Per_Item_Id = int.Parse(DropDownList2.SelectedValue);
            epi.Cus_ID = int.Parse(DropDownList3.SelectedValue);
            epi.Ex_Per_Item_Quantity = int.Parse(TextBox4.Text);
            FriendsEntities ent = new FriendsEntities();
            ent.Ex_Per_Item.AddObject(epi);
            ent.SaveChanges();
            TextBox4.Text = string.Empty;
            mpePopUp.Show();
            Label2.Text = "item is added to permission number : " + epi.Ex_Per_Id;

            DropDownList1.SelectedValue = default;
            DropDownList2.SelectedValue = default;
            DropDownList3.SelectedValue = default;

                //ep.Ex_Per_WH_Id = int.Parse(DropDownList1.SelectedValue);
                //ep.Ex_Per_Date = DateTime.Parse(Request["txtDatePicker3"].ToString());
                //FriendsEntities ent = new FriendsEntities();
                //ent.Export_Permission.AddObject(ep);
                //ent.SaveChanges();
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try { 
            Export_Permission ep = new Export_Permission();
            ep.Ex_Per_Id = int.Parse(TextBox1.Text);
            ep.Ex_Per_WH_Id = int.Parse(DropDownList1.SelectedValue);
            ep.Ex_Per_Date= DateTime.Parse(Request["txtDatePicker3"].ToString());
            FriendsEntities ent = new FriendsEntities();
            ent.Export_Permission.AddObject(ep);
            ent.SaveChanges();
            mpePopUp.Show();
            Label2.Text = "Permission Done";

            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }


        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            try { 
            FriendsEntities ent = new FriendsEntities();

            var res = from e1 in ent.Items
                      join e2 in ent.Ex_Per_Item
                          on e1.Item_Id equals e2.Ex_Per_Item_Id
                          join c in ent.Customers
                          on e2.Cus_ID equals c.Customer_Id
                          join ep in ent.Export_Permission
                          on e2.Ex_Per_Id equals ep.Ex_Per_Id
                          join wh in ent.Warehouses
                          on ep.Ex_Per_WH_Id equals wh.WH_Id
                      select new
                      {
                          Ex_Per_Id = e2.Ex_Per_Id,
                          WH_Name=wh.WH_Name,
                          Ex_Per_Date=ep.Ex_Per_Date,
                          Item_Name = e1.Item_Name,
                          Ex_Per_Item_Quantity= e2.Ex_Per_Item_Quantity,
                          Customer_Name=c.Customer_Name
                      };

            GridView1.DataSource = res;
            GridView1.DataBind();
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }
    }
}