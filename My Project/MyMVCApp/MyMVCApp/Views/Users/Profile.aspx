<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Employee>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Profile
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Profile</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">UserID</div>
        <div class="display-field"><%: Model.EmployeeID%></div>
        
        <div class="display-label">UserName</div>
        <div class="display-field"><%: Model.EmployeeName%></div>
        
        <div class="display-label">UserSurname</div>
        <div class="display-field"><%: Model.EmployeeSurname%></div>
        
        <div class="display-label">UserRoleID</div>
        <div class="display-field"><%: Model.EmployeeRoleID%></div>
        
        <div class="display-label">Password</div>
        <div class="display-field"><%: Model.Password %></div>
        
        <div class="display-label">Login</div>
        <div class="display-field"><%: Model.Login %></div>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

