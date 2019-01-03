
<#import "layout.ftl" as layout>
<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 class="panel-title">Historial del Cliente: ${cliente.getNombre()}</h3>
                    <hr>
                </div>
                <div class="panel-body">

                    <div class="container form-inline" class="bg-dark" style="padding-top:2%">
                        <img src="data:image/jpeg;base64, ${cliente.getImagen()}" class="img-thumbnail" style="height:200px;width:auto; max-width:200px;">
                    </div>


                </div>



            </div>
        </div>
    </div>

    <!-- END MAIN CONTENT -->
</div>
</div>
<!-- END WRAPPER -->
