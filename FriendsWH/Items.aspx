<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="FriendsWH.Items" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div class="container">

        <div class="row">
            <div class="col btn btn-light" style=" width:400px; border:solid red 3px;border-radius:3%">
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="New Item" />

            <br /><br />

            <span class="btn btn-light">ID&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">Code&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></span><br />
            <span class="btn btn-light">Name&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></span><br />
            <span class="btn btn-light">
         


                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button2"  class="btn btn-danger ml-lg-5"  runat="server" Text="Add New Item" OnClick="Button2_Click" />  

            </span>
        </div>
          <div class="col btn btn-light" style=" width:400px; margin-left:300px;border:solid red 3px;border-radius:3%"  >

            <asp:Button ID="Button4"  CssClass="btn btn-primary" runat="server" Text="New Measure " />
            <br /><br />

            <span class="btn btn-light">
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">

                 </asp:DropDownList>
            </span>
            <br />
            <h4  class="btn btn-light">Write Item Measure</h4><br />

            <span class="btn btn-light"> <asp:TextBox ID="TextBox4" CssClass="alert-light"  runat="server"></asp:TextBox>
            <asp:Button ID="Button5" CssClass="btn btn-danger" runat="server" Text="Add" OnClick="Button5_Click" />
                </span>
        </div>
        

       </div>

    </div>
    <br />
    <br />

    
    <br />
    <div class="container">
        <div class="col ">
                 <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Get All Items" OnClick="Button3_Click" />

             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Item_Id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:TemplateField HeaderText="Code">
                         <EditItemTemplate>
                             <asp:TextBox ID="txt_code" runat="server" Text='<%# Bind("Item_Code") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("Item_Code") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Name">
                         <EditItemTemplate>
                             <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("Item_Name") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("Item_Name") %>'></asp:Label>
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
        </div>
        <div class="col">
        </div>
    </div>
   

</asp:Content>
