<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.lopez.app.restaurante.models.*" %>

<%
// Recuperamos la orden a editar y los errores del request
Ordenar orden = (Ordenar) request.getAttribute("orden");
List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
List<Mesero> meseros = (List<Mesero>) request.getAttribute("meseros");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Editar Orden</title>
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
            <h2>Editar Orden</h2>
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
        <form action="<%= request.getContextPath() %>/ordenes/editar" method="post">
            <input type="hidden" name="id" value="<%= orden.getId() %>">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="id_mesa">Mesa</label>
                    <select id="id_mesa" name="id_mesa" class="form-control">
                        <option value="">---Seleccione una mesa---</option>
                        <% for (Mesa mesa : mesas) { %>
                        <option value="<%= mesa.getId_mesa() %>" <%= mesa.getId_mesa().equals(orden.getId_mesa()) ? "selected" : "" %>><%= mesa.getNum_mesa() %> - <%= mesa.getCapacidad() %> personas</option>
                        <% } %>
                    </select>
                    <% if (errors != null && errors.containsKey("id_mesa")) { %>
                    <span class="text-danger"><%= errors.get("id_mesa") %></span>
                    <% } %>
                </div>

                <div class="form-group">
                    <label for="id_mesero">Mesero</label>
                    <select id="id_mesero" name="id_mesero" class="form-control">
                        <option value="">---Seleccione un mesero---</option>
                        <% for (Mesero mesero : meseros) { %>
                        <option value="<%= mesero.getId() %>" <%= mesero.getId().equals(orden.getId_mesero()) ? "selected" : "" %>><%= mesero.getNombre() %> <%= mesero.getApPaterno() %> <%= mesero.getApMaterno() %></option>
                        <% } %>
                    </select>
                    <% if (errors != null && errors.containsKey("id_mesero")) { %>
                    <span class="text-danger"><%= errors.get("id_mesero") %></span>
                    <% } %>
                </div>

                <div class="form-group">
                    <label for="fecha">Fecha</label>
                    <input type="text"  id="fecha" name="fecha"  class="form-control"
                        value="<%= orden.getFecha() %>" >
                    
                    <% if (errors != null && errors.containsKey("fecha")) { %>
                    <span class="text-danger"><%= errors.get("fecha") %></span>
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
