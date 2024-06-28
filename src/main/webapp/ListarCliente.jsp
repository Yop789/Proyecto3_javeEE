<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la lista de clientes que seteamos en el request desde el servlet
List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Listado de Clientes</title>
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
            <h2>Listado de Clientes</h2>
        </div>
        <div class="col-md-6 text-right">
            <a href="<%= request.getContextPath() %>/clientes/alta" class="btn btn-success">Alta de Cliente</a>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Código Postal</th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Cliente c : clientes) { %>
                        <tr>
                            <td><%= c.getId() %></td>
                            <td><%= c.getNombre() %></td>
                            <td><%= c.getApPaterno() %></td>
                            <td><%= c.getApMaterno() %></td>
                            <td><%= c.getTelefono() %></td>
                            <td><%= c.getCorreo() %></td>
                            <td><%= c.getCp() %></td>
                            <td>
                                <a href="<%= request.getContextPath() %>/clientes/detalle?id=<%= c.getId() %>" class="btn btn-success">Detalle</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/clientes/editar?id=<%= c.getId() %>" class="btn btn-primary">Editar</a>
                            </td>
                            <td>
                                <a href="<%= request.getContextPath() %>/clientes/eliminar?id=<%= c.getId() %>" class="btn btn-danger">Eliminar</a>
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
