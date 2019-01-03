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
								<form method="POST" action="/clientes/"  enctype='multipart/form-data'>
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
                                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
                                                    <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
                                                    <input type="text" class="form-control" id="cedula" name="cedula" placeholder="Cedula">
                                                    <input type="date"  class="date" min="2018-01-01" max="2018-12-31" id="fechaNacimiento" name="fechaNacimiento">
                                                    <input type="file"  accept="image/png, image/jpeg" id="foto" name="foto">

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
                                    <th class="text-center">Cedula</th>
                                    <th class="text-center">Nombre</th>
                                    <th class="text-center">Apellido</th>
                                    <th class="text-center">Fecha Nacimiento</th>
                                    <th class="text-center">Opciones</th>


                                <#list clientes as cliente>
                                <tr>

                                    <td class="text-center">${cliente.getCedula()}</td>
                                    <td class="text-center">${cliente.getNombre()}</td>
                                    <td class="text-center">${cliente.getApellido()}</td>
                                    <td class="text-center">${cliente.getFechaNacimiento()}</td>

                                    <td class="text-center">
                                        <div class="btn-group">
                                            <a href="/clientes/historial/${cliente.getId()}" class="btn btn-success"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                            <button type="button" onclick="modificar(${cliente.getId()}, '${cliente.getNombre()}', '${cliente.getApellido()}', '${cliente.getCedula()}', '${cliente.getFechaNacimiento()}',
                                                    '${cliente.getImagen()}')" data-toggle="modal" data-target="#modalClientes2" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                            <a href="/clientes/${cliente.getId()}" class="btn btn-danger"><i class="fa fa-trash aria-hidden="true"></i></a>
                                        </div>
                                    </td>


                                </tr>
                                </#list>
                                </table>
                            </div>

                            <form method="POST" action="/clientes/modificar/"  enctype='multipart/form-data'>
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
                                                <input type="text" class="form-control" id="apellido2" name="apellido2" placeholder="Apellido">
                                                <input type="text" class="form-control" id="cedula2" name="cedula2" placeholder="Cedula">
                                                <input type="date"  class="date" min="2018-01-01" max="2018-12-31" id="fechaNacimiento2" name="fechaNacimiento2">
                                                <input type="file"  accept="image/png, image/jpeg" id="foto2" name="foto2">

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

    function modificar(id, nombre, apellido, cedula, fechaNacimiento, foto){
        $('#id2').val(id);
        $('#nombre2').val(nombre);
        $('#apellido2').val(apellido);
        $('#cedula2').val(cedula);
        $('#fechaNacimiento2').val(fechaNacimiento);
        $('#foto2').val(foto);
    }

</script>


</html>
