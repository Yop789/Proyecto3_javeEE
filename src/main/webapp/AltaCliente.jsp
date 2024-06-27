<%@page contentType="text/html" pageEncoding="UTF-8" %> 
<%@page import="java.util.*" %>
<%@page import="com.lopez.app.restaurante.models.Enum.Estado" %>

<% 
Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
          <h2>Formulario alta camiones</h2>
        </div>
      </div>

      <br>
      <% if (errores != null && !errores.isEmpty()) { %>
        <ul class="alert alert-danger mx-5 px-5">
          <% for (String e : errores.values()) { %>
            <li><%= e %></li>
          <% } %>
        </ul>
      <% } %>

      <div class="row">
        <form action="<%= request.getContextPath() %>/clientes/alta" method="post">
          <div class="col-md-12">
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input
                type="text"
                id="nombre"
                name="nombre"
                class="form-control"
                value="<%= request.getParameter("nombre") != null ? request.getParameter("nombre") : "" %>"
              />
              <% if (errores != null && errores.containsKey("nombre")) { %>
                <span class="text-danger"><%= errores.get("nombre") %></span>
              <% } %>
            </div>
            
            <div class="form-group">
              <label for="apPaterno">Apellido Paterno</label>
              <input
                type="text"
                id="apPaterno"
                name="apPaterno"
                class="form-control"
                value="<%= request.getParameter("apPaterno") != null ? request.getParameter("apPaterno") : "" %>"
              />
              <% if (errores != null && errores.containsKey("apPaterno")) { %>
                <span class="text-danger"><%= errores.get("apPaterno") %></span>
              <% } %>
            </div>
            <div class="form-group">
              <label for="apMaterno">Apellido Materno</label>
              <input
                type="text"
                id="apMaterno"
                name="apMaterno"
                class="form-control"
                value="<%= request.getParameter("apMaterno") != null ? request.getParameter("apMaterno") : "" %>"
              />
              <% if (errores != null && errores.containsKey("apMaterno")) { %>
                <span class="text-danger"><%= errores.get("apMaterno") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="telefono">Telefono</label>
              <input
                type="text"
                id="telefono"
                name="telefono"
                class="form-control"
                value="<%= request.getParameter("telefono") != null ? request.getParameter("telefono") : "" %>"
              />
              <% if (errores != null && errores.containsKey("telefono")) { %>
                <span class="text-danger"><%= errores.get("telefono") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="correo">Correo</label>
              <input
                type="text"
                id="correo"
                name="correo"
                class="form-control"
                value="<%= request.getParameter("correo") != null ? request.getParameter("correo") : "" %>"
              />
              <% if (errores != null && errores.containsKey("correo")) { %>
                <span class="text-danger"><%= errores.get("correo") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="calle">Calle</label>
              <input
                type="text"
                id="calle"
                name="calle"
                class="form-control"
                value="<%= request.getParameter("calle") != null ? request.getParameter("calle") : "" %>"
              />
              <% if (errores != null && errores.containsKey("calle")) { %>
                <span class="text-danger"><%= errores.get("calle") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="numExterior">Numero Exterior</label>
              <input
                type="number"
                id="numExterior"
                name="numExterior"
                class="form-control"
                value="<%= request.getParameter("numExterior") != null ? request.getParameter("numExterior") : "" %>"
              />
              <% if (errores != null && errores.containsKey("numExterior")) { %>
                <span class="text-danger"><%= errores.get("numExterior") %></span>
              <% } %>
            </div>
            <div class="form-group">
              <label for="numInterior">Numero Interior</label>
              <input
                type="number"
                id="numInterior"
                name="numInterior"
                class="form-control"
                value="<%= request.getParameter("numInterior") != null ? request.getParameter("numInterior") : "" %>"
              />
              <% if (errores != null && errores.containsKey("numInterior")) { %>
                <span class="text-danger"><%= errores.get("numInterior") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="colonia">Colonia</label>
              <input
                type="text"
                id="colonia"
                name="colonia"
                class="form-control"
                value="<%= request.getParameter("colonia") != null ? request.getParameter("colonia") : "" %>"
              />
              <% if (errores != null && errores.containsKey("colonia")) { %>
                <span class="text-danger"><%= errores.get("colonia") %></span>
              <% } %>
            </div>
            <div class="form-group">
              <label for="ciudad">Ciudad</label>
              <input
                type="text"
                id="ciudad"
                name="ciudad"
                class="form-control"
                value="<%= request.getParameter("ciudad") != null ? request.getParameter("ciudad") : "" %>"
              />
              <% if (errores != null && errores.containsKey("ciudad")) { %>
                <span class="text-danger"><%= errores.get("ciudad") %></span>
              <% } %>
            </div>

           <div class="form-group">
                    <label for="estado">Estado</label>
                    <select
                        id="estado"
                        name="estado"
                        class="form-control"
                        aria-label="Default select example"
                    >
                        <option value="">---selecciona un estado de México---</option>
                        <%
                            String selectedEstado = request.getParameter("estado");
                            Estado selectedEstadoEnum = null;
                            if (selectedEstado != null && !selectedEstado.isEmpty()) {
                                try {
                                    selectedEstadoEnum = Estado.valueOf(selectedEstado);
                                } catch (IllegalArgumentException e) {
                                    // El valor del parámetro no coincide con ninguno de los valores de Estado
                                }
                            }
                        %>
                        <% for (Estado c : Estado.values()) { %>
                            <option value="<%= c %>" <%= (selectedEstadoEnum != null && c.equals(selectedEstadoEnum)) ? "selected" : "" %>><%= c %></option>
                        <% } %>
                    </select>
                    <% if (errores != null && errores.containsKey("estado")) { %>
                        <span class="text-danger"><%= errores.get("estado") %></span>
                    <% } %>
                </div>

            <div class="form-group">
              <label for="cp">Codigo Postal</label>
              <input
                type="number"
                id="cp"
                name="cp"
                class="form-control"
                value="<%= request.getParameter("cp") != null ? request.getParameter("cp") : "" %>"
              />
              <% if (errores != null && errores.containsKey("cp")) { %>
                <span class="text-danger"><%= errores.get("cp") %></span>
              <% } %>
            </div>
            
            <div class="form-group">
              <button type="submit" class="btn btn-success">Guardar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    
  </body>
</html>
