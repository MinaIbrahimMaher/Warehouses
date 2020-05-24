<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="SupplyingPermission.aspx.cs" Inherits="FriendsWH.SupplyingPermission" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <script>
        $(function () {
            $('#txtDatePicker1').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
            $('#txtDatePicker2').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
            $('#txtDatePicker3').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
        })  
    </script>

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
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="New Supplying Permission" />

            <br /><br />

            <span class="btn btn-light">ID&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">Warehouse&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Date&nbsp;&nbsp;<input name="txtDatePicker3" id="txtDatePicker3" type="text" />
               
            </span><br />
            <span class="btn btn-light">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button2"  class="btn btn-danger ml-lg-5"  runat="server" Text="Add Permission" OnClick="Button2_Click" />  
            </span>
        </div>
          <div class="col btn btn-light" style="width:400px; margin-left:300px;border:solid red 3px;border-radius:3%"  >

     
            <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Add Items To Permission" />

            <br /><br />

            <span class="btn btn-light">Permission ID&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">New Item&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Quantity&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">Production Date&nbsp;&nbsp;<input name="txtDatePicker2" id="txtDatePicker2" type="text" /></span>
          <br />  <span class="btn btn-light">Validation &nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>&nbsp;&nbsp;/months</span>
<br />            <span class="btn btn-light">Supplier&nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList></span><br />

            <span class="btn btn-light">
         


                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button4"  class="btn btn-danger ml-lg-5"  runat="server" Text="Add New Item" OnClick="Button5_Click" />  

            </span>
         </div>
        </div>

    </div>
    <br />
    <br />
 <asp:Button ID="Button9" class="btn btn-primary" runat="server" Text="Get All Permissions" OnClick="Button9_Click" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Sup_Per_Id" HeaderText="Permission ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="Warehouse" />
            <asp:BoundField DataField="Sup_Per_Date" HeaderText="Permission Date" />
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Sup_Per_Item_Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Sup_Per_Item_Pro_Date" HeaderText="Production Date" />
            <asp:BoundField DataField="Sup_Per_Item_Validation" HeaderText="Validation" />
            <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />

    </asp:GridView>

</asp:Content>
