<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">TaskID</div>
        <div class="display-field"><%: Model.TaskID %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%: Model.Name %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%: Model.Description %></div>
        
        <div class="display-label">CreateDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.CreateDate) %></div>
        
        <div class="display-label">FinishDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FinishDate) %></div>
        
        <div class="display-label">ConditionID</div>
        <div class="display-field"><%: Model.ConditionID %></div>
        
        <div class="display-label">StatusID</div>
        <div class="display-field"><%: Model.StatusID %></div>
        
        <div class="display-label">AuthorID</div>
        <div class="display-field"><%: Model.AuthorID %></div>
        
        <div class="display-label">AssignedToID</div>
        <div class="display-field"><%: Model.AssignedToID %></div>
        
        <div class="display-label">ProjectID</div>
        <div class="display-field"><%: Model.ProjectID %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

