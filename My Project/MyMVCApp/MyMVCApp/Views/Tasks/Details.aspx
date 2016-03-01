<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.Task>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Task details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="CardContainer"> 
       <table align="left">
            <tr>
                <td>Name</td>
                <td><%: Model.Name %></td>
            </tr>
            <tr>
                <td>Project Name</td>
                <td><%: Model.Project.Name %></td>
            </tr>
            <tr>                                                            
                <td>Description</td>
                <td><textarea disabled="disabled" rows="3" cols="17" style="resize: none;"><%: Model.Description %></textarea></td>
            </tr>
            <tr>
                <td>Status</td>
                <td><%: Model.Status.StatusName %></td>
            </tr>
            <tr>
                <td>Assigned to</td>
                <td><%: Model.User.UserName + ' '+ Model.User.UserSurname %></td>
            </tr>
            <tr>
                <td>Date of creation</td>
                <td><%: String.Format("{0:dd MMM yyyy}", Model.CreateDate)%></td>
            </tr>
            <tr>
                <td>Finish date</td>
                <td><%: String.Format("{0:dd MMM yyyy}", Model.FinishDate)%></td>
            </tr>
            <tr>
                <td>Author</td>
                <td><%: Model.User1.UserName + " " + Model.User1.UserSurname%></td>
            </tr>
        </table>
    </div>
        
    <div class="ButtonsUnderCard" align="right"> 
        <button class="MyButton"><%: Html.ActionLink("New Task", "Create")%></button> <br />
        <button class="MyButton"><%: Html.ActionLink("Edit Task", "Edit", new { id = Model.TaskID })%></button> <br />
        <button class="MyButton"><%: Html.ActionLink("Delete Task", "Delete", new { id=Model.TaskID })%></button> <br />
    </div> 

<!---
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
    --->

</asp:Content>

