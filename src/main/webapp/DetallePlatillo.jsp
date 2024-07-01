<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>


<%
Platillo platillo = (Platillo) request.getAttribute("platillo");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detalle del Platillo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card border">
                    <div class="card-header">
                        <h3><strong>Detalle del Platillo</strong></h3>
                    </div>

                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item"><strong>Nombre:</strong> <%= platillo.getNombre() %></li>
                            <li class="list-group-item"><strong>Precio: $</strong> <%= platillo.getPrecio() %></li>
                            <li class="list-group-item"><strong>Descripción:</strong> <%= platillo.getDescripcion() %></li>
                            <li class="list-group-item"><strong>Estatus:</strong> <%= platillo.getEstatus() != null ? platillo.getEstatus().name() : "" %></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
