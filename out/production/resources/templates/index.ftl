
<!doctype html>
<#include "layout.ftl">
<html>
<body>

		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">

						<div class="col-md-6">
							<!-- MULTI CHARTS -->

                            <div class="panel">
                                <div class="panel-heading">Compras Realizadas

                                </div>
                                <div class="panel-body no-padding">
                                    <canvas id="myChart" width="400" height="400"></canvas>
                                </div>

                            </div>
							<!-- END MULTI CHARTS -->

							<!-- END REALTIME CHART -->
						</div>

                    <div class="col-md-6">
                        <!-- MULTI CHARTS -->

                        <div class="panel">
                            <div class="panel-heading">Despachos Realizados

                            </div>
                            <div class="panel-body no-padding">
                                <canvas id="myChart2" width="400" height="400"></canvas>
                            </div>

                        </div>
                        <!-- END MULTI CHARTS -->

                        <!-- END REALTIME CHART -->
                    </div>

                    <div class="col-md-6">
                        <!-- MULTI CHARTS -->

                        <div class="panel">
                            <div class="panel-heading">Despachos Pendientes

                            </div>
                            <div class="panel-body no-padding">
                                <canvas id="myChart3" width="400" height="400"></canvas>
                            </div>

                        </div>
                        <!-- END MULTI CHARTS -->

                        <!-- END REALTIME CHART -->
                    </div>


                    <div class="col-md-6">
                        <!-- MULTI CHARTS -->

                        <div class="panel">
                            <div class="panel-heading">Reporte

                            </div>

                              <div class="modal-footer">
                              <button type="button" onclick="generarReporte()" class="btn btn-primary">Exportar al XLS</button>
                              </div>


                        </div>
                        <!-- END MULTI CHARTS -->

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

    function generarReporte(){

        $.ajax({
            url: '/reportes/',
            type: 'get',

            success: function (data) {

                alert("El reporte pedidos.xls puede ser accedido desde el escritorio");

                }

        });

    }


    $(document).ready(function() {
            $.ajax({
                url: 'http://localhost:8081/compras/total',
                type: 'get',


                success: function (data) {

                    console.log(data);
                    var ctx = document.getElementById("myChart").innerHTML = "";


                    var ctx = document.getElementById("myChart");
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            datasets: [{
                                label: 'Total de compras realizadas',
                                data: data,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)'

                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero:true
                                    }
                                }]
                            }
                        }
                    });

                }

            });


        $.ajax({
            url: 'http://localhost:8081/compras/totaldespachospendientes',
            type: 'get',


            success: function (data) {

                console.log(data);
                var ctx = document.getElementById("myChart2").innerHTML = "";


                var ctx = document.getElementById("myChart2");
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        datasets: [{
                            label: 'Total de pedidos pendientes',
                            data: data,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)'

                            ],
                            borderColor: [
                                'rgba(255,99,132,1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });

            }

        });

        $.ajax({
            url: 'http://localhost:8081/compras/totaldespachosefectuados',
            type: 'get',


            success: function (data) {

                console.log(data);
                var ctx = document.getElementById("myChart3").innerHTML = "";


                var ctx = document.getElementById("myChart3");
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        datasets: [{
                            label: 'Total de pedidos realizados',
                            data: data,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)'

                            ],
                            borderColor: [
                                'rgba(255,99,132,1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });

            }

        });
    });
</script>


</html>
