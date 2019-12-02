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
            display:block;
            margin:5px;
            padding:2px;
        }
        #formcontainer{
            margin: 20px auto;
            display:inline-block;
            text-align:center;
        }

        #log, #password {
            display: flex;
            position: relative;
            align-items: center;
            padding: 5px 10px;
            background: #1d1d1d;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            margin:10px;
        }

        #log::after, #password::after {
            content: "";
            position: absolute;
            left: 0px;
            right: 0px;
            bottom: 0px;
            height: 1px;
            background-color: #deb900;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
        }
        #tbLogin, #tbPassword{
            background: transparent;
            color: #fff;
            border: none;
            margin-left: 15px;
            flex:1;
        }
        #text{
            text-align:center;
            font-size:2em;
        }
        #btnLogin{
            background-color: #deb900;
            border:none;
            padding:5px;
            border-radius:3px;
            margin:10px;
            padding:5px 10px;
        }
        #formcontainer a{
            color: #fff;
            display:block;
            margin:5px;
            padding:2px;
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
                <div class="row justify-content-center">
                    <div id="formcontainer">
                        <div id="text">Zaloguj się do E-Bazarku!</div>
                        <div id="log"> <asp:Image runat="server" ImageUrl="~/Assets/Images/login.png" Width="30" Height="30" /> <asp:TextBox runat="server" ID="tbLogin" placeholder="Login"></asp:TextBox></div>
                        <div id="password"><asp:Image runat="server" ImageUrl="~/Assets/Images/password.png" Width="30" Height="30"/> <asp:TextBox runat="server" ID="tbPassword" TextMode="Password" placeholder="Hasło"></asp:TextBox></div>
                        <asp:Button runat="server" ID="btnLogin" Text="Zaloguj" OnClick="btnLogin_Click"/>
                        <asp:Label runat="server" ID="lValid"></asp:Label>
                        <a href="register.aspx"  id="linkLogin" runat="server">Nie masz konta? Zarejestruj się</a>
                        <a href="index.aspx"  id="linkReturn" runat="server">Powrót do strony głównej</a>
                    </div>
                </div>
            </div>
        </div>
        <!--#include virtual="/PageComponents/Footer.aspx"-->
    </form>
</body>
</html>
