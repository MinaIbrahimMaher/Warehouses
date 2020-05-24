<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="FriendsWH.Reports" %>
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
            $('#txtDatePicker4').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
            $('#txtDatePicker5').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
            $('#txtDatePicker6').datepicker(
                {
                    dateFormat: 'yy-mm-dd',
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1950:2100'
                });
            $('#txtDatePicker7').datepicker(
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
    <%-- warehouses Report--%>
    <div style="opacity:0.9 ; border:dashed 2px yellow" class="btn btn-light">
        
    
        <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="About Warehouses" /> <br />
       
        <span class="btn btn-light"> <asp:DropDownList  ID="DropDownList1" runat="server"></asp:DropDownList></span><br />
       <span class="btn btn-light">From&nbsp;&nbsp;<input name="txtDatePicker2" id="txtDatePicker2" type="text" /></span><br />
       <span class="btn btn-light">To&nbsp;&nbsp;<input name="txtDatePicker3" id="txtDatePicker3" type="text" /></span><br />
       <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Get Report" OnClick="Button2_Click" /> 
        <br />
  <br />
        
        <h3  class="btn btn-light">Supplying Permissions</h3>
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

        <br />
        <br />
           <h3  class="btn btn-light">Export Permissions</h3>
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
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
      

    </div>


    <br />


    <br />
    <br />


    <br />
   <%-- items Report--%>
        <div style="opacity:0.9 ; border:dashed 2px yellow" class="btn btn-light">

     <asp:Button ID="Button3" CssClass="btn btn-danger" runat="server" Text="About Items" /> <br />
       
        <span class="btn btn-light"> Item<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList></span><br />
       <span class="btn btn-light">Warehouse <asp:DropDownList  ID="DropDownList3" runat="server"></asp:DropDownList></span>
    <br /> <span class="btn btn-light">All Warehouses 
    <asp:CheckBox ID="CheckBox1" runat="server" />
    <br />
    From&nbsp;&nbsp;<input name="txtDatePicker4" id="txtDatePicker4" type="text" /></span><br />
       <span class="btn btn-light">To&nbsp;&nbsp;<input name="txtDatePicker5" id="txtDatePicker5" type="text" /></span><br />
       <asp:Button ID="Button4" CssClass="btn btn-primary" runat="server" Text="Get Report" OnClick="Button4_Click" /> 
        <br />
  <br />
  
        <h3  class="btn btn-light">Supplying Permissions</h3>
    <br />
     <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Sup_Per_Id" HeaderText="Permission ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="Warehouse" />
            <asp:BoundField DataField="Sup_Per_Date" HeaderText="Permission Date" />
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
    <br />
            

     <h3  class="btn btn-light">Export Permissions</h3>
    <br />
       <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Ex_Per_Id" HeaderText="Permission ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="Warehouse" />
            <asp:BoundField DataField="Ex_Per_Date" HeaderText="Permission Date" />
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
      
            </div>
       <br /><br /><br />
    <%--Transfers report--%>
        <div style="opacity:0.9 ; border:dashed 2px yellow" class="btn btn-light">
                 <asp:Button ID="Button5" CssClass="btn btn-danger" runat="server" Text="About Transfers" /> <br />
       
        <span class="btn btn-light"> Item<asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList>
                 <br />
                 </span><br />
         <span class="btn btn-light">All Items<asp:CheckBox ID="CheckBox2" runat="server" />
                 <br />
                 Warehouse <asp:DropDownList  ID="DropDownList5" runat="server"></asp:DropDownList></span><br />
                 <span class="btn btn-light">All Warehouses 
        <asp:CheckBox ID="CheckBox3" runat="server" /></span>
        <br />
        <span class="btn btn-light">From&nbsp;&nbsp;<input name="txtDatePicker6" id="txtDatePicker6" type="text" /></span><br />
            <span class="btn btn-light">To&nbsp;&nbsp;<input name="txtDatePicker7" id="txtDatePicker7" type="text" /></span><br />
            <asp:Button ID="Button6" CssClass="btn btn-primary" runat="server" Text="Get Report" OnClick="Button6_Click" /> 
        <br />
        <br />
                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
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
    </asp:GridView><br />
            </div>
    <br />
    
    <br /><br />
   <%-- items Report--%>
        <div style="opacity:0.9 ; border:dashed 2px yellow" class="btn btn-light">

     <asp:Button ID="Button7" CssClass="btn btn-danger" runat="server" Text="Items exist for a Period of Time" /> <br />
       
   <h2 class=" btn btn-light">The Duaration in months :</h2>
            <h2 class=" btn btn-light">&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </h2>
            <br />
       <asp:Button ID="Button8" CssClass="btn btn-primary" runat="server" Text="Get Report" OnClick="Button8_Click" /> 
        <br />
  <br />
  
    <br />
     <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Sup_Per_Id" HeaderText="Permission ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="Warehouse" />
            <asp:BoundField DataField="Sup_Per_Date" HeaderText="Permission Date" />
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
    <br />

     
      
            </div>
    <br />   <br />   <br />
     <%-- items Report--%>
        <div style="opacity:0.9 ; border:dashed 2px yellow" class="btn btn-light">

     <asp:Button ID="Button9" CssClass="btn btn-danger" runat="server" Text="Items expires in a Period of Time"/> <br />
       
   <h2 class=" btn btn-light">The Duaration in months :</h2>
            <h2 class=" btn btn-light">&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </h2>
            <br />
       <asp:Button ID="Button10" CssClass="btn btn-primary" runat="server" Text="Get Report" OnClick="Button9_Click" /> 
        <br />
  <br />
  
    <br />
     <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Item_Name" HeaderText="Item" />
            <asp:BoundField DataField="Sup_Per_Id" HeaderText="Permission ID" />
            <asp:BoundField DataField="WH_Name" HeaderText="Warehouse" />
            <asp:BoundField DataField="Sup_Per_Date" HeaderText="Permission Date" />
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
    <br />

     
      
            </div>
      

</asp:Content>
