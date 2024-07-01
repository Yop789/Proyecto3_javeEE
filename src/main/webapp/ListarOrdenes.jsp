<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la lista de clientes que seteamos en el request desde el servlet
List<Ordenar> ordenes = (List<Ordenar>) request.getAttribute("ordenes");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
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
        <br>
        <% if (errors != null && !errors.isEmpty()) { %>
        <ul class="alert alert-danger mx-5 px-5">
            <% for (String e : errors.values()) { %>
            <li><%= e %></li>
            <% } %>
        </ul>
        <% } %>
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
                            <td><%= r.getId_mesero() %></td>
                            <td><%= r.getFecha() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/ordenes/detalle?id=<%= r.getId() %>" class="btn btn-success">Detalle</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/ordenes/editar?id=<%= r.getId() %>" class="btn btn-primary">Editar</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/ordenes/eliminar?id=<%= r.getId() %>" class="btn btn-danger">Eliminar</a>
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
