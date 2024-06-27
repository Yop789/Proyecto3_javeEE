<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*" %> 
<%@ page import="com.lopez.app.restaurante.models.*" %> 

<% 
Cliente cliente = (Cliente) request.getAttribute("cliente"); 
%>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detalle del Cliente</title>
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
          <div class="card-border">
            <div class="card-header">
              <h3><strong> Detalle del Cliente </strong></h3>
            </div>
          </div>

          <div class="card-body">
            <ul class="list-group">
                <li class="list-group-item"><strong>Nombre: </strong><%= cliente.getNombre() %></li>
                <li class="list-group-item"><strong>Apellido Paterno: </strong><%= cliente.getApPaterno() %></li>
                <li class="list-group-item"><strong>Apellido Materno: </strong><%= cliente.getApMaterno() %></li>
                <li class="list-group-item"><strong>Telefono: </strong><%= cliente.getTelefono() %></li>
                <li class="list-group-item"><strong>Correo: </strong><%= cliente.getCorreo() %></li>
                <li class="list-group-item"><strong>Calle: </strong><%= cliente.getCalle() %></li>
                <li class="list-group-item"><strong>Numero Interior: </strong><%= cliente.getNum_interno() %></li>
                <li class="list-group-item"><strong>Numero Exterior: </strong><%= cliente.getNum_externo() %></li>

                <li class="list-group-item"><strong>Colonia: </strong><%= cliente.getColonia() %></li>
                <li class="list-group-item"><strong>Ciudad: </strong><%= cliente.getCiudad() %></li>
                <li class="list-group-item"><strong>Estado: </strong><%= cliente.getEstado() %></li>
                <li class="list-group-item"><strong>Codigo Postal: </strong><%= cliente.getCp() %></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
