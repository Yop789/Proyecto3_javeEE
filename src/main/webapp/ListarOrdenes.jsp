<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la lista de clientes que seteamos en el request desde el servlet
List<Ordenar> ordenes = (List<Ordenar>) request.getAttribute("ordenes");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listado de Ordenes</title>
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
            <h2>Listado de Ordenes</h2>
        </div>
        <div class="col-md-6 text-right">
            <a href="<%= request.getContextPath() %>/ordenes/alta" class="btn btn-success">Alta de Ordenes</a>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Id de Ordenesn</th>
                            <th>Num. Mesas</th>
                            <th>Num. Cliente</th>
                            <th>Fecha</th>
                            <th>Fecha a Reservar</th>
                            <th>Estado</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Ordenar r: ordenes) { %>
                        <tr>
                            <td><%= r.getId() %></td>
                            <td><%= r.getId_mesa() %></td>
                            <td><%= r.getId_cliente() %></td>
                            <td><%= r.getFecha() %></td>
                            <td><%= r.getFecha_a_reservar() %></td>
                            <td><%= r.getEstatus() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/Ordenesnes/detalle?id=<%= r.getId() %>" class="btn btn-success">Detalle</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/Ordenesnes/editar?id=<%= r.getId() %>" class="btn btn-primary">Editar</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/Ordenesnes/eliminar?id=<%= r.getId() %>" class="btn btn-danger">Eliminar</a>
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
