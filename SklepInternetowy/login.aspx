<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SklepInternetowy.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css?family=Lora|PT+Sans&display=swap" rel="stylesheet"/>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="popper/popper.min.js"></script>  
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    <style>
        #lValid{
            height:21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header runat="server">
            <div id="name"><a href="/index.aspx">E-Bazarek</a></div>
            <div id="search"><asp:ImageButton ID="btnSearch" runat="server" Height="30" Width="30" ImageUrl="~/Assets/Images/search_white.png" OnClick="btnSearch_Click" /><asp:TextBox ID="tbSearch" runat="server" placeholder="Wyszukaj"></asp:TextBox></div><div id="login"><asp:LinkButton ID="lbtnLogin" runat="server" href="/login.aspx">Zaloguj</asp:LinkButton> / <asp:LinkButton runat="server" ID="lbtnRegister" href="/register.aspx">Zarejestruj się</asp:LinkButton></div><div id="cart"><asp:ImageButton runat="server" ID="btnCart" ImageUrl="~/Assets/Images/shoping.png" Height="40" Width="40" OnClick="btnCart_Click"/></div><div id="language"><asp:ImageButton runat="server" ID="btnLanguage" ImageUrl="~/Assets/Images/uk.png" Height="40" Width="40" OnClick="btnLanguage_Click"/></div>
        </header>

        <div id="main">
            <div class="container">
                Login: <asp:TextBox runat="server" ID="tbLogin"></asp:TextBox>
                Hasło: <asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox>
                <asp:Button runat="server" ID="btnLogin" Text="Zaloguj" OnClick="btnLogin_Click"/>
                <asp:Label runat="server" ID="lValid"></asp:Label>
                <a href="index.aspx"  id="linkLogin" runat="server">Powrót do strony głównej</a>
                <a href="register.aspx"  id="linkReturn" runat="server">Nie masz konta? Zarejestruj się</a>
            </div>
        </div>
        <!--#include virtual="/PageComponents/Footer.aspx"-->
    </form>
</body>
</html>
