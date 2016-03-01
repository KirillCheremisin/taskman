<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MyMVCApp.Models.Task>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tasklist
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="TableContainerWithScroll">
<table border="1" width="100%" class="tasks">
    <tr>
		<th width="30px"></th>
		<th>Name</th>
		<th>Project Name</th>
		<th>Status</th>
        <th width="60px">Condition</th>
		<th>Assigned to</th>
		<th>Create date</th>
		<th>Finish date</th>
		<th>Author</th>
    </tr>
    <%foreach (var item in Model) { %>
    <tr>
        <td><input type="checkbox"/></</td>
        <td><%: Html.ActionLink(item.Name, "Edit", new { id = item.TaskID})%></td>
        <td><%: item.Project.Name %></td>
        <td><%: item.Status.StatusName %></td>
        <td><%: item.Condition.ConditionName %></td>
        <td><%: Html.ActionLink(item.AssignedTo.UserName + " " + item.AssignedTo.UserSurname, "Profile", new { controller = "Users", id = item.AssignedToID })%></td>
        <td><%: String.Format("{0:dd MMM yyyy}", item.CreateDate)%></td>
        <td><%: String.Format("{0:dd MMM yyyy}", item.FinishDate)%></td>
        <td><%:Html.ActionLink(item.Author.UserName + " " + item.Author.UserSurname, "Profile", new { controller = "Users", id = item.AuthorID })%></td>
    </tr>
    <%} %>

</table>
</div>
<div class="ButtonsRightOfTable">
	<%: Html.ActionLink("New task", "Create") %> <br />
	<button class="MyButton" onclick="return deleteCheckedItems('Tasks');">Delete tasks</button> <br />   
</div> 

<!--
<p>
    <%: Html.ActionLink("Create New", "Create") %>
</p>
-->
</asp:Content>

