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
							<h3 class="panel-title"></h3>
                            <hr>
                        </div>

						<div class="panel-body">
                            <label>ID: </label>${alquiler.getId()}
							<br>
                            <label>Cliente: </label>${alquiler.getCliente().getNombre()} ${alquiler.getCliente().getApellido()}
                            <br>
                            <label>Producto:</label>${alquiler.getProducto().getNombreEquipo()}
                            <br>
                            <label>Total a Pagar: </label>${alquiler.getCosto()}
                            <br>
                            <form action="/alquileres/entrega/${alquiler.getId()}" method="POST">
                                <button type="submit" class="btn btn-success"><i class="fa fa-check" aria-hidden="true"></i></button>
                            </form>

						</div>
							<!-- END REALTIME CHART -->
						</div>
					</div>
				</div>
			</div>

			<!-- END MAIN CONTENT -->

		</div>
	<!-- END WRAPPER -->
</body>

</html>
