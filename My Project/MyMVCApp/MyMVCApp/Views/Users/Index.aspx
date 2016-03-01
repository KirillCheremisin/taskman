<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<MyMVCApp.Models.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Userlist
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div class="TableContainer">
        <table border="1" width="100%" id="hovertableID">
	        <tr>
                <th width="30px"></th>
		        <th width="40px">No.</th>
		        <th>Name</th>
		        <th>Login</th>
                <th>Password</th>
		        <th width="60px">Access level</th>
	        </tr>
            <%foreach (var item in Model) {%>
                <tr>
                    <td><input id="<%: item.UserID %>" type="checkbox"/></td>
                    <td><%: item.UserID %></td>
                    <td><%: item.UserName + " " + item.UserSurname%></td>
                    <td><%:  item.Login%></td>
                    <td><%: item.Password %></td>
                    <td><%: item.UserRole.RoleName %></td>
                </tr>
            <%} %>
        </table>
    </div>

    <div class="ButtonsRightOfTable">
        <%: Html.ActionLink("New user", "Create") %><br />
	    <!--<button class="MyButton" onclick="return goToLink('new_user.html')">New user</button> <br/>-->
	    <button class="MyButton" onclick="return goToLink('edit_user.html')">Edit user</button> <br/>
	    <button class="MyButton" onclick="return deleteCheckedItems('Users');">Delete users</button> <br/>
    </div>  

    <!--
    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>
    -->

</asp:Content>

