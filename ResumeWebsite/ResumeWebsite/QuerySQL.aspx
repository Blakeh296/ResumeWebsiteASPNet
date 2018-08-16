<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuerySQL.aspx.cs" Inherits="ResumeWebsite.QuerySQL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>QuerySQL</title>
    <style type="text/css">
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

        .HeaderNav a:hover
        {
            background-color: #4CAF50;
            Text-Shadow: 5px 5px 5px #808080;
			Color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Button ID="btnLogOut" runat="server" OnClick="btnLogOut_Click" Text="LogOut" />

        <table class="HeaderNav">
            <thead>
                <tr>
                    <th><a href ="Login.aspx">Login</a></th>
                </tr>
                <tr>
                    <th> <a href="Default.aspx">Resume </a></th>
                </tr>
                <tr>
                    <th> <a href ="CoverLetter.aspx"> Cover Letter</a></th>
                </tr>
                
                <tr>
                    <th><a href ="ViewStateCalculator.aspx">ViewStateCalculator</a></th>
                </tr>
                <tr>
                    <th><a href ="CustomerInfo.aspx">Customers Info</a></th>
                </tr>
                <tr>
                    <th><a href ="QuerySQL.aspx">Query AdventureWorks2012</a></th>
                </tr>
            </thead>
        </table>

            <asp:TextBox ID="TextBox1" runat="server" Height="71px" Width="416px"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="Search SQLServer" Width="423px" />
            <br /><br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        
    </form>
</body>
</html>
