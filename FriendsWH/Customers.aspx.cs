using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                Customer wh = new Customer();
                wh.Customer_Id = int.Parse(TextBox1.Text);
                wh.Customer_Name = TextBox2.Text;
                wh.Customer_Phone = int.Parse(TextBox3.Text);
                wh.Customer_Fax = int.Parse(TextBox4.Text);
                wh.Customer_Mobile_Phone = int.Parse(TextBox5.Text);
                wh.Customer_Email = TextBox6.Text;
                wh.Customer_Website = TextBox7.Text;

                FriendsEntities ent = new FriendsEntities();
                ent.Customers.AddObject(wh);
                ent.SaveChanges();
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                TextBox4.Text = string.Empty;
                TextBox5.Text = string.Empty;
                TextBox6.Text = string.Empty;
                TextBox7.Text = string.Empty;
                mpePopUp.Show();
                Label2.Text = "New Customer is added";
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
            try
            {
                FriendsEntities ent = new FriendsEntities();
                var ds = (from wh in ent.Customers
                          select new
                          {
                              wh.Customer_Id,
                              wh.Customer_Name,
                              wh.Customer_Phone,
                              wh.Customer_Fax,
                              wh.Customer_Mobile_Phone,
                              wh.Customer_Email,
                              wh.Customer_Website

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
            var ds = (from wh in ent.Customers
                      select new
                      {
                          wh.Customer_Id,
                          wh.Customer_Name,
                          wh.Customer_Phone,
                          wh.Customer_Fax,
                          wh.Customer_Mobile_Phone,
                          wh.Customer_Email,
                          wh.Customer_Website

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
            var ds = (from wh in ent.Customers
                      select new
                      {
                          wh.Customer_Id,
                          wh.Customer_Name,
                          wh.Customer_Phone,
                          wh.Customer_Fax,
                          wh.Customer_Mobile_Phone,
                          wh.Customer_Email,
                          wh.Customer_Website

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
            var wh = (from warehouse in ent.Customers
                      where warehouse.Customer_Id == id
                      select warehouse).First();
            wh.Customer_Name = name;
            wh.Customer_Email = email;
            wh.Customer_Website = website;
            wh.Customer_Phone = int.Parse(phone);
            wh.Customer_Mobile_Phone = int.Parse(mobile);
            wh.Customer_Fax = int.Parse(fax);
            ent.SaveChanges();
            ent.SaveChanges();

            GridView1.EditIndex = -1;

            var ds = (from wh2 in ent.Customers
                      select new
                      {
                          wh2.Customer_Id,
                          wh2.Customer_Name,
                          wh2.Customer_Phone,
                          wh2.Customer_Fax,
                          wh2.Customer_Mobile_Phone,
                          wh2.Customer_Email,
                          wh2.Customer_Website

                      }).ToList();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            mpePopUp.Show();
            Label2.Text = " the Customer is Updated";
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
            var wh = (from warehouse in ent.Customers
                      where warehouse.Customer_Id == id
                      select warehouse).First();
            ent.Customers.DeleteObject(wh);
            ent.SaveChanges();

            var ds = (from wh2 in ent.Customers
                      select new
                      {
                          wh2.Customer_Id,
                          wh2.Customer_Name,
                          wh2.Customer_Phone,
                          wh2.Customer_Fax,
                          wh2.Customer_Mobile_Phone,
                          wh2.Customer_Email,
                          wh2.Customer_Website

                      }).ToList();
            GridView1.DataSource = ds;
            GridView1.DataBind();
            mpePopUp.Show();
            Label2.Text = "The Customer is Deleted";
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }

    }
}