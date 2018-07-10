<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ResumeWebsite.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blake's Resume</title>
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
    <h1>BLAKE HOELLE</h1>
    <h2>352-454-9993/Bhoelle216@gmail.com</h2>
			
			<div id="HLINE"></div>
			
			<h2><strong>AWARDS AND ACCOMPLISHMENTS</strong></h2>
			
			<div id="HLINE2"></div>
		
				<ul>
					<li>Certified in HTML and CSS</li>
					<li>3.4 GPA (High School)</li>
					<li>Microsoft Certified (Word, Excel, PowerPoint, Access)</li>
					<li>AT&T awards for selling</li>
					<li>Consistently over achieved sales Quotas</li>
				</ul>

			<div id="HLINE3"></div>
			
			<h2><strong>EXPERIENCE</strong></h2>
			
			<div id="HLINE4"></div>
			
			<h3>Verizon Wireless (Sales Consultant) -------- Mar 2014 - Dec 2014</h3>
			
				<ul>
				<li>Overachieved Quotas</li>
					<li>Cold Calls</li>
					<li>Handle Multi Line Accounts</li>
					<li>Work with a team</li>
					<li>Follow up with customers</li>
					<li>Given awards for performance</li>
				</ul>
			<h3>AT&T (Lead Sales Advocate)-------- Dec 2014 - Oct 2016</h3>
				<ul>
					<li>Leader in sales</li>
					<li>Cash Handling</li>
					<li>Multi Line accounts</li>
					<li>Sales experience in telecommunication, satellite TV, Internet, Home phones</li>
					<li>Team Leader</li>
					<li>Multiple day customer interactions</li>
					<li>Given awards for performance</li>
				</ul>
			<h3>Cricket Wireless (Store Manager)-------- Dec 2016 - Mar 2017</h3>
				<ul>
					<li>Oversee Employees</li>
					<li>Singlehandedly acheived store goals</li>
					<li>Scheduling</li>
					<li>Activly practices selling techniques</li>
					<li>Maintian Plan-o-Gram compliance for monthly audits</li>
					<li>Responsible over inventory</li>
				</ul>
			<div id="HLINE5"></div>
			<h2><strong>EDUCATION</strong></h2>
			<div id="HLINE6"></div>
				<ul>
					<li>High School DIploma (Advanced Placement)</li>
					<li>Honors 3.4 GPA</li>
					<li>Microsoft Certified (2011 Word, PowerPoint, Excel, Access)</li>
					<li>Strong knoledge in software navigation</li>
					<li>Databae, application and programming student (Current)</li>
				</ul>

</body>
</html>
