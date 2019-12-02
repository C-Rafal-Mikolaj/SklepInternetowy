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
                <div id="menu">
                    <asp:LinkButton runat="server" ID="lbtnLogout" OnClick="lbtnLogout_Click">Wyloguj</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnMngUsers" OnClick="lbtnMngUsers_Click">Zarządzaj użytkownikami</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnMngOrders" OnClick="lbtnMngOrders_Click">Zarządzaj zamówieniami</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnAddItem" OnClick="lbtnAddItem_Click">Dodaj produkt</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnMng2">JD</asp:LinkButton>
                </div>
                <div id="content" runat="server">
                    <div id="mngUsers" runat="server">
                        <div class="title">Użytkownicy</div>
                    </div>
                    <div id="mngOrders" runat="server">
                        <div class="title">Zamówienia</div>
                    </div>
                    <div id="addItem" runat="server">
                        <div class="title">Dodaj przedmiot</div>
                        Nazwa: <asp:TextBox runat="server" ID="tbName"></asp:TextBox>
                        Opis: <asp:TextBox runat="server" ID="tbDesc"></asp:TextBox>
                        Cena: <asp:TextBox runat="server" ID="tbPrice" TextMode="Number" step="any"></asp:TextBox>
                        Kolor: <asp:TextBox runat="server" ID="tbColor"></asp:TextBox>
                        Obrazek: <asp:FileUpload runat="server" ID="fuPicture" />
                        Kategoria: <asp:TextBox runat="server" ID="tbCategory"></asp:TextBox>
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
