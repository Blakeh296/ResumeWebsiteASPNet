<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoverLetter.aspx.cs" Inherits="ResumeWebsite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blake Cover Letter</title>

    <style = "Text/CSS">
        .HeaderNav
        {
            font-size: 30px;
            width: 100%;
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

        .HeaderNav a:active
        {
            background-color: #4286f4;
            color:white;
        }

        .CoverLetter
        {
            text-align:center;
            border:groove;
        }

        .CoverLetter:hover
        {
            background-color:#4286f4;
            color:white;
        }
        </style>

</head>
<body>

    <form id="form1" runat="server">
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
                <tr>
                    <th><a href ="CustomerInfo.aspx">Customers Info</a></th>
                </tr>
            </thead>
        </table>
    </form>

    <p>Dear R + L Global Logistics :</p>

    <div class ="CoverLetter">

        <p>I hope to be concidered for the SQL Developer position, as advertised on the Indeed job search site.  
        I am a long time fan of your companies work! <br /> I was overjoyed when I discovered R + L offers employment in my area.
        Just like you I put people first, everytime, always.</p>

    </div>
    

</body>
</html>
