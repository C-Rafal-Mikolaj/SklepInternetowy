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
        <!--#include virtual="/PageComponents/Header.aspx"-->

        <div id="main">
            <div class="container">
                Login: <asp:TextBox runat="server" ID="tbLogin"></asp:TextBox>
                Hasło: <asp:TextBox runat="server" ID="tbPassword" TextMode="Password"></asp:TextBox>
                <asp:Button runat="server" ID="btnLogin" Text="Zaloguj" OnClick="btnLogin_Click"/>
                <asp:Label runat="server" ID="lValid"></asp:Label>
                <a href="index.aspx">Powrót do strony głównej</a>
                <a href="register.aspx">Nie masz konta? Zarejestruj się</a>
            </div>
        </div>
        <!--#include virtual="/PageComponents/Footer.aspx"-->
    </form>
</body>
</html>
