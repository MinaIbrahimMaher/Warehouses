using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class Items : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try { 
            if (!Page.IsPostBack)
            {
                FriendsEntities ent = new FriendsEntities();

                var itms = (from itm in ent.Items
                            select new { itm.Item_Id, itm.Item_Name });
                DropDownList1.DataSource = itms;
                DropDownList1.DataTextField = "Item_Name";
                DropDownList1.DataValueField = "Item_Id";
                DropDownList1.DataBind();
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            try { 
            Item itm = new Item();
            itm.Item_Id = int.Parse(TextBox1.Text);
            itm.Item_Code = int.Parse(TextBox2.Text);
            itm.Item_Name = TextBox3.Text;
            FriendsEntities ent = new FriendsEntities();
            ent.Items.AddObject(itm);
            ent.SaveChanges();
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            mpePopUp.Show();
            Label2.Text = "New Item is added";


            var itms = (from itm2 in ent.Items
                        select new { itm2.Item_Id, itm2.Item_Name });
            DropDownList1.DataSource = itms;
            DropDownList1.DataTextField = "Item_Name";
            DropDownList1.DataValueField = "Item_Id";
            DropDownList1.DataBind();
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            try { 
            FriendsEntities ent = new FriendsEntities();
            var ds = (from itms in ent.Items
                      select new
                      {
                          itms.Item_Id,
                          itms.Item_Code,
                          itms.Item_Name


                      }).ToList();

            GridView1.DataSource = ds;
            GridView1.DataBind();
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

        protected void Button5_Click(object sender, EventArgs e)
        {
            try { 
            Items_MU mu = new Items_MU();
            mu.Item_Id = int.Parse(DropDownList1.SelectedValue);
            mu.MU_Name = TextBox4.Text;
            FriendsEntities ent = new FriendsEntities();
            ent.Items_MU.AddObject(mu);
            ent.SaveChanges();
            TextBox4.Text = string.Empty;
            DropDownList1.SelectedValue = default;
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try { 
            string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_name")).Text;
            int code = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_code")).Text);
            int id = (int)GridView1.DataKeys[e.RowIndex].Value;

            FriendsEntities ent = new FriendsEntities();
            var wh = (from itm in ent.Items
                      where itm.Item_Id == id
                      select itm).First();
            wh.Item_Name = name;
            wh.Item_Code = code;
            ent.SaveChanges();

            GridView1.EditIndex = -1;

            var ds = (from itms in ent.Items
                      select new
                      {
                          itms.Item_Id,
                          itms.Item_Code,
                          itms.Item_Name

                      }).ToList();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            mpePopUp.Show();
            Label2.Text = " the item is Updated";

            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try { 
            GridView1.EditIndex = e.NewEditIndex;
            FriendsEntities ent = new FriendsEntities();
            var ds = (from itms in ent.Items
                      select new
                      {
                          itms.Item_Id,
                          itms.Item_Code,
                          itms.Item_Name

                      }).ToList();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = (int)GridView1.DataKeys[e.RowIndex].Value;

                FriendsEntities ent = new FriendsEntities();
                var item = (from itm in ent.Items
                            where itm.Item_Id == id
                            select itm).First();
                ent.Items.DeleteObject(item);
                ent.SaveChanges();

                var ds = (from itms in ent.Items
                          select new
                          {
                              itms.Item_Id,
                              itms.Item_Code,
                              itms.Item_Name

                          }).ToList();
                GridView1.DataSource = ds;
                GridView1.DataBind();
                mpePopUp.Show();
                Label2.Text = "The item is Deleted";
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {


        }
    }
}