﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ResumeWebsite.Login" %>

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
    <table class="HeaderNav">
            <thead>
                <tr>
                    <th> <a href="Default.aspx">Resume </a></th>
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
            </thead>
        </table>
    <form id="form1" runat="server">
        <div class="LoginDiv"> <p>UserName :</p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <p>Password :</p>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Width="80px" style="margin-left: 27px; margin-top: 15px" />
            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" style="margin-left: 40px" Text="Register" />
        </div>
            <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
