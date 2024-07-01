<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.Enum.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
Platillo platillo = (Platillo) request.getAttribute("platillo");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Platillo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="Header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-12">
            <h2>Editar Platillo</h2>
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
        <form action="<%= request.getContextPath() %>/platillos/editar" method="post">
            <input type="hidden" name="id" value="<%= platillo != null ? platillo.getId() : ""  %>">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" name="nombre" class="form-control" value="<%= platillo != null ? platillo.getNombre():"" %>">
                    <% if (errors != null && errors.containsKey("nombre")) { %>
                        <span class="text-danger"><%= errors.get("nombre") %></span>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="precio">Precio</label>
                    <input type="text" id="precio" name="precio" class="form-control" value="<%= platillo != null ?platillo.getPrecio():"" %>">
                    <% if (errors != null && errors.containsKey("precio")) { %>
                        <span class="text-danger"><%= errors.get("precio") %></span>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea id="descripcion" name="descripcion" class="form-control" rows="3"><%=platillo != null ? platillo.getDescripcion():"" %></textarea>
                    <% if (errors != null && errors.containsKey("descripcion")) { %>
                        <span class="text-danger"><%= errors.get("descripcion") %></span>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="estatus">Estatus</label>
                    <select id="estatus" name="estatus" class="form-control">
                        <option value="">---Selecciona el estatus---</option>
                        <% for (EnumEstatusPlatillo status : EnumEstatusPlatillo.values()) { %>
                            <option value="<%= status %>" <%= status == platillo.getEstatus() ? "selected" : "" %>><%= status %></option>
                        <% } %>
                    </select>
                    <% if (errors != null && errors.containsKey("estatus")) { %>
                        <span class="text-danger"><%= errors.get("estatus") %></span>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Actualizar</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
