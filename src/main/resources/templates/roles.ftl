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
							<h3 class="panel-title">Roles</h3>
                            <hr>
                        </div>

						<div class="panel-body">

                                <button class="btn btn-primary" data-toggle="modal" data-target="#modalRol">Crear Rol</button>
								<form action="/roles/" method="POST">
                                    <div class="modal fade" id="modalRol" tabindex="-1" role="dialog" aria-labelledby="modalRolLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalRolLabel">Crear Rol</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="text" class="form-control" id="nombrerol" name="nombrerol" placeholder="Nombre de Rol" required>


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
                                <table id="rolestable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                                    <thead>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Nombre de Rol</th>
                                    <th class="text-center">Opciones</th>


                                <#list roles as rol>
                                <tr>

                                    <td class="text-center">${rol.getId()}</td>
                                    <td class="text-center">${rol.getNombreRol()}</td>
                                    <td class="text-center">

                                        <div class="btn-group">

                                        <div class="btn-group">
                                            <form action="/roles/eliminar/${rol.getId()}" method="POST">
                                                <button type="submit" class="btn btn-danger"><i class="fa fa-trash aria-hidden="true"></i></button>
                                            </form>

                                        </div>
                                        </div>
                                    </td>


                                </tr>
                                </#list>
                                </table>
                            </div>

                            <form action="/roles/modificar/" method="POST">
                                <div class="modal fade" id="modalRol2" tabindex="-1" role="dialog" aria-labelledby="modalRol2Label" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalRol2abel">Modificar Rol</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="id2" id="id2">
                                                <input type="text" class="form-control" id="nombrerol2" name="nombrerol2" placeholder="Nombre de Rol" required>


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

    function modificar(id, nombrerol){
        $('#id2').val(id);
        $('#nombrerol2').val(nombrerol);
        }

</script>

</html>
