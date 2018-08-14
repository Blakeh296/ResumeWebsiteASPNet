<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerInfo.aspx.cs" Inherits="ResumeWebsite.CustomerInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact DB</title>
    <style type ="text/css">
        .NameTxtboxes
        {
            position:relative;
            top:10px;
        }
        .CompanyName
        {
            position:relative;
            top:20px;
        }
        .AddressLine1
        {
            position:relative;
            top:30px;
        }
        .AddressLine2
        {
            position:relative;
            right:12px;
            top:40px;
        }
        .City
        {
            position:relative;
            top:50px;
        }
        .State
        {
            position:relative;
            top:35px;
            left:150px;
        }
        .HeaderNav
        {text-align:center;font-size: 30px;width: 100%;
         margin-top: 1px;margin-bottom: 0px;height: 37px;}
        
        .HeaderNav a 
        {text-decoration: none;color: black;display:block; background-color:#eee;}

        .HeaderNav a:hover
        {background-color: #4CAF50;Text-Shadow: 5px 5px 5px #808080;Color: white;}
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
       
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Contacts]" DeleteCommand="DELETE FROM [Contacts] WHERE [ContactID] = @ContactID" InsertCommand="INSERT INTO [Contacts] ([FirstName], [LastName], [CompanyName], [MiddleInit], [AddressLine1], [AddressLine2], [City], [State], [PostalCode], [Email]) VALUES (@FirstName, @LastName, @CompanyName, @MiddleInit, @AddressLine1, @AddressLine2, @City, @State, @PostalCode, @Email)" UpdateCommand="UPDATE [Contacts] SET [FirstName] = @FirstName, [LastName] = @LastName, [CompanyName] = @CompanyName, [MiddleInit] = @MiddleInit, [AddressLine1] = @AddressLine1, [AddressLine2] = @AddressLine2, [City] = @City, [State] = @State, [PostalCode] = @PostalCode, [Email] = @Email WHERE [ContactID] = @ContactID">
                <DeleteParameters>
                    <asp:Parameter Name="ContactID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="MiddleInit" Type="String" />
                    <asp:Parameter Name="AddressLine1" Type="String" />
                    <asp:Parameter Name="AddressLine2" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="MiddleInit" Type="String" />
                    <asp:Parameter Name="AddressLine1" Type="String" />
                    <asp:Parameter Name="AddressLine2" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="ContactID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ContactID" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ContactID" HeaderText="ContactID" InsertVisible="False" ReadOnly="True" SortExpression="ContactID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                    <asp:BoundField DataField="MiddleInit" HeaderText="MiddleInit" SortExpression="MiddleInit" />
                    <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" SortExpression="AddressLine1" />
                    <asp:BoundField DataField="AddressLine2" HeaderText="AddressLine2" SortExpression="AddressLine2" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                </Columns>
            </asp:GridView>
            <asp:Panel ID="Panel1" runat="server">
             <div class="NameTxtboxes">
                <asp:Label ID="Label1" runat="server" Text="First Name : "></asp:Label>
                <asp:TextBox ID="tbFname" runat="server" Height="17px"></asp:TextBox> 
                <asp:Label ID="Label2" runat="server" Text="Middle Name : "></asp:Label>
                <asp:TextBox ID="tbMiddleInit" runat="server"></asp:TextBox>
                <asp:Label ID="Label3" runat="server" Text="Last Name : "></asp:Label>
                <asp:TextBox ID="tbLname" runat="server"></asp:TextBox> </div>
             <div class ="CompanyName">
                <asp:Label ID="Label4" runat="server" Text="CompanyName : "></asp:Label>
                <asp:TextBox ID="tbCompanyName" runat="server"></asp:TextBox></div>
            <div class ="AddressLine1">
                <asp:Label ID="Label5" runat="server" Text="Address Line 1 : "></asp:Label>
                <asp:TextBox ID="tbAddressLine1" runat="server" Width="238px"></asp:TextBox></div>
            <div class ="AddressLine2">>
                <asp:Label ID="Label6" runat="server" Text="Address Line 2 : "></asp:Label>
                <asp:TextBox ID="tbAddressLine2" runat="server" Width="238px"></asp:TextBox></div>
            <div class="City">
                <asp:Label ID="Label7" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="tbCity" runat="server"></asp:TextBox></div>
            <div class="State">
                <asp:Label ID="Label8" runat="server" Text="State : "></asp:Label>
                <asp:TextBox ID="tbState" runat="server"></asp:TextBox></div>
            <div class ="PostalCode">
                <asp:Label ID="Label9" runat="server" Text="Postal Code : "></asp:Label>
                <asp:TextBox ID="tbPostalCode" runat="server" Width="74px"></asp:TextBox></div>
            <div class ="Email">
                <asp:Label ID="Label10" runat="server" Text="Email : "></asp:Label>
                <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox></div>
                <asp:Button ID="btnAddContact" runat="server" OnClick="btnAddContact_Click" Text="Add Contact" />
            </asp:Panel>
    </form>
</body>
</html>
