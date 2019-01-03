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
							<h3 class="panel-title">Ver Rol</h3>
                            <hr>
                        </div>

						<div class="panel-body">
                            <label>ID: </label> ${rol.getId()}
							<br>
                            <label>Nombre de Rol: </label> ${rol.getNombreRol()}
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
