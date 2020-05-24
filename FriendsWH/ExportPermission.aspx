<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="ExportPermission.aspx.cs" Inherits="FriendsWH.ExportPermission" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <script>
        $(function () {
            $('#txtDatePicker').datepicker(
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
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="New Export Permission" />

            <br /><br />

            <span class="btn btn-light">ID&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">Warehouse&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Date&nbsp;&nbsp;<input name="txtDatePicker3" id="txtDatePicker3" type="text" />
             
            </span><br />
            <span class="btn btn-light">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button2"  class="btn btn-danger ml-lg-5"  runat="server" Text="Add Permission" OnClick="Button2_Click" />  
            </span>
        </div>
          <div class="col btn btn-light" style=" width:400px; margin-left:300px;border:solid red 3px;border-radius:3%"  >

     
            <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Add Items To Permission" />

            <br /><br />

            <span class="btn btn-light">Permission ID&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">New Item&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Quantity&nbsp;&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">Customer&nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList></span><br />

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
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Ex_Per_Id" HeaderText="Permission ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="Warehouse" />
            <asp:BoundField DataField="Ex_Per_Date" HeaderText="Permission Date" />
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Ex_Per_Item_Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Customer_Name" HeaderText="Customer" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>

</asp:Content>
