<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*" %> 
<%@ page import="com.lopez.app.restaurante.models.*" %> 

<%
DescripcionOrdenPlatillos descripcioOrden = (DescripcionOrdenPlatillos) request.getAttribute("desOrden");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle de Descripcion dedescripcioOrden.getOrden()</title>
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
                <h2>Detalle de Descripcion de Oreden</h2>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-6">
                <table class="table table-bordered">
                    <tr>
                        <th>Identificador de Orden </th>
                        <td><%= descripcioOrden.getOrden().getId() %></td>
                    </tr>
                    <tr>
                        <th>Platillo</th>
                        <td>
                            ID Platillo: <%= descripcioOrden.getPlatillo().getId() %> <br>
                            Nombre: <%= descripcioOrden.getPlatillo().getNombre() %> <br>
                            Precio: <%= descripcioOrden.getPlatillo().getPrecio() %> <br>
                            Descripción: <%= descripcioOrden.getPlatillo().getDescripcion() %> <br>
                            Estatus: <%= descripcioOrden.getPlatillo().getEstatus() %>
                        </td>
                    </tr>
                    <tr>
                        <th>Mesa</th>
                        <td>ID Mesa: <%=descripcioOrden.getMesa().getId_mesa() %> <br>
                            Número de Mesa: <%=descripcioOrden.getMesa().getNum_mesa() %> <br>
                            Capacidad: <%=descripcioOrden.getMesa().getCapacidad() %> <br>
                            Lugar: <%=descripcioOrden.getMesa().getLugar() %> <br>
                        </td>
                    </tr>
                    <tr>
                        <th>Mesero</th>
                        <td>
                            ID Mesero: <%=descripcioOrden.getMesero().getId() %> <br>
                            Nombre: <%=descripcioOrden.getMesero().getNombre() %> <%=descripcioOrden.getMesero().getApPaterno() %> <%=descripcioOrden.getMesero().getApMaterno() %> <br>
                            Número de Empleado: <%=descripcioOrden.getMesero().getNum_Empleado() %> <br>
                            Edad: <%=descripcioOrden.getMesero().getEdad() %> <br>
                        </td>
                    </tr>
                    
                            
                    </tr>
                    <tr>
                        <th>Fecha de Reservación</th>
                        <td><%= descripcioOrden.getOrden().getFecha() %></td>
                    </tr>
                    <tr>
                        <th>Cantidad</th>
                        <td><%= descripcioOrden.getDescripcio().getCantidad() %></td>
                    </tr>
                </table>
                <a href="<%= request.getContextPath() %>/descripciones/listar" class="btn btn-secondary">Volver</a>
            </div>
        </div>
    </div>
</body>
</html>
