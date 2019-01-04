
<!doctype html >
<html lang="en">
<head>
    <title>Proyecto Final Web Avanzada</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/assets/css/main.css">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
</head>

<body>
    <!-- WRAPPER -->
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-fixed-top">

            <ul class="nav nav-pills">
                <li><a href="#" class="right-aligned">Bienvenido, ${usuario}</a></li>
                <li><a href="/logout" class="right-aligned">Cerrar Sesión</a></li>

                 </ul>
        </nav>
        <!-- END NAVBAR -->
        <!-- LEFT SIDEBAR -->
        <div id="sidebar-nav" class="sidebar">
            <div class="sidebar-scroll">
                <nav>
                    <ul class="nav">
                        <li><a href="/" class=""><span><@spring.message "inicio" /></span></a></li>
                        <li><a href="/usuarios/" class=""><span><@spring.message "usuarios"/></span></a></li>
                        <li><a href="/clientes/" class=""><span><@spring.message "clientes"/></span></a></li>
                        <li><a href="/productos/" class=""> <span><@spring.message "productos"/></span></a></li>
                        <li><a href="/roles/" class=""><span><@spring.message "departamentos"/></span></a></li>
                        <li><a href="/compras/" class=""><span><@spring.message "compras"/></span></a></li>

                     
                    </ul>
                </nav>
            </div>
        </div>
        <div class="clearfix"></div>
        <footer>
            <div class="container-fluid">
                <p class="copyright"><@spring.message "derecho_autor" /></p>
            </div>
        </footer>


    
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
<script src="/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js">   </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="/assets/vendor/jquery/jquery.min.js"></script>
<script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="/assets/vendor/chartist/js/chartist.min.js"></script>
<script src="/assets/scripts/klorofil-common.js"></script>
<script src="/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
</html>