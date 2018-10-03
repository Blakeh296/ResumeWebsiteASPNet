<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebServiceDemo.aspx.cs" Inherits="ResumeWebsite.WebServiceDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
        .HeaderNav
        {
            text-align:center;
            font-size: 30px;
            width: 100%;
            margin-top: 1px;
            margin-bottom: 0px;
            height: 37px;
        }

        .HeaderNav a 
        {
            text-decoration: none;
            color: black;
            background-color: #eee;
            display:block;
        }

            .HeaderNav a:hover {
                background-color: #4CAF50;
                Text-Shadow: 5px 5px 5px #808080;
                Color: white;
            }

        #ListBox1
        {
            position:relative;
            left:-2%;
            right:2%;
            top: 0px;
        }

        #BulletedList1
        {
            position:relative;
            left:40%;
            right:40%;
        }
        #btnBinaryTest{
            position:relative;
            left:5%;
            right:-5%;
            top: 0px;
        }
        #tbTextBox1{
            position:relative;
            left:40%;
            right:40%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" ImageUrl="~/Images/logout-hi.png" OnClick="ImageButton1_Click" Width="139px" />

        <table class="HeaderNav">
            <thead>
                <tr><th><a href ="Login.aspx">Login</a></th></tr>
                <tr><th> <a href="Default.aspx">Resume </a></th></tr>
                <tr><th> <a href ="CoverLetter.aspx"> Cover Letter</a></th></tr>
                <tr><th><a href ="ViewStateCalculator.aspx">ViewStateCalculator</a></th></tr>
                <tr><th><a href ="CustomerInfo.aspx">Customers Info</a></th></tr>
            </thead>
        </table>
        <div>
            <asp:BulletedList ID="BulletedList1" runat="server">
            </asp:BulletedList>
        </div>
            <asp:ListBox ID="ListBox1" runat="server" Font-Size="11pt" Height="120px" Width="238px"></asp:ListBox> <br />
            <asp:TextBox ID="tbTextbox1" runat="server"></asp:TextBox>
            <asp:Button ID="btnBinaryTest" runat="server" Text="Decimal to Binary" OnClick="btnBinaryTest_Click" />
    </form>
</body>
</html>
