<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.lopez.app.restaurante.models.OrdenMeseroMesa" %>

<%
OrdenMeseroMesa orden = (OrdenMeseroMesa) request.getAttribute("orden");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Orden</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Detalle de Orden</h2>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-6">
                <table class="table table-bordered">
                    <tr>
                        <th>ID de Orden</th>
                        <td><%= orden.getOrdenar().getId() %></td>
                    </tr>
                    <tr>
                        <th>Mesa</th>
                        <td>ID Mesa: <%= orden.getMesa().getId_mesa() %> <br>
                            Número de Mesa: <%= orden.getMesa().getNum_mesa() %> <br>
                            Capacidad: <%= orden.getMesa().getCapacidad() %> <br>
                            Lugar: <%= orden.getMesa().getLugar() %> <br>
                        </td>
                    </tr>
                    <tr>
                        <th>Mesero</th>
                        <td>
                            ID Mesero: <%= orden.getMesero().getId() %> <br>
                            Nombre: <%= orden.getMesero().getNombre() %> <%= orden.getMesero().getApPaterno() %> <%= orden.getMesero().getApMaterno() %> <br>
                            Número de Empleado: <%= orden.getMesero().getNum_Empleado() %> <br>
                            Edad: <%= orden.getMesero().getEdad() %> <br>
                        </td>
                    </tr>
                    <tr>
                        <th>Fecha de Orden</th>
                        <td><%= orden.getOrdenar().getFecha() %></td>
                    </tr>
                </table>
                <a href="<%= request.getContextPath() %>/ordenes/listar" class="btn btn-secondary">Volver</a>
            </div>
        </div>
    </div>
</body>
</html>
