using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class Warehouses : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                Warehouse wh = new Warehouse();
                wh.WH_Id = int.Parse(TextBox1.Text);
                wh.WH_Name = TextBox2.Text;
                wh.WH_Location = TextBox3.Text;
                wh.WH_Manager = TextBox4.Text;
                FriendsEntities ent = new FriendsEntities();
                ent.Warehouses.AddObject(wh);
                ent.SaveChanges();
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                TextBox4.Text = string.Empty;
                mpePopUp.Show();
                Label2.Text = "New Warehouse is added";
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {

                FriendsEntities ent = new FriendsEntities();
                var ds = (from wh in ent.Warehouses
                          select new
                          {
                              wh.WH_Id,
                              wh.WH_Name,
                              wh.WH_Location,
                              wh.WH_Manager

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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                GridView1.EditIndex = e.NewEditIndex;
                FriendsEntities ent = new FriendsEntities();
                var ds = (from wh in ent.Warehouses
                          select new
                          {
                              wh.WH_Id,
                              wh.WH_Name,
                              wh.WH_Location,
                              wh.WH_Manager

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

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_name")).Text;
                string location = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_loc")).Text;
                string manager = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_manager")).Text;
                int id = (int)GridView1.DataKeys[e.RowIndex].Value;

                FriendsEntities ent = new FriendsEntities();
                var wh = (from warehouse in ent.Warehouses
                          where warehouse.WH_Id == id
                          select warehouse).First();
                wh.WH_Name = name;
                wh.WH_Location = location;
                wh.WH_Manager = manager;
                ent.SaveChanges();

                GridView1.EditIndex = -1;

                var ds = (from wh2 in ent.Warehouses
                          select new
                          {
                              wh2.WH_Id,
                              wh2.WH_Name,
                              wh2.WH_Location,
                              wh2.WH_Manager

                          }).ToList();
                GridView1.DataSource = ds;
                GridView1.DataBind();
                mpePopUp.Show();
                Label2.Text = " the Warehouse is Updated";

            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try { 
            GridView1.EditIndex = -1;
            FriendsEntities ent = new FriendsEntities();
            var ds = (from wh in ent.Warehouses
                      select new
                      {
                          wh.WH_Id,
                          wh.WH_Name,
                          wh.WH_Location,
                          wh.WH_Manager

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
                var wh = (from warehouse in ent.Warehouses
                          where warehouse.WH_Id == id
                          select warehouse).First();
                ent.Warehouses.DeleteObject(wh);
                ent.SaveChanges();

                var ds = (from wh2 in ent.Warehouses
                          select new
                          {
                              wh2.WH_Id,
                              wh2.WH_Name,
                              wh2.WH_Location,
                              wh2.WH_Manager

                          }).ToList();
                GridView1.DataSource = ds;
                GridView1.DataBind();
                mpePopUp.Show();
                Label2.Text = "The Warehouse is Deleted";
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }
    }
}