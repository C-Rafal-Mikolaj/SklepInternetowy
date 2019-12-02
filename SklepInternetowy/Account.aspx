<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="SklepInternetowy.Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><% Response.Write(((SklepInternetowy.User)Session["user"]).username); %></title>
    <link href="https://fonts.googleapis.com/css?family=Lora|PT+Sans&display=swap" rel="stylesheet"/>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="popper/popper.min.js"></script>  
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    <style>
        #opt {
            display: flex;
            position: relative;
            align-items: center;
            padding: 5px 10px;
            background: #1d1d1d;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            margin:10px;
            color: #fff;
        }
        #optLO{
            display: flex;
            position: relative;
            align-items: center;
            padding: 5px 10px;
            background: #1d1d1d;
            border-top-left-radius: 2px;
            border-top-right-radius: 2px;
            margin:10px;
            color: red;
        }
        #container{
            margin: 20px auto;
            display:inline-block;
            text-align:center;
        }

         #optLO::after, #opt::after {
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
         #menu{
             display: flex;
             flex-direction: row;
         }
         #content{
             padding: 10px;
         }
         .title{
             text-align:center;
            font-size:1.7em;
         }
         #menu a{
             text-decoration:none;
             color: #deb900;
         }
         #Orders{
              display: flex;
               flex-flow: row nowrap;
               text-align:center;
         }
         .orderItem{
             width: 33.3%;
            height: 33.3%;
         }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header runat="server">
            <div id="name"><a href="/index.aspx">E-Bazarek</a></div>
            <div id="search"><asp:ImageButton ID="btnSearch" runat="server" Height="30" Width="30" ImageUrl="~/Assets/Images/search_white.png" OnClick="btnSearch_Click" /><asp:TextBox ID="tbSearch" runat="server" placeholder="Wyszukaj"></asp:TextBox></div><div id="login" runat="server"><asp:LinkButton ID="lbtnLogin" runat="server" href="/login.aspx">Zaloguj</asp:LinkButton> / <asp:LinkButton runat="server" ID="lbtnRegister" href="/register.aspx">Zarejestruj się</asp:LinkButton></div><div id="cart"><asp:ImageButton runat="server" ID="btnCart" ImageUrl="~/Assets/Images/shoping.png" Height="40" Width="40" OnClick="btnCart_Click"/></div><div id="language"><asp:ImageButton runat="server" ID="btnLanguage" ImageUrl="~/Assets/Images/uk.png" Height="40" Width="40" OnClick="btnLanguage_Click"/></div>
        </header>

        <div id="main">
            <div class="container">
                <div class="row justify-content-center">
                    <div id="menu">
                        <div id="opt"> <asp:LinkButton runat="server" ID="lbtnLogout" OnClick="lbtnLogout_Click">Wyloguj</asp:LinkButton></div>
                        <div id="optLO"> <asp:LinkButton runat="server" ID="lbtnOrders">Twoje zamówienia</asp:LinkButton></div>
                    </div>
                </div>
                <div id="content" runat="server">
                    <div class="title" id="yourOrders" runat="server">Twoje zamówienia</div>
                    <div id="Orders" runat="server">
                        
                    </div>
                </div>
            </div>
        </div>
        <!--#include virtual="/PageComponents/Footer.aspx"-->
    </form>
</body>
</html>
