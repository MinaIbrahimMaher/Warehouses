using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class Suppliers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }





        protected void Button2_Click(object sender, EventArgs e)
        {
            try { 
            Supplier wh = new Supplier();
            wh.Supplier_Id = int.Parse(TextBox1.Text);
            wh.Supplier_Name = TextBox2.Text;
            wh.Supplier_Phone = int.Parse(TextBox3.Text);
            wh.Supplier_Fax = int.Parse(TextBox4.Text);
            wh.Supplier_Mobile_Phone = int.Parse(TextBox5.Text);
            wh.Supplier_Email = TextBox6.Text;
            wh.Supplier_Website = TextBox7.Text;

            FriendsEntities ent = new FriendsEntities();
            ent.Suppliers.AddObject(wh);
            ent.SaveChanges();
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox7.Text = string.Empty;
            mpePopUp.Show();
            Label2.Text = "New Supplier is added";
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
        protected void Button3_Click(object sender, EventArgs e)//get all
        {
            try { 
            FriendsEntities ent = new FriendsEntities();
            var ds = (from wh in ent.Suppliers
                      select new
                      {
                          wh.Supplier_Id,
                          wh.Supplier_Name,
                          wh.Supplier_Phone,
                          wh.Supplier_Fax,
                          wh.Supplier_Mobile_Phone,
                          wh.Supplier_Email,
                          wh.Supplier_Website

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

        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            try { 
            GridView1.EditIndex = -1;
            FriendsEntities ent = new FriendsEntities();
            var ds = (from wh in ent.Suppliers
                      select new
                      {
                          wh.Supplier_Id,
                          wh.Supplier_Name,
                          wh.Supplier_Phone,
                          wh.Supplier_Fax,
                          wh.Supplier_Mobile_Phone,
                          wh.Supplier_Email,
                          wh.Supplier_Website

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
            try { 
            GridView1.EditIndex = e.NewEditIndex;
            FriendsEntities ent = new FriendsEntities();
            var ds = (from wh in ent.Suppliers
                      select new
                      {
                          wh.Supplier_Id,
                          wh.Supplier_Name,
                          wh.Supplier_Phone,
                          wh.Supplier_Fax,
                          wh.Supplier_Mobile_Phone,
                          wh.Supplier_Email,
                          wh.Supplier_Website

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
            try { 
            string name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_name")).Text;
            string phone = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_phone")).Text;
            string fax = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_fax")).Text;
            string mobile = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_mobile")).Text;
            string email = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_email")).Text;
            string website = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_website")).Text;

            int id = (int)GridView1.DataKeys[e.RowIndex].Value;

            FriendsEntities ent = new FriendsEntities();
            var wh = (from warehouse in ent.Suppliers
                      where warehouse.Supplier_Id == id
                      select warehouse).First();
            wh.Supplier_Name = name;
            wh.Supplier_Email = email;
            wh.Supplier_Website = website;
            wh.Supplier_Phone = int.Parse(phone);
            wh.Supplier_Mobile_Phone = int.Parse(mobile);
            wh.Supplier_Fax = int.Parse(fax);
            ent.SaveChanges();
            ent.SaveChanges();

            GridView1.EditIndex = -1;

            var ds = (from wh2 in ent.Suppliers
                      select new
                      {
                          wh2.Supplier_Id,
                          wh2.Supplier_Name,
                          wh2.Supplier_Phone,
                          wh2.Supplier_Fax,
                          wh2.Supplier_Mobile_Phone,
                          wh2.Supplier_Email,
                          wh2.Supplier_Website

                      }).ToList();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            mpePopUp.Show();
            Label2.Text = " the Supplier is Updated";

            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try { 

            int id = (int)GridView1.DataKeys[e.RowIndex].Value;

            FriendsEntities ent = new FriendsEntities();
            var wh = (from warehouse in ent.Suppliers
                      where warehouse.Supplier_Id == id
                      select warehouse).First();
            ent.Suppliers.DeleteObject(wh);
            ent.SaveChanges();

            var ds = (from wh2 in ent.Suppliers
                      select new
                      {
                          wh2.Supplier_Id,
                          wh2.Supplier_Name,
                          wh2.Supplier_Phone,
                          wh2.Supplier_Fax,
                          wh2.Supplier_Mobile_Phone,
                          wh2.Supplier_Email,
                          wh2.Supplier_Website

                      }).ToList();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            mpePopUp.Show();
            Label2.Text = "The supplier is Deleted";
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

    }
}