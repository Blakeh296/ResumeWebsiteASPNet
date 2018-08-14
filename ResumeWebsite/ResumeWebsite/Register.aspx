<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ResumeWebsite.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
            
        <div>
            <p>UserName :</p>
            <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
            <p>Password :</p>
        <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label id="tbPassConf" runat="server">Password Conformation :</asp:Label>
            <br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="btnRegister" runat="server" OnClientClick="validateUserInfo()" OnClick="btnRegister_Click" style="margin-left: 40px" Text="Register" />
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
    <script>
        function validateUserInfo() {

            let validated = true;
            let userName = document.getElementById('<%=tbUserName.ClientID%>');
            let userPass = document.getElementById('<%=tbPassword.ClientID%>');
            let passConf = document.getElementById('<%=tbPassConf.ClientID%>');

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
