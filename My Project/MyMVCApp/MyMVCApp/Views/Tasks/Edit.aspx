<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        <div class="CardContainer"> 
        <table align="left">
                        
            <tr>
                <td><%: Html.LabelFor(model => model.Name) %></td>
            </tr>
            <tr>
                <td><%: Html.TextBoxFor(model => model.Name) %></td>
                <%: Html.ValidationMessageFor(model => model.Name) %>
            </tr>
            
            <tr>
                <td><%: Html.LabelFor(model => model.Description) %></td>
            </tr>
            <tr>
                <td><%: Html.TextBoxFor(model => model.Description) %></td>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </tr>
            
            <tr>
                <td><%: Html.LabelFor(model => model.Condition.ConditionName) %></td>
            </tr>
            <tr>
                <td><%: Html.TextBoxFor(model => model.ConditionID)%></td>
                <%: Html.ValidationMessageFor(model => model.ConditionID) %>
            </tr>

            <tr>
                <td>Assigned to</td>
            </tr>
            <tr>
                <td><%: Html.TextBoxFor(model => model.AssignedToID)%></td>
                <%: Html.ValidationMessageFor(model => model.AssignedToID) %>
            </tr>
            
            <tr>
                <td><%: Html.LabelFor(model => model.ProjectID) %></td>
            </tr>
            <tr>
                <!--<td><%: Html.DropDownList("AssignedToID", (IEnumerable<SelectListItem>)ViewData["proj"])%></td>-->
                <td><%: Html.TextBoxFor(model => model.ProjectID)%></td>
                <%: Html.ValidationMessageFor(model => model.ProjectID) %>
            </tr>
        </table>
        </div>
        <p>
                <button class="MyButton" type="submit" value="Save">Save</button>
        </p>
        <%: Html.HiddenFor(model => model.AuthorID) %>
        <%: Html.HiddenFor(model => model.TaskID) %>
        <%: Html.HiddenFor(model => model.StatusID) %>
        <%: Html.HiddenFor(model => model.CreateDate) %>
    <% } %>
    <br />
    <br />
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

