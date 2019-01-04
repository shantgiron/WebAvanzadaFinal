<!doctype html>
<html lang="es">
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
							<h3 class="panel-title">Clientes</h3>
                            <hr>
                        </div>
                        <div class="panel-body">


                                <button class="btn btn-primary" data-toggle="modal" data-target="#modalClientes">Crear Cliente</button>
								<form method="POST" action="http://localhost:8083/clientes/crear/" >
                                    <div class="modal fade" id="modalClientes" tabindex="-1" role="dialog" aria-labelledby="modalClientesLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalClientesLabel">Crear Cliente</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Completo">
                                                    <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Direccion">
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
                                                    <select id="username" name="username" class="form-control" style="width: 100%;" tabindex="-1" aria-hidden="true" required >
                                                        <option selected="selected">Seleccionar Usuario</option>
                                                                    <#list usuarios as usuario>
                                                                    <option value="${usuario.getUsername()}">${usuario.getUsername()}</option>
                                                                    </#list>
                                                    </select>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                    <input type="submit" value="Guardar" class="btn btn-primary" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            <div class="table-responsive">
                                <table id="clientstable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                                    <thead>
                                    <th class="text-center">Nombre</th>
                                    <th class="text-center">Direccion</th>
                                    <th class="text-center">E-mail</th>
                                    <th class="text-center">Opciones</th>


                                <#list clientes as cliente>
                                <tr>

                                    <td class="text-center">${cliente.getNombre()}</td>
                                    <td class="text-center">${cliente.getDireccion()}</td>

                                    <td class="text-center">${cliente.getEmail()}</td>

                                    <td class="text-center">
                                        <div class="btn-group">
                                            <div class="btn-group">
                                                <div class="btn-group">
                                                    <button type="button" onclick="modificar(${cliente.getId()}, '${cliente.getNombre()}', '${cliente.getDireccion()}', '${cliente.getEmail()}')" data-toggle="modal" data-target="#modalClientes2" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>

                                                </div>
                                                <div class="btn-group">
                                                    <form action="http://localhost:8083/clientes/eliminar/${cliente.getId()}" method="POST">
                                                        <button type="submit" class="btn btn-danger"><i class="fa fa-trash aria-hidden="true"></i></button>
                                                    </form>

                                                </div> </div>
                                    </td>


                                </tr>
                                </#list>
                                </table>
                            </div>

                            <form method="POST" action="http://localhost:8083/clientes/modificar/" >
                                <div class="modal fade" id="modalClientes2" tabindex="-1" role="dialog" aria-labelledby="modalClientesLabel2" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalCLientesLabel2">Crear Cliente</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id2" id="id2">
                                                <input type="text" class="form-control" id="nombre2" name="nombre2" placeholder="Nombre">
                                                <input type="text" class="form-control" id="direccion2" name="direccion2" placeholder="Direccion">
                                                <input type="text" class="form-control" id="email2" name="email2" placeholder="Email">
                                                <select id="username2" name="username2" class="form-control" style="width: 100%;" tabindex="-1" aria-hidden="true" required >
                                                    <option selected="selected">Seleccionar Usuario</option>
                                                                    <#list usuarios as usuario>
                                                                    <option value="${usuario.getUsername()}">${usuario.getUsername()}</option>
                                                                    </#list>
                                                </select>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                <input type="submit" value="Guardar" class="btn btn-primary" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
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

    function modificar(id, nombre, direccion, email){
        $('#id2').val(id);
        $('#nombre2').val(nombre);
        $('#direccion2').val(direccion);
        $('#email2').val(email);
    }

</script>


</html>
