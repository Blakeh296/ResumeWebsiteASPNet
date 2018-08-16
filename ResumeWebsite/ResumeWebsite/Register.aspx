<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ResumeWebsite.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style type="text/css">
        .auto-style1 {
            width: 503px;
            height: 137px;
            margin-left: 180px;
        }
        #Registry
        {
            position:relative;
            top:20px;
            left:340px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
             <img class="auto-style1" src="Images/register.gif" />
        <div id="Registry">
            <asp:Label ID="Label1" runat="server" Text="Label">UserName :</asp:Label><br />
            <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox><br /><br />
            <asp:Label ID="Label2" runat="server" Text="Label">Password :</asp:Label><br />
        <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox><br /><br />
            <asp:Label id="Label3" runat="server">Password Conformation :</asp:Label><br />
        <asp:TextBox ID="txtbox3" runat="server"></asp:TextBox>
            <asp:Button ID="btnRegister" runat="server" OnClientClick="validateUserInfo()" OnClick="btnRegister_Click" style="margin-left: 40px" Text="Register" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
    <script>
        function validateUserInfo() {

            let validated = true;
            let userName = document.getElementById('<%=tbUserName.ClientID%>');
            let userPass = document.getElementById('<%=tbPassword.ClientID%>');
            let passConf = document.getElementById('<%=txtbox3.ClientID%>');

            if (userName.length && userPass.length < 8) {
                alert('UserName, Password or both are not long enough');
                validated = false;
            }

            if (userPass != passConf)
            {
                alert('Passwords do not match');
                validated = false;
            }
            var doesPwHaveNumber = false;
            for (i = 0; i < userPass.length; i++) {
                var isthisNumber = parseInt(userPass.charAt(i));
                if (Number.isInteger(isthisNumber.valueOf) == true) {
                    doesPwHaveNumber = true;
                }
            }
            if (doesPwHaveNumber == false) {
                alert('Password must contain one number');
                validated = false;
            }
            else {
                alert('UserName and Password Registration accepted!');
                validated = true;
            }
            return validated;
        }
    </script>
</body>
</html>
