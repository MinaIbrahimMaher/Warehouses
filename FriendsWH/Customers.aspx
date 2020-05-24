<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="FriendsWH.Customers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <br />

     <%--the hidden section start--%>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>

     <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
     <ajaxToolkit:ModalPopupExtender ID="mpePopUp" runat="server" TargetControlID="lblHidden" PopupControlID="divPopUp" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>

     <div  id="divPopUp" class="btn btn-light" style="background-color:aqua; border-color:blue; border-width:3px; border-radius:20%; margin:100px">
        
        <span class="alert-light">
            <asp:Label ID="Label2"  runat="server" Text="Label"></asp:Label><br />
        </span>

        <span class="btn btn-danger" style="margin-left:30px">
            <asp:Button id="btnOk" CssClass="btn-danger" runat="server" text="Ok" OnClick="btnOk_Click" />
        </span>
     </div>
    <%--the hidden section end--%>
    <div class="btn btn-light" style=" width:400px; margin-left:300px;border:solid red 3px;border-radius:3%"  >

    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="New Customer" />

    <br /><br />

    <span class="btn btn-light">ID&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </span><br />
    <span class="btn btn-light">Name&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">Phone&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">Fax&nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">Mobile Phone&nbsp;&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox> </span><br />
    <span class="btn btn-light">Email&nbsp;&nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">Website&nbsp;&nbsp;<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></span><br />
   
    <span class="btn btn-light">
         


         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button2"  class="btn btn-danger ml-lg-5"  runat="server" Text="Add New One" OnClick="Button2_Click" />  

     </span>
        </div>
    <br />
    <br />
     <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Get All Customers" OnClick="Button3_Click" />

    <br />

    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Customer_Id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("Customer_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Customer_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_phone" runat="server" Text='<%# Bind("Customer_Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Customer_Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_fax" runat="server" Text='<%# Bind("Customer_Fax") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Customer_Fax") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_mobile" runat="server" Text='<%# Bind("Customer_Mobile_Phone") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Customer_Mobile_Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("Customer_Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Customer_Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Website">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_website" runat="server" Text='<%# Bind("Customer_Website") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Customer_Website") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    <br />

    <br />

</asp:Content>
