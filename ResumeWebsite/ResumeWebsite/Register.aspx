<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ResumeWebsite.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style type="text/css">
        .HeaderNav
        {text-align:center;font-size: 30px;width: 100%;
         margin-top: 1px;margin-bottom: 0px;height: 37px;}
        

        .HeaderNav a 
        {text-decoration: none;color: black;display:block; background-color:#eee;}

        .HeaderNav a:hover
        {background-color: #4CAF50;Text-Shadow: 5px 5px 5px #808080;Color: white;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
        <div>
            <p>UserName :</p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <p>Password :</p>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label id="passconf" runat="server">Password Conformation :</asp:Label>
            <br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" style="margin-left: 40px" Text="Register" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
