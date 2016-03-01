<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MyMVCApp.Models.LoginPageView>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Login
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
    <div class="Auth">
	    <h2>Sign in</h2>
	    <p>Login</p>
	    <!--<input type="text" size="40" placeholder="Type your login"></input>-->
        <%: Html.TextBoxFor(m => m.Login, new { placeholder ="Enter you login..." })%>
        <%: Html.ValidationMessageFor(m => m.Login) %>
	    <p>Password</p>
	    <!--<input type="password" size="40" placeholder="Type your password"></input>-->
        <%: Html.TextBoxFor(m => m.Password, new { type="password", placeholder = "Enter you password..." })%>
        <%: Html.ValidationMessageFor(m => m.Password) %>
    </div>
    <div class="ButtonsUnderCard">
	    <input class="MyButton" type="submit" value="Login" />
    </div>
	

	<%} %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
