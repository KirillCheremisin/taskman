<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Employee>" %>

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
                <%: Html.LabelFor(model => model.EmployeeID)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.EmployeeID)%>
                <%: Html.ValidationMessageFor(model => model.EmployeeID)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EmployeeName)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.EmployeeName)%>
                <%: Html.ValidationMessageFor(model => model.EmployeeName)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EmployeeSurname)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.EmployeeSurname)%>
                <%: Html.ValidationMessageFor(model => model.EmployeeSurname)%>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EmployeeRoleID)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.EmployeeRoleID)%>
                <%: Html.ValidationMessageFor(model => model.EmployeeRoleID)%>
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

