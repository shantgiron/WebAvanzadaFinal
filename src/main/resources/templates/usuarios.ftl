<#include "layout.ftl">
<body>
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Usuarios</h3>
                            <hr>
                        </div>

						<div class="panel-body">

                                <button class="btn btn-primary" data-toggle="modal" data-target="#modalUsuario">Crear Usuario</button>
								<form action="/usuarios/" method="POST">
                                    <div class="modal fade" id="modalUsuario" tabindex="-1" role="dialog" aria-labelledby="modalUsuarioLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalUsuarioLabel">Crear Usuario</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="text" class="form-control" id="username" name="username" placeholder="Nombre de Usuario" required>

                                                    <input type="password" class="form-control" id="password" name="password" placeholder="Contrasena" required>
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="E-Mail">
                                                    <select id="rol" name="rol" class="form-control select2 select2-hidden-accessible" required>
                                                    <#list roles as rol>
                                                        <option value="${rol.getNombreRol()}">${rol.getNombreRol()}</option>
                                                    </#list>
                                                    </select>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                    <button type="submit" class="btn btn-primary">Guardar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            <div class="table-responsive">
                                <table id="userstable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                                    <thead>
                                    <th class="text-center">Nombre de Usuario</th>
                                    <th class="text-center">Contraseña</th>
                                    <th class="text-center">E-Mail</th>
                                    <th class="text-center">Opciones</th>


                                <#list usuarios as usuario>
                                <tr>

                                    <td class="text-center">${usuario.getUsername()}</td>
                                    <td class="text-center">${usuario.getPassword()}</td>
                                    <td class="text-center">${usuario.getEmail()}</td>
                                    <td class="text-center">
                                        <div class="btn-group">
                                            <div class="btn-group">
                                                <button type="button" onclick="modificar(${usuario.getId()}, '${usuario.getUsername()}')" data-toggle="modal" data-target="#modalUsuario2" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>

                                            </div>
                                            <div class="btn-group">
                                                <form action="/usuarios/eliminar/${usuario.getId()}" method="POST">
                                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash aria-hidden="true"></i></button>
                                                </form>

                                            </div>
                                              </div>
                                    </td>


                                </tr>
                                </#list>
                                </table>
                            </div>

                            <form action="/usuarios/modificar/" method="POST">
                                <div class="modal fade" id="modalUsuario2" tabindex="-1" role="dialog" aria-labelledby="modalUsuario2Label" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalUsuario2Label">Modificar Usuario</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id2" id="id2">

                                                <input type="text" class="form-control" id="username2" name="username2" placeholder="Nombre de Usuario" required>

                                                <input type="password" class="form-control" id="password2" name="password2" placeholder="Contrasena" required>
                                                <input type="email" class="form-control" id="email2" name="email2" placeholder="E-Mail">
                                                <select id="rol2" name="rol2" class="form-control select2 select2-hidden-accessible" required>
                                                    <#list roles as rol>
                                                        <option value="${rol.getNombreRol()}">${rol.getNombreRol()}</option>
                                                    </#list>
                                                </select>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <button type="submit" class="btn btn-primary">Guardar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <!-- END REALTIME CHART -->
						</div>
					</div>
				</div>
			</div>

			<!-- END MAIN CONTENT -->
		</div>

		</div>
	<!-- END WRAPPER -->
</body>

<script>

    function modificar(id, usuario){
        $('#id2').val(id);
        $('#username2').val(usuario);
    }

</script>