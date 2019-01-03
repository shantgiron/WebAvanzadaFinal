
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
                          <form action="/reportes/" method="get">
                              <button type="submit" class="btn btn-primary">Exportar al XLS</button>
                          </form>

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


    $(document).ready(function() {

        var subFamilias = [];
        var promedios = [];


        $("#categoria").change(function() {
            subFamilias = [];
            promedios = [];

            var categoria = $(this).val();
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                url: '/graficar',
                type: 'post',
                data: {categoria: categoria},
                success: function (response) {


                    var ctx = document.getElementById("myChart").innerHTML = "";

                    console.log(response);
                    for (var i = 0; i < response.length; i++){
                        subFamilias.push(response[i][0]);
                        promedios.push(response[i][1]);
                    }
                    console.log(subFamilias);
                    console.log(promedios);

                    var ctx = document.getElementById("myChart");
                    var myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: subFamilias,
                            datasets: [{
                                label: 'Dias promedio',
                                data: promedios,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)'
                                ],
                                borderColor: [
                                    'rgba(255,99,132,1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)'
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
    });
</script>


</html>
