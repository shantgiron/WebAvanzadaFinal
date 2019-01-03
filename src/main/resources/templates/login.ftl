<!doctype html>
<html lang="en">
<head>
    <title>Práctica #10</title>
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
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="/assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
</head>
<br>
<br>
<br>
<br>
<br>
<div class="row">
    <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">LOGIN</div>
            <div class="panel-body">
                <form action="/login" method="post">
                    <#--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />-->
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="Usuario" name="username" id="username" type="text"
                                   autofocus="">
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Contrasena" name="password" id="password" type="password"
                                   value="">
                        </div>
                    </fieldset>
                    <div>
                        <button type="submit" class="btn btn-primary" name="submit" id="submit">Iniciar Sesión</button>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- /.col-->
</div>
</html>