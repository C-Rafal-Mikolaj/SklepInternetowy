<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SklepInternetowy.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Admin <% Response.Write(((SklepInternetowy.User)Session["user"]).username); %></title>
    <link href="https://fonts.googleapis.com/css?family=Lora|PT+Sans&display=swap" rel="stylesheet"/>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="popper/popper.min.js"></script>  
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    <style>
        .opt {
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

         #optLO::after, .opt::after {
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
            text-align:left;
            font-size:1.7em;
         }

         .title2{
            font-size:1.7em;
            position:absolute;
            top:0;
            width:300px;
            left:calc(50% - 150px);
         }

         #menu a{
             text-decoration:none;
             color: #deb900;
         }
         #addItem{
             display: flex;
             flex-direction: column;
         }
        input[type="submit"] {
            background-color: #deb900;
            border: none;
            padding: 5px;
            border-radius: 3px;
            margin: 6px 2px 6px 2px;
        }
         #mngUsers, #mngOrders{
              display: flex;
              flex-flow: row wrap;
             padding-top: 6%;
             position:relative;
             text-align:center;
         }
         .userItem, .orderItem{
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
                        <div id="optLO"><asp:LinkButton runat="server" ID="lbtnLogout" OnClick="lbtnLogout_Click">Wyloguj</asp:LinkButton></div>
                        <div class="opt"><asp:LinkButton runat="server" ID="lbtnMngUsers" OnClick="lbtnMngUsers_Click">Zarządzaj użytkownikami</asp:LinkButton></div>
                        <div class="opt"><asp:LinkButton runat="server" ID="lbtnMngOrders" OnClick="lbtnMngOrders_Click">Zarządzaj zamówieniami</asp:LinkButton></div>
                        <div class="opt"><asp:LinkButton runat="server" ID="lbtnAddItem" OnClick="lbtnAddItem_Click">Dodaj produkt</asp:LinkButton></div>
                        
                    </div>
                </div>
                <div id="content" runat="server">
                    <div id="mngUsers" runat="server">
                        <div class="title2" id="usersTitle" runat="server">Użytkownicy</div>
                    </div>
                    <div id="mngOrders" runat="server">
                        <div class="title2" id="ordersTitle" runat="server">Zamówienia</div>
                    </div>
                    <div id="addItem" runat="server">
                        <div class="title" id="itemsTitle" runat="server">Dodaj przedmiot</div>
                        <span id="divName" runat="server">Nazwa:</span> <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
                            <span id="divDesc" runat="server">Opis:</span> <asp:TextBox runat="server" ID="tbDesc"></asp:TextBox>
                            <span id="divPrice" runat="server">Cena: </span><asp:TextBox runat="server" ID="tbPrice" TextMode="Number" step="any"></asp:TextBox>
                            <span id="divColor" runat="server">Kolor: </span><asp:TextBox runat="server" ID="tbColor"></asp:TextBox>
                            <span id="divPicture" runat="server">Obrazek: </span><asp:FileUpload runat="server" ID="fuPicture" />
                            <span id="divCategory" runat="server">Kategoria:</span> <asp:TextBox runat="server" ID="tbCategory"></asp:TextBox>
                        <asp:Button runat="server" ID="btnAdd" Text="Dodaj" OnClick="btnAdd_Click" />
                        <asp:Label runat="server" ID="lStatus"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <!--#include virtual="/PageComponents/Footer.aspx"-->
    </form>
</body>
</html>
