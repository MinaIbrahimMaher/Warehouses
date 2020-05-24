<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="Warehouses.aspx.cs" Inherits="FriendsWH.Warehouses" %>
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
    <div class="btn btn-light" style=" width:400px; margin-left:300px;border:solid red 3px;border-radius:3%"  >

    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="New Warehouse" />

    <br /><br />

    <span class="btn btn-light">ID&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </span><br />
    <span class="btn btn-light">Name&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">Location&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">Manager Name&nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></span><br />
    <span class="btn btn-light">
         


         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button2"  class="btn btn-danger ml-lg-5"  runat="server" Text="Add New One" OnClick="Button2_Click" />  

     </span>
        </div>
    <br />
    <br />
     <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Get All Warehouses" OnClick="Button3_Click" />

    <br />

    <br />

    <asp:GridView ID="GridView1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="645px" DataKeyNames="WH_Id">
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("WH_Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WH_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_loc" runat="server" Text='<%# Bind("WH_Location") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("WH_Location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Manager">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_manager" runat="server" Text='<%# Bind("WH_Manager") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("WH_Manager") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />

        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
    <br />

</asp:Content>
