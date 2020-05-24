using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class Transfer1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    //WH1
                    FriendsEntities ent = new FriendsEntities();

                    var WH = (from itm in ent.Warehouses
                              select new { itm.WH_Id, itm.WH_Name });
                    DropDownList1.DataSource = WH;
                    DropDownList1.DataTextField = "WH_Name";
                    DropDownList1.DataValueField = "WH_Id";
                    DropDownList1.DataBind();
                    //WH2


                    var WH2 = (from itm in ent.Warehouses
                               select new { itm.WH_Id, itm.WH_Name });
                    DropDownList2.DataSource = WH;
                    DropDownList2.DataTextField = "WH_Name";
                    DropDownList2.DataValueField = "WH_Id";
                    DropDownList2.DataBind();

                    //Item
                    FriendsEntities ent2 = new FriendsEntities();

                    var itms = (from itm in ent2.Items
                                select new { itm.Item_Id, itm.Item_Name });
                    DropDownList3.DataSource = itms;
                    DropDownList3.DataTextField = "Item_Name";
                    DropDownList3.DataValueField = "Item_Id";
                    DropDownList3.DataBind();

                    //Supplier
                    FriendsEntities ent3 = new FriendsEntities();

                    var sups = (from itm in ent3.Suppliers
                                select new { itm.Supplier_Id, itm.Supplier_Name });
                    DropDownList4.DataSource = sups;
                    DropDownList4.DataTextField = "Supplier_Name";
                    DropDownList4.DataValueField = "Supplier_Id";
                    DropDownList4.DataBind();
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

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                Transfer t = new Transfer();
                t.Trans_Id = int.Parse(TextBox3.Text);
                t.WH_From_Id = int.Parse(DropDownList1.SelectedValue);
                t.WH_To_Id = int.Parse(DropDownList2.SelectedValue);
                t.Item_Id = int.Parse(DropDownList3.SelectedValue);
                t.Quantity = int.Parse(TextBox1.Text);
                t.Sup_Id = int.Parse(DropDownList4.SelectedValue);
                t.Pro_Date = DateTime.Parse(Request["txtDatePicker3"].ToString());
                t.Validation = int.Parse(TextBox2.Text);
                FriendsEntities ent = new FriendsEntities();
                ent.Transfers.AddObject(t);
                ent.SaveChanges();
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                DropDownList1.SelectedValue = default;
                DropDownList2.SelectedValue = default;
                DropDownList3.SelectedValue = default;
                DropDownList4.SelectedValue = default;
                mpePopUp.Show();
                Label2.Text = "New Transfer Done";
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                FriendsEntities ent2 = new FriendsEntities();

                var res = from wh1 in ent2.Warehouses
                          join t1 in ent2.Transfers
                          on wh1.WH_Id equals t1.WH_From_Id
                          join wh2 in ent2.Warehouses
                          on t1.WH_To_Id equals wh2.WH_Id
                          join itm in ent2.Items
                          on t1.Item_Id equals itm.Item_Id
                          join s in ent2.Suppliers
                          on t1.Sup_Id equals s.Supplier_Id
                          select new
                          {
                              Trans_Id = t1.Trans_Id,
                              WH_Name = wh1.WH_Name,
                              WH_Name2 = wh2.WH_Name,
                              Item_Name = itm.Item_Name,
                              Quantity = t1.Quantity,
                              Supplier_Name = s.Supplier_Name,
                              Pro_Date = t1.Pro_Date,
                              Validation = t1.Validation
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