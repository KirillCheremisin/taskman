<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MyMVCApp.Models.Project>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ProjectList
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <head>
    <title>My Projects</title>

    <link rel="stylesheet" type="text/css" href="../../Content/HEADER.css"/>
    <link rel="stylesheet" type="text/css" href="../../Content/TABLES.css"/>
    <link rel="stylesheet" type="text/css" href="../../Content/BUTTONS.css"/>
    </head>
    <body>
    <div class="TableContainer"> 
      <table width="100%" class="hovertable">
       <caption>Projects' list</caption>
       <thead>
       <tr>
            <th width="30px"></th>
            <th width="80px">Name</th>
            <th>Description</th>
            <th>Author</th>
	        <th>Create date</th>
       </tr>
       </thead>
        <tbody>
        <%foreach (var item in Model) {%>
            <tr>
                <td> <input type="checkbox"/> </td>
                <td> <%: Html.ActionLink(item.Name, "Details", new { id = item.ProjectID})%> </td>
                <td> <%: item.Description %> </td>
                <td> <%: Html.ActionLink(item.Employee.EmployeeName + " " + item.Employee.EmployeeSurname, "Profile", new { controller = "Users", id = item.Employee.EmployeeID })%> </td>
                <td> <%: String.Format("{0:dd MMM yyyy}", item.CrateDate) %> </td>
            </tr>
        <%} %>
        </tbody>
       </table>
    </div>

    <div class="ButtonsRightOfTable" align="right"> 
	    <button class="MyButton" onclick="return goToLink('new_project.html')">New project</button> <br>
	    <button class="MyButton" onclick="return goToLink('edit_project.html')">Edit Project</button> <br>
	    <button class="MyButton">Delete projects</button> <br/>
    </div>
    </body>

</asp:Content>