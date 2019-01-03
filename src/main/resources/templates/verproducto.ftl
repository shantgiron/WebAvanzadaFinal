
<#include "layout.ftl">
<!-- MAIN -->
<div class="main">
    <!-- MAIN CONTENT -->
    <div class="main-content">
        <div class="container-fluid">
            <!-- OVERVIEW -->
            <div class="panel panel-headline">
                <div class="panel-heading">
                    <h3 align="center" class="panel-title">Detalles del Equipo: ${producto.getNombre()}</h3>
                    <hr>
                </div>

                <div class="container form-inline" class="bg-dark" style="padding-top:2%" align="center">
                    <img src="data:image/jpeg;base64, ${producto.getImagen()}" class="img-thumbnail" style="height:200px;width:auto; max-width:200px;">
                </div>

                <br/>
                <div class="panel-body">
                    <div id="product-img">
                        <div id="product-img-zoom">
                            <img src="data:image/jpeg;base64, ${producto.getImagen()}" class="img-thumbnail" style="height:200px;width:auto; max-width:200px;">
                        </div>
                    </div>

                    <div id="product-details">
                    <h1>${producto.getNombre()}</h1>
                    <div id="product-price">
                       <span style="font-size: 14px"><b>Precio: </b></span>$${producto.getPrecio()}
                    </div>
                    <div id="product-price">
                       <span style="font-size: 14px"><b>Existencia: </b></span>${producto.getExistencia()}
                    </div>

                </div>
        </div>
    </div>

    <!-- END MAIN CONTENT -->
</div>
</div>
<!-- END WRAPPER -->
