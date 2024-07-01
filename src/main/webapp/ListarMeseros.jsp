<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la lista de clientes que seteamos en el request desde el servlet
List<Mesero> meseros = (List<Mesero>) request.getAttribute("meseros");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listado de Meseros</title>
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
            <h2>Listado de Meseros</h2>
        </div>
        <div class="col-md-6 text-right">
            <a href="<%= request.getContextPath() %>/meseros/alta" class="btn btn-success">Alta de Mesero</a>
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
                            <th>ID</th>
                            <th>Num. Mesero</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Edad</th>
                            <th>Fecha  de Nacimiento</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Mesero m: meseros) { %>
                        <tr>
                            <td><%= m.getId() %></td>
                            <td><%= m.getNum_Empleado() %></td>
                            <td><%= m.getNombre() %></td>
                            <td><%= m.getApPaterno() %></td>
                            <td><%= m.getApMaterno() %></td>
                            <td><%= m.getEdad() %></td>
                            <td><%= m.getFecha_nacimiento() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/meseros/detalle?id=<%= m.getId() %>" class="btn btn-success">Detalle</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/meseros/editar?id=<%= m.getId() %>" class="btn btn-primary">Editar</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/meseros/eliminar?id=<%= m.getId() %>" class="btn btn-danger">Eliminar</a>
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
