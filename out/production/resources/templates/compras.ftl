
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
							<h3 class="panel-title">Compras</h3>
                            <hr>
                        </div>

						<div class="panel-body">

                                <button class="btn btn-primary" data-toggle="modal" data-target="#modalAlquiler">Nueva Compra</button>
								<form action="http://localhost:8081/compras/despacho/" method="post">
                                    <div class="modal fade" id="modalAlquiler" tabindex="-1" role="dialog" aria-labelledby="modalAlquilerLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalAlquilerLabel">Despachar Pedidos</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">

                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Cliente</label>
                                                                <select id="client" name="client" class="form-control" style="width: 100%;" tabindex="-1" aria-hidden="true" required >
                                                                    <option selected="selected">Seleccionar Cliente</option>
                                                                    <#list clientes as cliente>
                                                                    <option value="${cliente.getId()}">${cliente.getNombre()}</option>
                                                                    </#list>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Fecha</label>
                                                                <div class='input-group'>
                                                                    <div class='input-group date'>
                                                                        <input id="datepicker" name="fecha" class="form-control pull-right" type="date" required>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">


                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Producto</label>

                                                                <select id="producto" name="producto" class="form-control select2 select2-hidden-accessible" required>
                                                                    <option value="">Seleccionar producto</option>
                                                                <#list productos as producto>
                                                                    <option value="${producto.getId()}">${producto.getNombre()}</option>
                                                                </#list>
                                                                </select>

                                                            </div>
                                                        </div>
                                                            <input type="hidden" id="cant[]" name="cant[]">
                                                            <input type="hidden" id="ids[]" name="ids[]">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Agregar</label>
                                                             <button type="button" id="agregar" name="agregar" onclick="prueba()" class="btn btn-primary form-control">+</button>
                                                               </div>
                                                        </div>

                                                    </div>

                                                    <div class="row">
                                                        <center>
                                                            <div id="foto" name="foto"></div>
                                                        </div>
                                                    </center>
                                                    <br>

                                                    <div class="table-responsive table-bordered card">


                                                        <table id="carrito" name="carrito" class="table">
                                                            <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Nombre De Equipo</th>
                                                                <th>Precio por dia</th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>

                                                            </tbody>

                                                        </table>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>


                                                        <button type="submit"  class="btn btn-info" data-backdrop="true">
                                                            Despachar
                                                        </button>

                                                    </div>


                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            <div class="table-responsive">
                                <table id="rolestable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                                    <thead>
                                    <th class="text-center">ID</th>
                                    <th class="text-center">Nombre de Cliente</th>
                                    <th class="text-center">Nombre de Equipo</th>
                                    <th class="text-center">Estado</th>

                                    <th class="text-center">Opciones</th>


                                <#list alquileres as alquiler>
                                <tr>

                                    <td class="text-center">${alquiler.getId()}</td>
                                    <td class="text-center">${alquiler.getCliente().getNombre()}</td>
                                    <td class="text-center">${alquiler.getProducto().getNombre()}</td>
                                    <td class="text-center">${alquiler.getCondicion()}</td>
                                    <td>

                                        <div class="btn-group">
                                            <div class="btn-group">
                                                <form action="http://localhost:8081/compras/entregado/${alquiler.getId()}" method="GET">
                                                    <button type="submit" class="btn btn-success"><i class="fa fa-eye" aria-hidden="true"></i></button>
                                                </form>
                                            </div>
                                            <div class="btn-group">
                                                <form action="http://localhost:8081/compras/eliminar/${alquiler.getId()}" method="POST">
                                                    <button type="submit" class="btn btn-danger"><i class="fa fa-trash aria-hidden="true"></i></button>
                                                </form>

                                            </div>
                                        </div>
                                    </td>


                                </tr>
                                </#list>
                                </table>
                            </div>
							</div>
							<!-- END REALTIME CHART -->

					</div>
				</div>
			</div>

			<!-- END MAIN CONTENT -->
		</div>

		</div>
	<!-- END WRAPPER -->
</body>


<script>

    var id =[];
    var nombre = [];
    var precio = [];
    var nombrealq = [];
    var precioalq =[];
    var existencias=[];
    var ids = [];
    var imgs=[];

     <#list productos as producto>

            id.push(${producto.getId()});
            imgs.push('${producto.getImagen()}');
            nombre.push('${producto.Nombre()}');
            precio.push('${producto.getPrecio()}');
            existencias.push(${producto.getExistencia()});

     </#list>
    $(function() {

        $('#agregar').prop('disabled', true);
    });
    $( "#producto" ).change(function() {
        $('#foto').html("");


        for(var i=0;i<id.length;i++){


                    if(id[i] == document.getElementById("producto").value){
                        var inyeccionfoto = '<img src="data:image/jpeg;base64,'+imgs[i]+'" class="img-thumbnail" style="height:200px;width:auto; max-width:200px;">';
                        $('#foto').html(inyeccionfoto);

                        if(existencias[i]==0){
                                $('#agregar').prop('disabled', true);

                            }

                        else{
                            $('#agregar').prop('disabled', false);


                        }
                    }

            }
    });


    function prueba(){
        var equipoid = document.getElementById("producto").value;
        for(var i=0;i<id.length;i++){
            console.log(equipoid)
            if(id[i] == equipoid){

                nombrealq.push(nombre[i]);
                precioalq.push(precio[i]);
                ids.push(equipoid);
                existencias[i] -= 1;
                var markup ="<tr><td>"+id[i]+"</td><td>"+nombre[i]+"</td><td>"+precio[i]+"</td></tr>";
                console.log(markup)
                $("#carrito tbody").append(markup);
                console.log($("#carrito tbody"));

            }



        }
        document.getElementById('producto').selectedIndex = 0;
        document.getElementById('ids[]').value = ids;
        $('#foto').html("");

        $('#agregar').prop('disabled', true);

    }



</script>
