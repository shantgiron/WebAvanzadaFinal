
<#include "layout.ftl">
<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 align="center" class="panel-title">Listado de productos no devueltos</h3>
                    <hr>
                </div>
            <div class="panel-body">
<br/>
                <div class="table-responsive">
                    <table id="clientstable" class="table table-striped table-bordered table-condensed table-hover table-sm">
                        <thead>
                        <th class="text-center">Cliente</th>
                        <th class="text-center">Equipo</th>
                        <th class="text-center">Dias</th>
                                <#list objetos as object>
                                <tr>

                                    <td class="text-center">${object[0]}</td>
                                    <td class="text-center">${object[1]}</td>
                                    <td class="text-center">${object[2]}</td>


                                </tr>
                                </#list>
                    </table>
                </div>

            </div>
        </div>
    </div>

    <!-- END MAIN CONTENT -->
</div>
</div>
</div>
<!-- END WRAPPER -->
