<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SklepInternetowy.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>E-Bazarek</title>
    <link href="https://fonts.googleapis.com/css?family=Lora|PT+Sans&display=swap" rel="stylesheet"/>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="popper/popper.min.js"></script>  
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Styles/main.css" rel="stylesheet" />
    <link href="Styles/product.css" rel="stylesheet" />
    <style>

        #imgSlider{
            margin:50px 0;
            width:100%;
        }

        #filters{
            width:100%;
            background-color:#212121;
            display:flex;
            align-items:center;
            justify-content:space-around;
            padding:10px;
        }
        #filters a,#filters .dropdown-menu{
            color:#ffeb4c;
            background-color:#212121;
        }

        #pItems{
            padding:20px 0;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="name">E-Bazarek</div>
            <div id="search"><asp:ImageButton ID="btnSearch" runat="server" Height="30" Width="30" ImageUrl="~/Assets/Images/search_white.png" /><asp:TextBox ID="tbSearch" runat="server" placeholder="Wyszukaj"></asp:TextBox></div><div id="login" runat="server"><asp:LinkButton ID="lbtnLogin" runat="server" href="/login.aspx">Zaloguj</asp:LinkButton> / <asp:LinkButton runat="server" ID="lbtnRegister" href="/register.aspx">Zarejestruj się</asp:LinkButton></div><div id="cart"><asp:ImageButton runat="server" ID="btnCart" ImageUrl="~/Assets/Images/shoping.png" Height="40" Width="40" OnClick="btnCart_Click"/></div><div id="language"><asp:ImageButton runat="server" ID="btnLanguage" ImageUrl="~/Assets/Images/uk.png" Height="40" Width="40" OnClick="btnLanguage_Click"/></div>
        </header>
        
        <div id="main">
            <div class="container">
                <asp:Image runat="server" ImageUrl="~/Assets/Images/Black-Friday-Banner.jpg" ID="imgSlider"/>
            </div>
            <div id="filters">
                <div class="dropdown">
                    <asp:LinkButton runat="server" ID="btnSort" CssClass="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sortuj wg.</asp:LinkButton>
                    <div class="dropdown-menu" aria-labelledby="btnSort">
                        <asp:LinkButton runat="server" class="dropdown-item" ID="btnAscending">Cena rosnąco</asp:LinkButton>
                        <asp:LinkButton runat="server" class="dropdown-item" ID="btnDescending">Cena malejąco</asp:LinkButton>
                        <asp:LinkButton runat="server" class="dropdown-item" ID="btnNewest">Najnowsze</asp:LinkButton>
                    </div>
                </div>
                <div class="dropdown">
                    <asp:LinkButton runat="server" ID="btnCategory" CssClass="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Kategoria</asp:LinkButton>
                    <div class="dropdown-menu" aria-labelledby="btnCategory">
                        <asp:Panel runat="server" ID="pCategory">

                        </asp:Panel>
                    </div>
                </div>
                <div class="dropdown">
                    <asp:LinkButton runat="server" ID="btnColor" CssClass="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Kolor</asp:LinkButton>
                    <div class="dropdown-menu" aria-labelledby="btnColor">
                        <asp:Panel runat="server" ID="pColor">

                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div class="container">
                <asp:Panel runat="server" ID="pItems">
                    
                </asp:Panel>
            </div>
        </div>

        <footer>
            <div id="copyright">
                © 2019 Copyright: Fatuła & Stryczek & Pająk Corp.
            </div>
        </footer>
    </form>
</body>
</html>
