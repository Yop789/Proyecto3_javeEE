<%@ page contentType="text/html" pageEncoding="UTF-8" %> 
<%@ page import="java.util.*" %> 
<%@ page import="com.lopez.app.restaurante.models.*" %> 

<% 
Mesero mesero = (Mesero) request.getAttribute("mesero"); 
%>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detalle del Mesero</title>
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
          <div class="card border">
            <div class="card-header">
              <h3><strong>Detalle del Mesero</strong></h3>
            </div>

            <div class="card-body">
              <ul class="list-group">
                <li class="list-group-item"><strong>Nombre:</strong> <%= mesero.getNombre() %></li>
                <li class="list-group-item"><strong>Apellido Paterno:</strong> <%= mesero.getApPaterno() %></li>
                <li class="list-group-item"><strong>Apellido Materno:</strong> <%= mesero.getApMaterno() %></li>
                <li class="list-group-item"><strong>Fecha Nacimiento:</strong> <%= mesero.getFecha_nacimiento() != null ? mesero.getFecha_nacimiento().toString() : "" %></li>
                <li class="list-group-item"><strong>Teléfono:</strong> <%= mesero.getTelefono() %></li>
                <li class="list-group-item"><strong>Correo:</strong> <%= mesero.getCorreo() %></li>
                <li class="list-group-item"><strong>Calle:</strong> <%= mesero.getCalle() %></li>
                <li class="list-group-item"><strong>Número Interior:</strong> <%= mesero.getNum_interior() != null ? mesero.getNum_interior() : "N/A" %></li>
                <li class="list-group-item"><strong>Número Exterior:</strong> <%= mesero.getNum_exterior() %></li>
                <li class="list-group-item"><strong>Colonia:</strong> <%= mesero.getColonia() %></li>
                <li class="list-group-item"><strong>Ciudad:</strong> <%= mesero.getCiudad() %></li>
                <li class="list-group-item"><strong>Estado:</strong> <%= mesero.getEstado() != null ? mesero.getEstado().name() : "" %></li>
                <li class="list-group-item"><strong>Código Postal:</strong> <%= mesero.getCp() %></li>
                
                <li class="list-group-item"><strong>Número de Empleado:</strong> <%= mesero.getNum_Empleado() != null ? mesero.getNum_Empleado() : "N/A" %></li>

                <li class="list-group-item"><strong>Edad:</strong> <%= mesero.getEdad() != null ? mesero.getEdad() : "N/A" %></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
