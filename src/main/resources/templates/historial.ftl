
<#include "layout.ftl">
<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 align="center" class="panel-title">Historial del Cliente: ${cliente.getNombre()}</h3>
                    <hr>
                </div>
                <div class="panel-body">

                    <div class="container form-inline" class="bg-dark" style="padding-top:2%" align="center">
                        <img src="data:image/jpeg;base64, ${cliente.getImagen()}" class="img-thumbnail" style="height:200px;width:auto; max-width:200px;">
                    </div>

<br/>
                <div class="table-responsive">
                    <table id="clientstable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                        <thead>
                        <th class="text-center">Cliente</th>
                        <th class="text-center">Equipo</th>
                        <th class="text-center">Fecha Inicio de Alquiler</th>
                        <th class="text-center">Fecha Fin de Alquiler</th>
                        <th class="text-center">Estado</th>

                                <#list historial as object>
                                <tr>

                                    <td class="text-center">${object[0]}</td>
                                    <td class="text-center">${object[1]}</td>
                                    <td class="text-center">${object[2]}</td>
                                    <td class="text-center">${object[3]}</td>
                                    <td class="text-center">${object[4]}</td>


                                </tr>
                                </#list>
                    </table>
                </div>

            </div>
        </div>
    </div>
    </div>
    <!-- END MAIN CONTENT -->
</div>
</div>
<!-- END WRAPPER -->
