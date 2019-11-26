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
    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }
        form{
            overflow:auto;
        }
        body{
            background: #353535;
        }
        header div{
            display:inline-block;
        }
        header{
            background-color: #121212;
            color: #ffffff;
            padding:10px 20px;
            position:fixed;
            width:100%;
            display:flex;
            align-items:center;
        }
        #name{
            color: #deb900;
            font-size:38px;
            font-weight:600;
            font-family: 'PT Sans', sans-serif;
            margin-right:50px;
        }
        #search{
            display:flex;
            position:relative;
            align-items:center;
            padding:5px 10px;
            background: #1d1d1d;
            border-top-left-radius:2px;
            border-top-right-radius:2px;
        }
        #search::after{
            content:"";
            position: absolute;
            left: 0px;
            right: 0px;
            bottom: 0px;
            height:1px;
            background-color:#deb900;
            border-bottom-left-radius: 2px;
            border-bottom-right-radius: 2px;
        }
        #tbSearch{
            background:transparent;
            color: #fff;
            border:none;
            margin-left:15px;
        }
        #login{
            margin-left:auto;
        }
        #lbtnLogin{
            color:#ffffff;
        }
        #cart, #language{
            margin-left:50px;
        }


        #main{
            height:100%;
            color:white;
            margin-top:77px;
        }

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

        footer{
            background-color: #121212;
            color: #ffffff;
            padding:10px 20px;
            width:100%;
        }
        #copyright{
            color:#666;
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="name">E-Bazarek</div>
            <div id="search"><asp:ImageButton ID="btnSearch" runat="server" Height="30" Width="30" ImageUrl="~/Assets/Images/search_white.png" /><asp:TextBox ID="tbSearch" runat="server"></asp:TextBox></div><div id="login"><asp:LinkButton ID="lbtnLogin" runat="server" OnClick="lbtnLogin_Click">Zaloguj/Zarejestruj się</asp:LinkButton></div><div id="cart"><asp:ImageButton runat="server" ID="btnCart" ImageUrl="~/Assets/Images/shoping.png" Height="40" Width="40"/></div><div id="language"><asp:ImageButton runat="server" ID="btnLanguage" ImageUrl="~/Assets/Images/uk.png" Height="40" Width="40"/></div>
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
                        <asp:LinkButton runat="server" class="dropdown-item" ID="LinkButton1">1</asp:LinkButton>
                        <asp:LinkButton runat="server" class="dropdown-item" ID="LinkButton2">2</asp:LinkButton>
                        <asp:LinkButton runat="server" class="dropdown-item" ID="LinkButton3">3</asp:LinkButton>
                    </div>
                </div>
                <div class="dropdown">
                    <asp:LinkButton runat="server" ID="btnColor" CssClass="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Kolor</asp:LinkButton>
                    <div class="dropdown-menu" aria-labelledby="btnColor">
                        <asp:LinkButton runat="server" class="dropdown-item" ID="LinkButton4">4</asp:LinkButton>
                        <asp:LinkButton runat="server" class="dropdown-item" ID="LinkButton5">5</asp:LinkButton>
                        <asp:LinkButton runat="server" class="dropdown-item" ID="LinkButton6">6</asp:LinkButton>
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
                © 2019 Copyright: Fatuła & Stryczek Corp.
            </div>
        </footer>
    </form>
</body>
</html>
