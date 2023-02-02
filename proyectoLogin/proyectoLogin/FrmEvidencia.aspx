<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmEvidencia.aspx.cs" Inherits="proyectoLogin.FrmEvidencia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- Navegador de paginas superior -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/Css/Main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="FrmMenu.aspx">Logo</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#collapsibleNavbar">
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
                    <asp:Button ID="Button6" runat="server" Text="Cerrar Sesion" class="btn btn-dark"
                        OnClick="CerrarSesion" />
                </div>
            </nav>
            <div class="container-fluid mt-12">
                <div>
                    <div class="">
                        <div class="table-responsive">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h2><b>Evidencias</b></h2>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                                <i class="material-icons">&#xE147;</i>
                                                <span>CRUD</span></a>
                                        </div>
                                        <div class="col-sm-3">
                                            <a href="#editEmployeeModal" class="btn btn-success" data-toggle="modal">
                                                <span>Cambiar Estado</span></a>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="selectAll" />
                                                    <label for="selectAll"></label>
                                                </span>
                                            </th>
                                            <th>Código</th>
                                            <th>Titulo</th>
                                            <th>Descripción</th>
                                            <th>Tipo</th>
                                            <th>Fecha de Creación</th>
                                            <th>Fecha de Registro</th>
                                            <th>Latitud</th>
                                            <th>Longitud</th>
                                            <th>Id Estado</th>
                                            <th>Nombre Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% 
                                            string msg = "ok";
                                            try
                                            {
                                                for (int i = 0; i < objDataSet.Tables[0].Rows.Count; i++)
                                                { %>
                                        <tr>
                                            <td>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox1" name="options" value="1" />
                                                    <label for="checkbox1"></label>
                                                </span>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][0].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][1].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][2].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][3].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][4].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][5].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][6].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][7].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][8].ToString()); %>
                                            </td>
                                            <td>
                                                <%Response.Write(objDataSet.Tables[0].Rows[i][9].ToString()); %>
                                            </td>
                                            <td>
                                                <a href="#addEmployeeModal" class="edit" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                                </a>
                                                <a href="#addEmployeeModal" class="delete" data-toggle="modal">
                                                    <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                                </a>
                                            </td>
                                        </tr>

                                        <%}
                                            }
                                            catch (Exception objException)
                                            {
                                                msg = objException.Message;
                                                //lblMensaje.Text = msg;
                                            }%>
                                    </tbody>
                                </table>
                                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- CRUD Modal HTML -->
                    <div id="addEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Guardar</h4>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">
                                        &times;</button>
                                </div>
                                <!-- Nav tabs -->
                                <div class="form-group">
                                    <nav>
                                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                            <button class="nav-link active desactiveOff" id="nav-home-tab" data-toggle="tab" data-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Evidencia</button>
                                            <button class="nav-link desactiveOff" id="nav-profile-tab" data-toggle="tab" data-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Capitulo</button>
                                            <button class="nav-link" id="nav-profile-tab-2" data-toggle="tab" data-target="#nav-profile-2" type="button" role="tab" aria-controls="nav-profile-2" aria-selected="false">literal</button>
                                        </div>
                                    </nav>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                            <!--Final Nav tabs -->
                                            <div class="modal-body">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="id: " />
                                                        <asp:TextBox runat="server" ID="txtIdModDel" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="Titulo: " />
                                                        <asp:TextBox runat="server" ID="txtTitulo" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="Descripcion: " />
                                                        <asp:TextBox runat="server" ID="txtDescrip" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="Tipo: " />
                                                        <asp:TextBox runat="server" ID="txtTipo" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="FechaCreacion: " />
                                                        <asp:TextBox runat="server" ID="txtFcreacion" type="Date" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="FechaRegistro: " />
                                                        <asp:TextBox runat="server" ID="txtFregistro" type="Date" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="Latitud: " />
                                                        <asp:TextBox runat="server" ID="txtLatitud" class="form-control" autocomplete="off" />
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label runat="server" Text="Longitud: " />
                                                        <asp:TextBox runat="server" ID="txtLongitud" class="form-control" autocomplete="off" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- inicio de segunda pesta;a -->
                                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                            <div class="modal-body">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>Id y Articulo</label>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Id y Capitulo</label>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Id y Seccion</label>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="DropDownList3" runat="server" class="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Id y Titulo</label>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="DropDownList4" runat="server" class="form-control"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- fin de segunda pesta;a -->
                                        <!-- inicio de tercera pesta;a -->
                                        <div class="tab-pane fade" id="nav-profile-2" role="tabpanel" aria-labelledby="nav-profile-tab">
                                            <div class="modal-body">
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label>Id y Estado</label>
                                                        <asp:DropDownList ID="DropDownList6" runat="server" class="form-control"></asp:DropDownList>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Autores pertenecientes a la evidencia:</label>
                                                        <asp:ListBox ID="ListBox1" runat="server" class="form-control" multiple=""></asp:ListBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Button ID="AgregarAutor" runat="server" OnClick="BtnAgregarAutor" Text="Guardar en la Lista" class="btn btn-success" />
                                                        <asp:Button ID="Button5" runat="server" OnClick="BtnBorrarAutor" Text="Borrar de Lista" class="btn btn-danger" />
                                                    </div>
                                                </div>

                                                <div class="modal-footer">                                                    
                                                    <asp:Button ID="guardarAutor" runat="server" OnClick="BtnAutorGuardar" Text="Guardar" class="btn btn-success" />
                                                    <asp:Button ID="Button8" runat="server" onClick="BtnAutorModificar" Text="Modificar" class="btn btn-success" type="button" />         
                                                    <asp:Button ID="Button9" runat="server" onClick="BtnAutorBorrar" Text="Borrar" class="btn btn-danger" />
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- fin de tercer pesta;a -->
                                <div class="modal-footer footer-2">
                                    <asp:Button ID="Button1" runat="server" OnClick="Guardar" Text="Guardar" class="btn btn-success" />
                                    <asp:Button ID="Button4" runat="server" OnClick="Consultar" Text="Consultar" class="btn btn-success" type="button" />
                                    <asp:Button ID="Button2" runat="server" OnClick="Modificar" Text="Modificar" class="btn btn-success" type="button" />
                                    <asp:Button ID="Button3" runat="server" OnClick="Borrar" Text="Borrar" class="btn btn-danger" />
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Modal Estados HTML -->
                    <div id="editEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Guardar</h4>
                                    <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">
                                        &times;</button>
                                </div>
                                <div class="modal-body">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Id Evidencia</label>
                                            <asp:TextBox runat="server" ID="IdEviEst" class="form-control" autocomplete="off" />
                                        </div>
                                        <div class="form-group">
                                            <label>Id y Estado</label>
                                            <asp:DropDownList ID="DropDownList5" runat="server" class="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="btn_AgregarEstado" OnClick="AgregarNuevoEstado" runat="server" Text="Guardar" class="btn btn-success" />
                                        <asp:Button ID="btn_Consultar23" runat="server" Text="Consultar" class="btn btn-success" />
                                        <asp:Button ID="btn_Borrar23" runat="server" Text="Borrar" class="btn btn-danger" />
                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fin Modal Estados HTML -->
                </div>
            </div>
        </div>
    </form>
</body>
    <script src="/js/JsModal.js"></script>
</html>
