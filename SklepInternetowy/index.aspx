<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SklepInternetowy.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>E-Bazarek</title>
    <link href="https://fonts.googleapis.com/css?family=Lora|PT+Sans&display=swap" rel="stylesheet"/>
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
        }
        #name{
            color: #deb900;
            font-size:38px;
            font-weight:600;
            font-family: 'PT Sans', sans-serif;
        }

        .main{
            height:100%;
            color:white;
            margin-top:77px;
        }

        footer{
            background-color: #121212;
            color: #ffffff;
            padding:10px 20px;
            width:100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="name">E-Bazarek</div><div id="search"></div><div id="login"></div><div id="cart"></div><div id="language"></div>
        </header>
        
        <div id="container" class="main">
            <div class="row">
                <div class="col">
                  1 of 2
                </div>
                <div class="col">
                  2 of 2
                </div>
            </div>
        </div>

        <footer>

        </footer>
    </form>
</body>
</html>
