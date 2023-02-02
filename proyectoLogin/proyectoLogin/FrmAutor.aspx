<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAutor.aspx.cs" Inherits="proyectoLogin.FrmAutor" %>

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
		<!-- <script src="/Js/JsModal.js"></script>-->
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
						<asp:Button ID="Button1" runat="server" Text="Cerrar Sesion" class="btn btn-dark"
							OnClick="CerrarSesion" />
					</div>
				</nav>
				<div class="container-fluid mt-12">
					<div>
						<div class="container-xl">
							<div class="table-responsive">
								<div class="table-wrapper">
									<div class="table-title">
										<div class="row">
											<div class="col-sm-6">
												<h2><b>Usuarios</b></h2>
											</div>
											<div class="col-sm-6">
												<a href="#addEmployeeModal" class="btn btn-success"
													data-toggle="modal"><i class="material-icons">&#xE147;</i>
													<span>CRUD</span></a>
											</div>
										</div>
									</div>
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>
													<span class="custom-checkbox">
														<input type="checkbox" id="selectAll"/>
														<label for="selectAll"></label>
													</span>
												</th>
												<th>Código</th>
												<th>Nombre de autores</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>
											<%for (int i=0; i < objDataSet.Tables[0].Rows.Count; i++) { %>
												<tr>
													<td>
														<span class="custom-checkbox">
															<input type="checkbox" id="checkbox1" name="options"
																value="1"/>
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
														<a href="#editEmployeeModal" class="edit" data-toggle="modal">
															<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
														<a href="#deleteEmployeeModal" class="delete"data-toggle="modal">
															<i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
													</td>
												</tr>

												<%} %>
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
											aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body">
										<div class="modal-body">
											<div class="form-group">
												<label>Codigo</label>
												<asp:TextBox ID="txtIdModDel" runat="server" class="form-control"></asp:TextBox>
											</div>
											<div class="form-group">
												<label>Nombre de Autor</label>
												<asp:TextBox ID="txtNomAutor" runat="server" class="form-control"></asp:TextBox>
											</div>
										</div>
										<div class="modal-footer">
											<asp:Button ID="btn_Guardar" OnClick="btnGuardar" runat="server" Text="Guardar" class="btn btn-success"/>
											<asp:Button ID="btn_Modificar" OnClick="btnModificar" runat="server" Text="Modificar" class="btn btn-success"/>
											<asp:Button ID="btn_Consultar" OnClick="btnConsultar" runat="server" Text="Consultar" class="btn btn-success"/>
											<asp:Button ID="btn_Borrar" runat="server" OnClick="btnBorrar" Text="Borrar" class="btn btn-danger"/>
											<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>

	</html>