<!doctype html>
<html lang="en">
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
							<h3 class="panel-title">Productos</h3>
                            <hr>
                        </div>

						<div class="panel-body">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#modalEquipo">Crear Producto</button>
								<form method="POST" action="http://localhost:8082/productos/crear/"  enctype='multipart/form-data'>
                                    <div class="modal fade" id="modalEquipo" tabindex="-1" role="dialog" aria-labelledby="modalEquipoLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalEquipoLabel">Crear Equipo</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del Articulo" required>
                                                    <input type="number" class="form-control" id="precio" name="precio" placeholder="Precio del Articulo" required>
                                                    <input type="number" class="form-control" id="existencia" name="existencia" placeholder="Existencia del Articulo" required>

                                                    <input type="file"  accept="image/png, image/jpeg" id="foto" name="foto" required>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                                    <input type="submit" value="Guardar" class="btn btn-primary" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>

							<!-- END REALTIME CHART -->
                            <div class="table-responsive">
                                <table id="clientstable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                                    <thead>
                                    <th class="text-center">Codigo</th>
                                    <th class="text-center">Nombre de Equipo</th>
                                    <th class="text-center">Precio</th>
                                    <th class="text-center">Existencia</th>
                                    <th class="text-center">Opciones</th>


                                <#list productos as producto>
                                <tr>

                                    <td class="text-center">${producto.getId()}</td>
                                    <td class="text-center">${producto.getNombreEquipo()}</td>
                                    <td class="text-center">${producto.getPrecio()}</td>
                                    <td class="text-center">${producto.getStock()}</td>

                                    <td class="text-center">
                                        <div class="btn-group">

                                            <button type="button" onclick="modificar(${producto.getId()}, '${producto.getNombreEquipo()}', '${producto.getPrecio()}', '${producto.getStock()}''
                                                    )" data-toggle="modal" data-target="#modalEquipo2" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                        </div>
                                        <div class="btn-group">
                                            <form action="http://localhost:8083/roles/eliminar/${rol.getId()}" method="POST">

                                            <button href="http://localhost:8082/productos/eliminar/${producto.getId()}" class="btn btn-danger"><i class="fa fa-trash aria-hidden="true"></i></button>
                                            </form>
                                        </div>

                                    </td>


                                </tr>
                                </#list>
                                </table>
                            </div>
                            <form method="POST" action="http://localhost:8082/productos/modificar"  enctype='multipart/form-data'>
                                <div class="modal fade" id="modalEquipo2" tabindex="-1" role="dialog" aria-labelledby="modalEquipo2Label" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalEquipo2Label">Crear Equipo</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id2" id="id2">
                                                <input type="text" class="form-control" id="nombre2" name="nombre2" placeholder="Nombre del Equipo" required>
                                                <input type="text" class="form-control" id="precio2" name="precio2" placeholder="Precio del Equipo" required>
                                                <input type="text" class="form-control" id="existencia2" name="existencia2" placeholder="Existencia del Equipo" required>

                                                <input type="file"  accept="image/png, image/jpeg" id="foto2" name="foto2" required>
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
    $('.datepicker').datepicker({format: "dd-mm-yyyy"});

    function modificar(id, nombre, precio, existencia, categoria, foto){
        $('#id2').val(id);
        $('#nombre2').val(nombre);
        $('#precio2').val(precio);
        $('#existencia2').val(existencia);

        $('#foto2').val(foto);
    }

</script>
</html>
