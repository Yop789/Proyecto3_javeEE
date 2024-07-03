<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la lista de clientes que seteamos en el request desde el servlet
List<DescripcioOrden> descripciones = (List<DescripcioOrden>) request.getAttribute("descripciones");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listado de la Descripcio orden</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="Header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h2>Listado con la descripcion de la orden</h2>
        </div>
        <div class="col-md-6 text-right">
            <a href="<%= request.getContextPath()%>/descripciones/alta" class="btn btn-success">Alta de Reservacio</a>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Id </th>
                            <th>Num. Orden</th>
                            <th>Platillo</th>
                            <th>Cantidad</th>
                            <th>Estado</th>
                            <th></th>
                            <th></th>

                        </tr>
                    </thead>
                    <tbody>
                        <% for (DescripcioOrden r: descripciones) { %>
                        <tr>
                            <td><%= r.getId() %></td>
                            <td><%= r.getId_orden() %></td>
                            <td><%= r.getId_platillo() %></td>
                            <td><%= r.getCantidad() %></td>
                            <td><%= r.getEstatus() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/descripciones/detalles?id=<%= r.getId() %>" class="btn btn-success">Detalle</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/descripciones/eliminar?id=<%= r.getId() %>" class="btn btn-danger">Eliminar</a>
                            </td>
                        </tr>

                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
