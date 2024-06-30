<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %> 
<%@ page import="com.lopez.app.restaurante.models.Enum.*" %> 

<%
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Formulario Alta Mesa</title>
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
          <h2>Formulario Alta Mesa</h2>
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
        <form action="<%= request.getContextPath() %>/mesas/alta" method="post">
          <div class="col-md-12">
            <div class="form-group">
              <label for="numMesa">Número de Mesa</label>
              <input
                type="number"
                id="numMesa"
                name="numMesa"
                class="form-control"
                value="<%= request.getParameter("numMesa") != null ? request.getParameter("numMesa") : "" %>"
              />
              <% if (errors != null && errors.containsKey("numMesa")) { %>
                <span class="text-danger"><%= errors.get("numMesa") %></span>
              <% } %>
            </div>
            
            <div class="form-group">
              <label for="capacidad">Capacidad</label>
              <input
                type="number"
                id="capacidad"
                name="capacidad"
                class="form-control"
                value="<%= request.getParameter("capacidad") != null ? request.getParameter("capacidad") : "" %>"
              />
              <% if (errors != null && errors.containsKey("capacidad")) { %>
                <span class="text-danger"><%= errors.get("capacidad") %></span>
              <% } %>
            </div>
            
            <div class="form-group">
              <label for="lugar">Lugar</label>
              <label for="lugar">Descripción</label>
              <textarea
                id="lugar"
                name="lugar"
                class="form-control"
                rows="3"
              ><%= request.getParameter("lugar") != null ? request.getParameter("lugar") : "" %></textarea>
              <% if (errors != null && errors.containsKey("lugar")) { %>
                <span class="text-danger"><%= errors.get("lugar") %></span>
              <% } %>
            </div>
            
            <div class="form-group">
              <label for="estado">Estado de la Mesa</label>
              <select
                id="estado"
                name="estado"
                class="form-control"
                aria-label="Default select example"
              >
                <option value="">---Selecciona el estado---</option>
                <% for (EnumEstadoMesa estado : EnumEstadoMesa.values()) { %>
                  <option value="<%= estado %>" <%= estado.name().equals(request.getParameter("estado")) ? "selected" : "" %>><%= estado %></option>
                <% } %>
              </select>
              <% if (errors != null && errors.containsKey("estado")) { %>
                <span class="text-danger"><%= errors.get("estado") %></span>
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
