<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.lopez.app.restaurante.models.Enum.*" %>

<%
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Formulario Alta Cliente</title>
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
          <h2>Formulario Alta Cliente</h2>
        </div>
      </div>

      <br>
      <% if (errors != null && !errors.isEmpty()) { %>
        <ul class="alert alert-danger mx-5 px-5">
          <% for (String e : errors.values()) { %>
            <li><%= e %></li>
          <% } %>
        </ul>
      <% } %>

      <div class="row">
        <form action="<%= request.getContextPath() %>/meseros/alta" method="post">
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
              <% if (errors != null && errors.containsKey("nombre")) { %>
                <span class="text-danger"><%= errors.get("nombre") %></span>
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
              <% if (errors != null && errors.containsKey("apPaterno")) { %>
                <span class="text-danger"><%= errors.get("apPaterno") %></span>
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
              <% if (errors != null && errors.containsKey("apMaterno")) { %>
                <span class="text-danger"><%= errors.get("apMaterno") %></span>
              <% } %>
            </div>
            <div class="form-group">
              <label for="fechaNacimiento">Fecha Nacimiento</label>
              <input 
                type="date" 
                id="fechaNacimiento" 
                name="fechaNacimiento" 
                class="form-control" 
                value="<%= request.getParameter("fechaNacimiento") != null ? request.getParameter("fechaNacimiento") : "" %>"
              />
              <% if (errors != null && errors.containsKey("fechaNacimiento")) { %>
                <span class="text-danger"><%= errors.get("fechaNacimiento") %></span>
              <% } %>
            </div>
            <div class="form-group">
              <label for="telefono">Teléfono</label>
              <input
                type="text"
                id="telefono"
                name="telefono"
                class="form-control"
                value="<%= request.getParameter("telefono") != null ? request.getParameter("telefono") : "" %>"
              />
              <% if (errors != null && errors.containsKey("telefono")) { %>
                <span class="text-danger"><%= errors.get("telefono") %></span>
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
              <% if (errors != null && errors.containsKey("correo")) { %>
                <span class="text-danger"><%= errors.get("correo") %></span>
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
              <% if (errors != null && errors.containsKey("calle")) { %>
                <span class="text-danger"><%= errors.get("calle") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="numExterior">Número Exterior</label>
              <input
                type="number"
                id="numExterior"
                name="numExterior"
                class="form-control"
                value="<%= request.getParameter("numExterior") != null ? request.getParameter("numExterior") : "" %>"
              />
              <% if (errors != null && errors.containsKey("numExterior")) { %>
                <span class="text-danger"><%= errors.get("numExterior") %></span>
              <% } %>
            </div>
            <div class="form-group">
              <label for="numInterior">Número Interior</label>
              <input
                type="number"
                id="numInterior"
                name="numInterior"
                class="form-control"
                value="<%= request.getParameter("numInterior") != null ? request.getParameter("numInterior") : "" %>"
              />
              <% if (errors != null && errors.containsKey("numInterior")) { %>
                <span class="text-danger"><%= errors.get("numInterior") %></span>
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
              <% if (errors != null && errors.containsKey("colonia")) { %>
                <span class="text-danger"><%= errors.get("colonia") %></span>
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
              <% if (errors != null && errors.containsKey("ciudad")) { %>
                <span class="text-danger"><%= errors.get("ciudad") %></span>
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
                <% for (EnumEstado c : EnumEstado.values()) { %>
                  <option value="<%= c %>" <%= c.name().equals(request.getParameter("estado")) ? "selected" : "" %>><%= c %></option>
                <% } %>
              </select>
              <% if (errors != null && errors.containsKey("estado")) { %>
                <span class="text-danger"><%= errors.get("estado") %></span>
              <% } %>
            </div>

            <div class="form-group">
              <label for="cp">Código Postal</label>
              <input
                type="number"
                id="cp"
                name="cp"
                class="form-control"
                value="<%= request.getParameter("cp") != null ? request.getParameter("cp") : "" %>"
              />
              <% if (errors != null && errors.containsKey("cp")) { %>
                <span class="text-danger"><%= errors.get("cp") %></span>
              <% } %>
            </div>
            <div class="form-group">
                <label for="num_Empleado">Número de Empleado</label>
                <input
                    type="text"
                    id="num_Empleado"
                    name="num_Empleado"
                    class="form-control"
                    value="<%= request.getParameter("num_Empleado") != null ? request.getParameter("num_Empleado") : "" %>"
                />
                <% if (errors != null && errors.containsKey("num_Empleado")) { %>
                    <span class="text-danger"><%= errors.get("num_Empleado") %></span>
                <% } %>
            </div>

            <div class="form-group">
                <label for="edad">Edad</label>
                <input
                    type="number"
                    id="edad"
                    name="edad"
                    class="form-control"
                    value="<%= request.getParameter("edad") != null ? request.getParameter("edad") : "" %>"
                />
                <% if (errors != null && errors.containsKey("edad")) { %>
                    <span class="text-danger"><%= errors.get("edad") %></span>
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
