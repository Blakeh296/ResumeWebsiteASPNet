<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoverLetter.aspx.cs" Inherits="ResumeWebsite.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blake Cover Letter</title>

    <style = "Text/CSS">
        .HeaderNav
        {
            font-size: 30px;
            border-left:solid;
            border-bottom:double;
        }

        .HeaderNav a 
        {
            text-decoration: none;
            color: black;
        }

        .HeaderNav a:hover
        {
            background-color: #669ef9;
            Text-Shadow: 5px 5px 5px #669ef9;
			Color: Yellow;
        }

        .CoverLetter
        {
            text-align:center;
            border:groove;
        }
        </style>

</head>
<body>

    <form id="form1" runat="server">
        <table class="HeaderNav">
            <thead>
                <tr>
                    <th> <a href="Default.aspx">Resume |</a></th>
                    <th> <a href ="CoverLetter.aspx"> Cover Letter</a></th>
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
