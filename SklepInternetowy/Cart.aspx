<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SklepInternetowy.Cart" %>

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
        #main{
            padding: 30px 0;
            text-align:center;
        }
        table{
            border:1px solid #deb900;
        }
        td{
            margin-bottom: 5px;
            background-color: #282828;
        }
        .t{
            font-weight: bold;
            margin-bottom: 15px;
            border-bottom:1px solid #deb900;
            background-color:#1d1d1d;
        }
        #buttons{
            margin-top: 20px;
            display:flex;
            justify-content:space-around;
            align-content:center;
        }
        #clr, #sv{
            background-color: #deb900;
            border: none;
            padding: 5px;
            border-radius: 3px;
            color:#000;
            text-decoration:none;
        }
        .sumTotal{
            margin-left:auto;
            padding:5px;
            font-weight: bold;
            border-bottom:1px solid #deb900;
            border-left:1px solid #deb900;
            border-right:1px solid #deb900;
            background-color:#1d1d1d;
            width:237px;
        }
        @media (max-width: 1199.98px) { 
            .sumTotal{
                width:100%;
            }
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
                <div class="row justify-content-center" id="tableContainer" runat="server">
                    <asp:Table ID="myTable" runat="server" Width="100%"> 
                        <asp:TableRow>
                            <asp:TableCell CssClass="t">ID</asp:TableCell>
                            <asp:TableCell CssClass="t" ID="TRname">Nazwa</asp:TableCell>
                            <asp:TableCell CssClass="t" ID="TRprice">Cena</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
                <div id="buttons">
                    <asp:LinkButton ID="clr" runat="server" onClick="clr_Click">Wyczyść koszyk</asp:LinkButton>
                    <br />
                    <asp:LinkButton ID="sv" runat="server" onClick="sv_Click">Zatwierdż</asp:LinkButton>
                </div>
            </div>
        </div>
        <!--#include virtual="/PageComponents/Footer.aspx"-->
    </form>
</body>
</html>
