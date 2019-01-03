
<html>
<#include "layout.ftl">
<head>
    <meta name="layout" content="template"/>
    <title>Formulario de Prueba</title>
</head>

<body>

<h1 class="page-header">Formulario de Compra - Paypal</h1>


<h1>Formulario de prueba Paypal</h1>

<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="_xclick">
    <input type="hidden" name="business" value="ricardojoserosario1431-facilitator@gmail.com">
    <input type="hidden" name="item_name" value="Prueba de Compra">
    <input type="hidden" name="currency_code" value="USD">
    <input type="hidden" name="amount" value="20.00">
    <input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif"
           name="submit"
           alt="Comprando mediante Paypal...">
</form>

</body>
</html>