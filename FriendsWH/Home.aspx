<%@ Page Title="" Language="C#" MasterPageFile="~/Friends.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FriendsWH.Home" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
        <br /><br />
  <div class="carousel-inner" >
    <div class="carousel-item active" style="align-content:center">
      <img class="d-block   w-75"  style="height:450px;margin-left:200px "    src="images/1.jpg" alt="First slide">
       <div class="carousel-caption d-none d-md-block">
            <h5>Friends Warehouses Are Welcoming You</h5>
            <p>here we can serve you 24/7</p>
       </div>  
    </div>
    <div class="carousel-item">
      <img class="d-block   w-75"  style="height:450px;margin-left:200px "     src="images/2.jpg" alt="Second slide">
      <div class="carousel-caption d-none d-md-block">
           <%-- <h3  style="color:black">Friends Warehouses Are Welcoming You</h3>
            <p>here we can serve you 24/7</p>--%>
       </div>   
    </div>
    <div class="carousel-item">
      <img class="d-block   w-75"  style="height:450px;margin-left:200px "     src="images/3.jpeg" alt="Third slide">
      <div class="carousel-caption d-none d-md-block">
          <%--  <h4>Friends Warehouses Are Welcoming You</h4>
            <p>here we can serve you 24/7</p>--%>
       </div> 
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</asp:Content>
