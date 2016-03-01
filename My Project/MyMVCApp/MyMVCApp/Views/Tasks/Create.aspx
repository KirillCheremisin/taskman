<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create task
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% using (Html.BeginForm()) {%>
    <div class="CardContainer"> 
        <table align="left">
            <tr>
                <td>Name</td>
                <td><input type="text" name="Name" /></td>
            </tr>
            <tr>
                <td>Project Name</td>
                <td><%: @Html.DropDownList("ProjectID", (IEnumerable<SelectListItem>)ViewData["proj"])%></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="Description" /></td>
            </tr>
            <tr>       
                <td>Assigned to</td>
                <td><%: Html.DropDownList("AssignedToID", (IEnumerable<SelectListItem>)ViewData["users"])%></td>
            </tr>
        </table>
    </div>

    <div class="ButtonsUnderCard" align="right"> 
        <input type="submit" value="Create" />
        <button class="MyButton" type="submit">Save Task</button> <br />
        <button class="MyButton">Delete task</button> <br />
    </div> 
<% } %>
<!---
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
    --->
</asp:Content>

