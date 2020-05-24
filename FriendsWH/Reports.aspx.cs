using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsWH
{
    public partial class Reports : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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

                    DropDownList3.DataSource = WH;
                    DropDownList3.DataTextField = "WH_Name";
                    DropDownList3.DataValueField = "WH_Id";
                    DropDownList3.DataBind();

                    DropDownList5.DataSource = WH;
                    DropDownList5.DataTextField = "WH_Name";
                    DropDownList5.DataValueField = "WH_Id";
                    DropDownList5.DataBind();
                    //Items
                    FriendsEntities ent2 = new FriendsEntities();

                    var itms = (from itm in ent2.Items
                                select new { itm.Item_Id, itm.Item_Name });
                    DropDownList2.DataSource = itms;
                    DropDownList2.DataTextField = "Item_Name";
                    DropDownList2.DataValueField = "Item_Id";
                    DropDownList2.DataBind();

                    DropDownList4.DataSource = itms;
                    DropDownList4.DataTextField = "Item_Name";
                    DropDownList4.DataValueField = "Item_Id";
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                int x = int.Parse(DropDownList1.SelectedValue);
                DateTime dtf = DateTime.Parse(Request["txtDatePicker2"].ToString());
                DateTime dtt = DateTime.Parse(Request["txtDatePicker3"].ToString());
                //WH suplying report
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
                          where wh.WH_Id == x
                          && ep.Sup_Per_Date >= dtf
                          && ep.Sup_Per_Date <= dtt
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


                //WH export report
                FriendsEntities ent2 = new FriendsEntities();

                var res2 = from e1 in ent2.Items
                           join e2 in ent2.Ex_Per_Item
                               on e1.Item_Id equals e2.Ex_Per_Item_Id
                           join c in ent2.Customers
                           on e2.Cus_ID equals c.Customer_Id
                           join ep in ent2.Export_Permission
                           on e2.Ex_Per_Id equals ep.Ex_Per_Id
                           join wh in ent2.Warehouses
                           on ep.Ex_Per_WH_Id equals wh.WH_Id
                           where wh.WH_Id == x
                           && ep.Ex_Per_Date >= dtf
                           && ep.Ex_Per_Date <= dtt
                           select new
                           {
                               Ex_Per_Id = e2.Ex_Per_Id,
                               WH_Name = wh.WH_Name,
                               Ex_Per_Date = ep.Ex_Per_Date,
                               Item_Name = e1.Item_Name,
                               Ex_Per_Item_Quantity = e2.Ex_Per_Item_Quantity,
                               Customer_Name = c.Customer_Name
                           };

                GridView2.DataSource = res2;
                GridView2.DataBind();
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }



        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {

                int item = int.Parse(DropDownList4.SelectedValue);
                int ware = int.Parse(DropDownList5.SelectedValue);
                bool all = CheckBox1.Checked;
                DateTime dtf = DateTime.Parse(Request["txtDatePicker4"].ToString());
                DateTime dtt = DateTime.Parse(Request["txtDatePicker5"].ToString());
                //WH suplying report
                FriendsEntities ent = new FriendsEntities();
                if (!all)
                {

                    var res = from e1 in ent.Items
                              join e2 in ent.Sup_Per_Item
                                  on e1.Item_Id equals e2.Sup_Per_Item_Id
                              join c in ent.Suppliers
                              on e2.Sup_Id equals c.Supplier_Id
                              join ep in ent.Supply_Permission
                                 on e2.Sup_Per_Id equals ep.Sup_Per_Id
                              join wh in ent.Warehouses
                              on ep.Sup_Per_WH_Id equals wh.WH_Id
                              where wh.WH_Id == ware
                              && e2.Sup_Per_Item_Id == item
                              && ep.Sup_Per_Date >= dtf
                              && ep.Sup_Per_Date <= dtt

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

                    GridView3.DataSource = res;
                    GridView3.DataBind();


                    //WH export report
                    FriendsEntities ent2 = new FriendsEntities();

                    var res2 = from e1 in ent2.Items
                               join e2 in ent2.Ex_Per_Item
                                   on e1.Item_Id equals e2.Ex_Per_Item_Id
                               join c in ent2.Customers
                               on e2.Cus_ID equals c.Customer_Id
                               join ep in ent2.Export_Permission
                               on e2.Ex_Per_Id equals ep.Ex_Per_Id
                               join wh in ent2.Warehouses
                               on ep.Ex_Per_WH_Id equals wh.WH_Id
                               where wh.WH_Id == ware
                               && e2.Ex_Per_Item_Id == item
                               && ep.Ex_Per_Date >= dtf
                               && ep.Ex_Per_Date <= dtt
                               select new
                               {
                                   Ex_Per_Id = e2.Ex_Per_Id,
                                   WH_Name = wh.WH_Name,
                                   Ex_Per_Date = ep.Ex_Per_Date,
                                   Item_Name = e1.Item_Name,
                                   Ex_Per_Item_Quantity = e2.Ex_Per_Item_Quantity,
                                   Customer_Name = c.Customer_Name
                               };

                    GridView4.DataSource = res2;
                    GridView4.DataBind();


                }
                else
                {

                    var res = from e1 in ent.Items
                              join e2 in ent.Sup_Per_Item
                                  on e1.Item_Id equals e2.Sup_Per_Item_Id
                              join c in ent.Suppliers
                              on e2.Sup_Id equals c.Supplier_Id
                              join ep in ent.Supply_Permission
                                 on e2.Sup_Per_Id equals ep.Sup_Per_Id
                              join wh in ent.Warehouses
                              on ep.Sup_Per_WH_Id equals wh.WH_Id
                              where e2.Sup_Per_Item_Id == item
                              && ep.Sup_Per_Date >= dtf
                              && ep.Sup_Per_Date <= dtt
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

                    GridView3.DataSource = res;
                    GridView3.DataBind();
                    //WH export report
                    FriendsEntities ent2 = new FriendsEntities();

                    var res2 = from e1 in ent2.Items
                               join e2 in ent2.Ex_Per_Item
                                   on e1.Item_Id equals e2.Ex_Per_Item_Id
                               join c in ent2.Customers
                               on e2.Cus_ID equals c.Customer_Id
                               join ep in ent2.Export_Permission
                               on e2.Ex_Per_Id equals ep.Ex_Per_Id
                               join wh in ent2.Warehouses
                               on ep.Ex_Per_WH_Id equals wh.WH_Id
                               where e2.Ex_Per_Item_Id == item
                               && ep.Ex_Per_Date >= dtf
                               && ep.Ex_Per_Date <= dtt
                               select new
                               {
                                   Ex_Per_Id = e2.Ex_Per_Id,
                                   WH_Name = wh.WH_Name,
                                   Ex_Per_Date = ep.Ex_Per_Date,
                                   Item_Name = e1.Item_Name,
                                   Ex_Per_Item_Quantity = e2.Ex_Per_Item_Quantity,
                                   Customer_Name = c.Customer_Name
                               };

                    GridView4.DataSource = res2;
                    GridView4.DataBind();



                }
            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }



        protected void Button6_Click(object sender, EventArgs e)
        {
            try { 
            int item = int.Parse(DropDownList2.SelectedValue);
            int ware = int.Parse(DropDownList3.SelectedValue);
            bool itms = CheckBox2.Checked;
            bool wares = CheckBox3.Checked;
            DateTime dtf = DateTime.Parse(Request["txtDatePicker6"].ToString());
            DateTime dtt = DateTime.Parse(Request["txtDatePicker7"].ToString());

            FriendsEntities ent2 = new FriendsEntities();

                if (itms && wares)
                {
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

                    GridView5.DataSource = res;
                    GridView5.DataBind();


                }
                else if (itms && !wares)
                {
                    var res = from wh1 in ent2.Warehouses
                              join t1 in ent2.Transfers
                              on wh1.WH_Id equals t1.WH_From_Id
                              join wh2 in ent2.Warehouses
                              on t1.WH_To_Id equals wh2.WH_Id
                              join itm in ent2.Items
                              on t1.Item_Id equals itm.Item_Id
                              join s in ent2.Suppliers
                              on t1.Sup_Id equals s.Supplier_Id
                              where t1.WH_From_Id == ware || t1.WH_To_Id == ware
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

                    GridView5.DataSource = res;
                    GridView5.DataBind();

                }
                else if (!itms && wares)
                {
                    var res = from wh1 in ent2.Warehouses
                              join t1 in ent2.Transfers
                              on wh1.WH_Id equals t1.WH_From_Id
                              join wh2 in ent2.Warehouses
                              on t1.WH_To_Id equals wh2.WH_Id
                              join itm in ent2.Items
                              on t1.Item_Id equals itm.Item_Id
                              join s in ent2.Suppliers
                              on t1.Sup_Id equals s.Supplier_Id
                              where itm.Item_Id == item
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

                    GridView5.DataSource = res;
                    GridView5.DataBind();



                }
                else
                {
                    var res = from wh1 in ent2.Warehouses
                              join t1 in ent2.Transfers
                              on wh1.WH_Id equals t1.WH_From_Id
                              join wh2 in ent2.Warehouses
                              on t1.WH_To_Id equals wh2.WH_Id
                              join itm in ent2.Items
                              on t1.Item_Id equals itm.Item_Id
                              join s in ent2.Suppliers
                              on t1.Sup_Id equals s.Supplier_Id
                              where itm.Item_Id == item
                              && (t1.WH_From_Id == ware || t1.WH_To_Id == ware)
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

                    GridView5.DataSource = res;
                    GridView5.DataBind();

                }
            }

            catch
            {
            mpePopUp.Show();
            Label2.Text = "try again";
            }

        }
        

        protected void Button8_Click(object sender, EventArgs e)
        {
            try
            {
                int duration = 30 * int.Parse(TextBox1.Text);
                FriendsEntities ent = new FriendsEntities();
                DateTime now = DateTime.Now;
                int month = now.Month - duration;
                DateTime old = now.AddDays(-duration);
                var res = from e1 in ent.Items
                          join e2 in ent.Sup_Per_Item
                          on e1.Item_Id equals e2.Sup_Per_Item_Id
                          join c in ent.Suppliers
                          on e2.Sup_Id equals c.Supplier_Id
                          join ep in ent.Supply_Permission
                             on e2.Sup_Per_Id equals ep.Sup_Per_Id
                          join wh in ent.Warehouses
                          on ep.Sup_Per_WH_Id equals wh.WH_Id
                          join e3 in ent.Supply_Permission
                          on e2.Sup_Per_Id equals e3.Sup_Per_Id
                          where (e3.Sup_Per_Date < old)
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

                GridView6.DataSource = res;
                GridView6.DataBind();
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


                int duration = 30 * int.Parse(TextBox2.Text);
                FriendsEntities ent = new FriendsEntities();
                DateTime now = DateTime.Now;
                int month = now.Month - duration;
                DateTime old = now.AddDays(-duration);
                var res = from e1 in ent.Items
                          join e2 in ent.Sup_Per_Item
                          on e1.Item_Id equals e2.Sup_Per_Item_Id
                          join c in ent.Suppliers
                          on e2.Sup_Id equals c.Supplier_Id
                          join ep in ent.Supply_Permission
                             on e2.Sup_Per_Id equals ep.Sup_Per_Id
                          join wh in ent.Warehouses
                          on ep.Sup_Per_WH_Id equals wh.WH_Id
                          join e3 in ent.Supply_Permission
                          on e2.Sup_Per_Id equals e3.Sup_Per_Id
                          where (e2.Sup_Per_Item_Pro_Date.Month-e2.Sup_Per_Item_Validation < old.Month)
                          //needs time
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

                GridView7.DataSource = res;
                GridView7.DataBind();

            }
            catch
            {
                mpePopUp.Show();
                Label2.Text = "try again";
            }
        }
    }
}