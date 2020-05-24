using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class SupplyingPermission : System.Web.UI.Page
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

                //Supplier
                FriendsEntities ent3 = new FriendsEntities();

                var sups = (from itm in ent3.Suppliers
                            select new { itm.Supplier_Id, itm.Supplier_Name });
                DropDownList3.DataSource = sups;
                DropDownList3.DataTextField = "Supplier_Name";
                DropDownList3.DataValueField = "Supplier_Id";
                DropDownList3.DataBind();


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

            Sup_Per_Item spi = new Sup_Per_Item();
            spi.Sup_Per_Id = int.Parse(TextBox2.Text);
            spi.Sup_Per_Item_Id = int.Parse(DropDownList2.SelectedValue);
            spi.Sup_Per_Item_Quantity = int.Parse(TextBox3.Text);
            spi.Sup_Per_Item_Pro_Date= DateTime.Parse(Request["txtDatePicker2"].ToString());
            spi.Sup_Per_Item_Validation = int.Parse(TextBox4.Text);
            spi.Sup_Id = int.Parse(DropDownList3.SelectedValue);
            FriendsEntities ent = new FriendsEntities();
            ent.Sup_Per_Item.AddObject(spi);
            ent.SaveChanges();
            TextBox4.Text = string.Empty;
            mpePopUp.Show();
            Label2.Text = "item is added to permission number : " + spi.Sup_Per_Id;

            DropDownList1.SelectedValue = default;
            DropDownList2.SelectedValue = default;
            DropDownList3.SelectedValue = default;
            TextBox4.Text = string.Empty;
            TextBox3.Text = string.Empty;

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
            try
            {
                Supply_Permission sp = new Supply_Permission();
                sp.Sup_Per_Id = int.Parse(TextBox1.Text);
                sp.Sup_Per_WH_Id = int.Parse(DropDownList1.SelectedValue);
                sp.Sup_Per_Date = DateTime.Parse(Request["txtDatePicker3"].ToString());
                FriendsEntities ent = new FriendsEntities();
                ent.Supply_Permission.AddObject(sp);
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
            try
            {
                FriendsEntities ent = new FriendsEntities();

                var res = from e1 in ent.Items
                          join e2 in ent.Sup_Per_Item
                              on e1.Item_Id equals e2.Sup_Per_Item_Id
                          join c in ent.Suppliers
                          on e2.Sup_Id equals c.Supplier_Id
                          join ep in ent.Supply_Permission
                             on e2.Sup_Per_Id equals ep.Sup_Per_Id
                          join wh in ent.Warehouses
                          on ep.Sup_Per_WH_Id equals wh.WH_Id
                          select new
                          {
                              Sup_Per_Id = e2.Sup_Per_Id,
                              WH_Name = wh.WH_Name,
                              Sup_Per_Date = ep.Sup_Per_Date,
                              Item_Name = e1.Item_Name,
                              Sup_Per_Item_Quantity = e2.Sup_Per_Item_Quantity,
                              Sup_Per_Item_Pro_Date = e2.Sup_Per_Item_Pro_Date,
                              Sup_Per_Item_Validation = e2.Sup_Per_Item_Validation,
                              Supplier_Name = c.Supplier_Name

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