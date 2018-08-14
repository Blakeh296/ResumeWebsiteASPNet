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

    </style>
</head>
<body style="height: 137px">
    <table id="Header" class="HeaderNav">
            <thead>
                <tr>
                    <th> <a id="link1" href="Default.aspx">Resume </a></th>
                </tr>
                <tr>
                    <th> <a href ="CoverLetter.aspx"> Cover Letter</a></th>
                </tr>
                <tr>
                    <th><a href ="Login.aspx">Login</a></th>
                </tr>
                <tr>
                    <th><a href ="ViewStateCalculator.aspx">ViewStateCalculator</a></th>
                </tr>
                <tr>
                    <th><a href ="CustomerInfo.aspx">Customers Info</a></th>
                </tr>
            </thead>
        </table>
    <form id="form1" class="LoginDiv" runat="server">
            <p><a href="Register.aspx">Register Here</a></p>
            <p>UserName :</p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <p>Password :</p>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Width="80px" style="margin-left: 27px; margin-top: 15px" />
            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" style="margin-left: 40px" Text="Register" />
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <p>
                &nbsp;</p>
    </form>
    
</body>
</html>
