<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStateCalculator.aspx.cs" Inherits="ResumeWebsite.ViewStateCalculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ViewStateCalculator</title>
    <style type ="text/css">
        #tbOutPut
        {
            background-color:darkslategrey;
            color:white;
            height: 20px;
            width: 90%;
            position:relative;
            top: 13px;
            left: 12px;
            text-align:center;
        }
        #tbInput1
        {
            background-color:darkslategrey;
            color:white;
            margin-top:4px;
            height: 20px;
            width: 32%;
            text-align:center;
        }
        #tbInput2
        {
            background-color:darkslategrey;
            color:white;
            margin-top:4px;
            height:20px;
            width: 32%;
            text-align:center;
        }
        #btnEquals
        {
            background-color:red;
            color:white;
            height: 25px;
            width: 40px;
            position:relative;
            left: 160px;
            top: 8px;
        }
        #Panel1
        {
            position:relative;
            left:30%;
            background-color:black;
            border-left-color:red;
            border-right-color:red;
            border-top-color:blue;
            border-bottom-color:blue;
            border-style:solid;
            border-width:3px;
        }
        #Panel1:hover
        {
            box-shadow: blue 3px 3px 50px;
            background-color: blue;
           
        }
        #h1
        {
            position:relative;
            left:38%;
        }
        #cbMath
        {
            background-color:cornflowerblue;
            color:white;
        }
        #btnEquals:hover
        {
            background-color:yellow;
            color:black;
        }
        #cbMath:hover
        {
            background-color:yellow;
            color:black;
        }
        #tbInput1:hover
        {
            background-color:red;
        }
        #tbInput2:hover
        {
            background-color:red;
        }
        #tbOutPut:hover
        {
            background-color:red;
        }
         .HeaderNav
        {text-align:center;font-size: 30px;width: 100%;
         margin-top: 1px;margin-bottom: 0px;height: 37px;}
        
        .HeaderNav a 
        {text-decoration: none;color: black;display:block; background-color:#eee;}

        .HeaderNav a:hover
        {background-color: #4CAF50;Text-Shadow: 5px 5px 5px #808080;Color: white;}

        #ListBox1
        {
            height:80px;
            width:200px;
            position: relative;
            left:39%;
            text-align:center;
        }
        .History
        {
            width:100%;
            text-align:center;
            font-size:120%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ImageButton ID="ImageButton1" runat="server" Height="33px" ImageUrl="~/Images/logout-hi.png" OnClick="ImageButton1_Click1" Width="139px" />
        <br />
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
        
        <div>
            <h1 id="h1">Calculator Pro !</h1>
            <div>
                <asp:Panel ID="Panel1" runat="server" Height="98px" Width="372px">
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbInput1" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="cbMath" runat="server">
                        <asp:ListItem Selected="True">Add</asp:ListItem>
                        <asp:ListItem>Subtract</asp:ListItem>
                        <asp:ListItem>Multiply</asp:ListItem>
                        <asp:ListItem>Divide</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="tbInput2" runat="server"></asp:TextBox>
                    <asp:Button ID="btnEquals" runat="server" OnClick="btnEquals_Click" Text="=" />
                <br />
                    <asp:TextBox ID="tbOutPut" runat="server"></asp:TextBox>
                </asp:Panel>
            </div>
        </div><br />
        <br />
        
        <p class="History">History</p>
        <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
    </form>
</body>
</html>
