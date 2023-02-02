<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="proyectoLogin.WebForm1" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="/Css/Login.css"/>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script lang="javaScript">
            function validarUsuario() {

                addEventListener
                if (document.getElementById("btnLogin").onclick == false) {
                    alert("Ingrese un usuario o contraseña correcta");
                }
            }
        </script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <div class="sidenav">
                    <div class="login-main-text">
                        <h2>Proyecto Evidencias<br/> Pagina Acceso</h2>
                        <p>Acceso o registro para acceder aqui.</p>
                    </div>
                </div>
                <div class="main">
                    <div class="col-md-4 col-sm-12">
                        <div class="login-form">

                            <div class="form-group">
                                <label for="txtNomUsuario" class="form-label">Nombre Usuario</label>
                                <div class="input-group has-validation">
                                    <asp:TextBox ID="txtNomUsuario" runat="server" class="form-control form-control-lg"
                                        placeholder="Ingrese un usuario Válido" aria-describedby="txtNomUsuarioFeedback"
                                        required="">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtContrasena" class="form-label">Contraseña</label>
                                <div class="input-group has-validation">
                                    <asp:TextBox ID="txtContrasena" runat="server" type="password"
                                        class="form-control form-control-lg" placeholder="Ingrese la contraseña"
                                        aria-describedby="txtContrasenaFeedback" required="">
                                    </asp:TextBox>
                                </div>
                                <asp:Button ID="btnLogin" runat="server" Text="Acceso" class="btn btn-primary "
                                    style="padding-left: 2.5rem; padding-right: 2.5rem;"
                                    OnClick="btnLogin_Click1" /> 

                                <button class="btn btn-secondary" style="padding-left: 2.5rem; 
                                    padding-right: 2.5rem;">Registro</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
    </html>