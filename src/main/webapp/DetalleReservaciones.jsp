<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*" %> 
<%@ page import="com.lopez.app.restaurante.models.*" %> 

<%
ReservacionMesaCliente reservacion = (ReservacionMesaCliente) request.getAttribute("reservacion");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Reservación</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script
      src="https://code.jquery.com/jquery-2.2.4.min.js"
      integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
      crossorigin="anonymous"
    ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Detalle de Reservación</h2>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-6">
                <table class="table table-bordered">
                    <tr>
                        <th>ID Reservación</th>
                        <td><%= reservacion.getReservacio().getId() %></td>
                    </tr>
                    <tr>
                        <th>Mesa</th>
                        <td>ID Mesa: <%= reservacion. getMesa().getId_mesa() %> <br>
                            Número de Mesa: <%= reservacion. getMesa().getNum_mesa() %> <br>
                            Capacidad: <%= reservacion. getMesa().getCapacidad() %> <br>
                            Lugar: <%= reservacion. getMesa().getLugar() %> <br>
                            </td>
                    </tr>
                    <tr>
                        <th>Cliente</th>
                        <td>ID Cliente: <%= reservacion.getCliente().getId() %> <br>
                            Nombre: <%= reservacion.getCliente().getNombre() %> <br>
                            Apellido Paterno: <%= reservacion. getCliente().getApPaterno() %> <br>
                            Apellido Materno: <%= reservacion. getCliente().getApMaterno() %> <br>
                            Teléfono: <%= reservacion. getCliente().getTelefono() %> <br>
                            Correo: <%= reservacion. getCliente().getCorreo() %></td>
                    </tr>
                    <tr>
                        <th>Fecha de Reservación</th>
                        <td><%= reservacion.getReservacio().getFecha() %></td>
                    </tr>
                    <tr>
                        <th>Fecha a Reservar</th>
                        <td><%= reservacion.getReservacio().getFecha_a_reservar() %></td>
                    </tr>
                    <tr>
                        <th>Estatus</th>
                        <td><%= reservacion.getReservacio().getEstatus() %></td>
                    </tr>
                    <%-- <tr>
                        <th>IdPaypal</th>
                        <td><%= reservacion.getReservacio().getIdOrderPypal() %></td>
                    </tr> --%>
                </table>
                <a href="<%= request.getContextPath() %>/reservaciones/listar" class="btn btn-secondary">Volver</a>
            </div>
        </div>
    </div>
</body>
</html>
