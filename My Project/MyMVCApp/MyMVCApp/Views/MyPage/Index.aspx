<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MyMVCApp.Models.Project>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	My page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div class="TableContainer"> 
    <button onclick="return hideTable('.hovertable');">My tasks</button>
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
                <td> <%: Html.ActionLink(item.User.UserName + " " + item.User.UserSurname, "Profile", new {controller = "Users", id = item.User.UserID})%> </td>
                <td> <%: String.Format("{0:g}", item.CrateDate) %> </td>
            </tr>
        <%} %>
        </tbody>
       </table>
    </div>

    <div class="TableContainer SecondTable">
	    <button onclick="return hideTable('.tasks');">My projects</button>
        <table width="100%" class="tasks">
            <tr>
			    <th class="condition"></th>
			    <th class="name">Name</th>
                <th>Project name</th>
                <th>Status</th>
                <th>Assigned to</th>
			    <th>Create date</th>
                <th>Finish date</th>
			    <th class="name">Author</th>
            </tr>

            <% foreach (var item in Model) { %>
                <% foreach (var item2 in item.Task) { %>
                <tr>
                    <td><input type="checkbox"/></</td>
                    <td><%: Html.ActionLink(item2.Name, "Details", new { id = item2.TaskID})%></td>
                    <td><%: item2.Project.Name %></td>
                    <td><%: item2.Status.StatusName %></td>
                    <td><%: Html.ActionLink(item2.AssignedTo.UserName + " " + item2.AssignedTo.UserSurname, "Profile", new { controller = "Users", id = item2.AssignedToID })%></td>
                    <td><%: String.Format("{0:g}", item2.CreateDate)%></td>
                    <td><%: String.Format("{0:g}", item2.FinishDate)%></td>
                    <td><%:Html.ActionLink(item2.Author.UserName + " " + item2.Author.UserSurname, "Profile", new { controller = "Users", id = item2.AuthorID })%></td>
                </tr>
                <%} %>
            <% } %>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

