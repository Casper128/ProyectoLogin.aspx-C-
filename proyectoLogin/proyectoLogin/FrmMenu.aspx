<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMenu.aspx.cs" Inherits="proyectoLogin.FrmMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
    <!-- Navegador de paginas superior -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="/Css/Login.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="FrmMenu.aspx">Logo</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="collapsibleNavbar">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="FrmEvidencia.aspx">Evidencias</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="FrmAutor.aspx">Autores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="FrmRol.aspx">Usuarios y Roles</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div>
                    <asp:Button ID="Button1" runat="server" Text="Cerrar Sesion" class="btn btn-dark" OnClick="CerrarSesion" />
                </div>
            </nav>
            <div class="container-fluid mt-12">
                <h3>Navbar With Dropdown</h3>
                <p>This example adds a dropdown menu in the navbar.</p>
            </div>
        </div>
    </form>
</body>
</html>
