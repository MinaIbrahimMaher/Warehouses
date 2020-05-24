<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="Transfer.aspx.cs" Inherits="FriendsWH.Transfer1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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
            <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="New Transfer" />

            <br /><br />
            <span class="btn btn-light">ID&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox> </span><br />

            <span class="btn btn-light">Source&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Destination&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Item&nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Quantity&nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </span><br />
            <span class="btn btn-light">Supplier&nbsp;&nbsp;<asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList></span><br />
            <span class="btn btn-light">Production Date &nbsp;&nbsp;<input name="txtDatePicker3" id="txtDatePicker3" type="text" /><br />
            <span class="btn btn-light">Validation&nbsp;&nbsp;<asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>&nbsp;&nbsp;/months </span><br />
             
            </span><br />
            <span class="btn btn-light">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button  ID="Button2"  class="btn btn-danger ml-lg-5"  runat="server" Text="Transfer" OnClick="Button2_Click" />  
            </span>
        </div>
          <div class="col"  >

         </div>
        </div>

    </div>
    <br />
    <br />
 <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Get All Transfers" OnClick="Button3_Click" /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="Trans_Id" HeaderText="Trans ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="From " />
            <asp:BoundField DataField="WH_Name2" HeaderText="To" />
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier" />
            <asp:BoundField DataField="Pro_Date" HeaderText="Pro Date" />
            <asp:BoundField DataField="Validation" HeaderText="Validation" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>


</asp:Content>
