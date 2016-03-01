<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Project>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create project
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <head>
        <title>My Projects</title>

        <link rel="stylesheet" type="text/css" href="../../Content/HEADER.css"/>
        <link rel="stylesheet" type="text/css" href="../../Content/TABLES.css"/>
        <link rel="stylesheet" type="text/css" href="../../Content/BUTTONS.css"/>
        <link rel="stylesheet" type="text/css" href="../../Content/CardNewEditPages.css"/>
    </head>
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <div class="CardContainer"> 
            <table width= align="left">
                <tr>
                    <td>Name</td>
                    <td><input type="text" /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" /></td>
                </tr>
                <tr>
                    <td>Date of creation</td>
                    <td><input type="date" /></td>
                </tr>
            </table>
        </div>

        <div class="ButtonsUnderCard" align="right"> 
            <button  class="MyButton"  >Save Project</button> <br>
            <button class="MyButton" > Back</button> <br>
        </div> 
<!--            
            <p>
                <input type="submit" value="Create" />
            </p>
-->

    <% } %>
<!---
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
-->

</asp:Content>

