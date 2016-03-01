<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create user
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UserID) %>
                <%: Html.ValidationMessageFor(model => model.UserID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserName) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UserName) %>
                <%: Html.ValidationMessageFor(model => model.UserName) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserSurname) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UserSurname) %>
                <%: Html.ValidationMessageFor(model => model.UserSurname) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.UserRoleID) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.UserRoleID) %>
                <%: Html.ValidationMessageFor(model => model.UserRoleID) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Password) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Password) %>
                <%: Html.ValidationMessageFor(model => model.Password) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Login) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Login) %>
                <%: Html.ValidationMessageFor(model => model.Login) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Email) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Email) %>
                <%: Html.ValidationMessageFor(model => model.Email) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

