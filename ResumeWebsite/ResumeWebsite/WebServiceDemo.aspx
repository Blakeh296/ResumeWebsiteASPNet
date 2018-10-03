<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebServiceDemo.aspx.cs" Inherits="ResumeWebsite.WebServiceDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListBox ID="ListBox1" runat="server" Font-Size="11pt" Height="120px" Width="238px"></asp:ListBox> <br />
            <asp:TextBox ID="tbTextbox1" runat="server"></asp:TextBox>
            <asp:Button ID="btnBinaryTest" runat="server" Text="Decimal to Binary" OnClick="btnBinaryTest_Click" />
            <asp:BulletedList ID="BulletedList1" runat="server">
            </asp:BulletedList>
        </div>
    </form>
</body>
</html>
