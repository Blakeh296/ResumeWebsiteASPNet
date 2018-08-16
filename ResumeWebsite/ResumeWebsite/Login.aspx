<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResumeWebsite.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type ="text/css">

        #form1 {
            height: 112px;
        }
        .HeaderNav
        {text-align:center;font-size: 30px;width: 100%;
         margin-top: 1px;margin-bottom: 0px;height: 37px;}
        

        .HeaderNav a 
        {text-decoration: none;color: black;display:block; background-color:#eee;}

        .HeaderNav a:hover
        {background-color: #4CAF50;Text-Shadow: 5px 5px 5px #808080;Color: white;}

        .LoginDiv
        {
            position:relative;
            left:40%;
            top:30px;
        }

        .auto-style1 {
        }

    </style>
</head>
<body style="height: 137px">
    <table id="Header" class="HeaderNav">
            <thead>
                <tr>
                    <th><asp:Label ID="lblLogin" runat="server" Text="Label"><a href ="Login.aspx">Login</a></asp:Label></th>
                </tr>
                <tr>
                    <th> <asp:Label ID="lblResume" runat="server" Text="Label"><a id="link1" href="Default.aspx">Resume </a></asp:Label> </th>
                </tr>
                <tr>
                    <th><asp:Label ID="lblCoverLetter" runat="server" Text="Label"><a href ="CoverLetter.aspx"> Cover Letter</a></asp:Label></th>
                </tr>
                
                <tr>
                    <th><asp:Label ID="lblViewStateCal" runat="server" Text="Label"><a href ="ViewStateCalculator.aspx">ViewStateCalculator</a></asp:Label></th>
                </tr>
                <tr>
                    <th><asp:Label ID="lblCustomerInfo" runat="server" Text="Label"><a href ="CustomerInfo.aspx">Customers Info</a></asp:Label></th>
                </tr>
                <tr>
                    <th><asp:Label ID="lblQuery" runat="server" Text="Label"><a href ="QuerySQL.aspx">Query AdventureWorks2012</a></asp:Label></th>
                </tr>
            </thead>
        </table>
    <form id="form1" class="LoginDiv" runat="server">
        <div id="UserName">
            <asp:Label ID="Label1" runat="server" Text="UserName :"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        </div>
        <div id="Password">
            <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="LoginBtn" runat="server" OnClick="btnLogin" Text="Login" Width="80px" style="margin-left: 27px; margin-top: 15px" />
        </div>
        <p>
            <asp:Image runat="server" ID="GreenCheck" class="auto-style1" src="Images/greencheck.jpg" Height="203px" Width="223px" /><asp:Image runat="server" id="WelcomeIMG" src="Images/welcome-featured-image.jpg" style="top: -5px; margin-left: 0px;" Height="312px" Width="943px" BorderColor="Black" />
        </p>
    <p>
        &nbsp;</p>
        &nbsp;
        <br /><br />
        &nbsp;<asp:Label ID="RegisterLink" runat="server" Text="Label"><a href="Register.aspx">Register Here</a></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <p>
                &nbsp;</p>
    </form>
    
</body>
</html>
