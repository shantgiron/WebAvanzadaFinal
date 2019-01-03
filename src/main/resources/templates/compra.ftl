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

                            <form role="form" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

                                <input type="hidden" name="cmd" value="_xclick">
                                <input type="hidden" name="business" value="ricardojoserosario1431-facilitator@gmail.com"">
                                <input type="hidden" name="currency_code" value="USD">


                                <input type="hidden" name="cbt" value="Completar proceso de Compra"> %{--  --}%
                                <input type="hidden" name="rm" value="2">
                                <input type="hidden" name="return" value="http://localhost:8081/pagos/completar">
                                <input type="hidden" name="cancel_return" value="/">

                                <div class="form-group">
                                    <label for="invoice"># Compra:</label>
                                    <input type="text" class="form-control" id="invoice" name="invoice" placeholder="FA1234" value="${factura.getId()}" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="item_name">Título de Compra:</label>
                                    <input type="text" class="form-control" id="item_name" name="item_name" placeholder="Nombre descriptivo" required="required" value="Productos de la compra "+${factura.getId()}>
                                </div>
                                <div class="form-group">
                                    <label for="amount">Monto Total:</label>
                                    <input type="number" class="form-control" id="amount" name="amount" placeholder="Monto de la compra" required="required" value="${factura.getTotal()}">
                                </div>


                                <button type="submit" class="btn btn-default">Efectuar Pago vía Paypal</button>
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
