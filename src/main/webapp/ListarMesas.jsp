<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la lista de clientes que seteamos en el request desde el servlet
List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");


%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listado de mesas</title>
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
            <h2>Listado de mesas</h2>
        </div>
        
        <br>
        <% if (errors != null && !errors.isEmpty()) { %>
        <ul class="alert alert-danger mx-5 px-5">
            <% for (String e : errors.values()) { %>
            <li><%= e %></li>
            <% } %>
        </ul>
        <% } %>
        <div class="col-md-6 text-right">
            <a href="<%= request.getContextPath() %>/mesas/alta" class="btn btn-success">Alta de Mesas</a>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Num. Mesas</th>
                            <th>Capacidad</th>
                            <th>Ubicacion</th>
                            <th>Estado</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Mesa m: mesas) { %>
                        <tr>
                            <td><%= m.getId_mesa() %></td>
                            <td><%= m.getNum_mesa() %></td>
                            <td><%= m.getCapacidad() %></td>
                            <td><%= m.getLugar() %></td>
                            <td><%= m.getEstado() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/mesas/detalle?id=<%= m.getId_mesa() %>" class="btn btn-success">Detalle</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/mesas/editar?id=<%= m.getId_mesa() %>" class="btn btn-primary">Editar</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/mesas/eliminar?id=<%= m.getId_mesa() %>" class="btn btn-danger">Eliminar</a>
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
