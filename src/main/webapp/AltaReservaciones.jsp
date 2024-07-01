<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>
<%@ page import="com.lopez.app.restaurante.models.Enum.*" %> 

<%
List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Alta de Reservación</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Alta de Reservación</h2>
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
            <form action="<%= request.getContextPath() %>/reservaciones/alta" method="post">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="id_mesa">Mesa</label>
                        <select id="id_mesa" name="id_mesa" class="form-control">
                            <option value="">---Seleccione una mesa---</option>
                            <% for (Mesa mesa : mesas) { %>
                                <option value="<%= mesa.getId_mesa() %>"><%= mesa.getNum_mesa() %> - <%= mesa.getCapacidad() %> personas</option>
                            <% } %>
                        </select>
                        <% if (errors != null && errors.containsKey("id_mesa")) { %>
                            <span class="text-danger"><%= errors.get("id_mesa") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="id_cliente">Cliente</label>
                        <select id="id_cliente" name="id_cliente" class="form-control">
                            <option value="">---Seleccione un cliente---</option>
                            <% for (Cliente cliente : clientes) { %>
                                <option value="<%= cliente.getId() %>"><%= cliente.getNombre() %> <%= cliente.getApPaterno() %> <%= cliente.getApMaterno() %></option>
                            <% } %>
                        </select>
                        <% if (errors != null && errors.containsKey("id_cliente")) { %>
                            <span class="text-danger"><%= errors.get("id_cliente") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="fecha_a_reservar">Fecha y Hora a Reservar</label>
                        <input type="datetime-local" id="fecha_a_reservar" name="fecha_a_reservar" class="form-control" />
                        <% if (errors != null && errors.containsKey("fecha_a_reservar")) { %>
                            <span class="text-danger"><%= errors.get("fecha_a_reservar") %></span>
                        <% } %>
                    </div>
                    <div class="form-group">
                    <label for="estatus">Estado de la Mesa</label>
                    <select
                        id="estatus"
                        name="estatus"
                        class="form-control"
                        aria-label="Default select example"
                    >
                        <option value="">---Selecciona el estado---</option>
                        <% for (EnumReservacion estado : EnumReservacion.values()) { %>
                        <option value="<%= estado %>" <%= estado.name().equals(request.getParameter("estatus")) ? "selected" : "" %>><%= estado %></option>
                        <% } %>
                    </select>
                    <% if (errors != null && errors.containsKey("estatus")) { %>
                        <span class="text-danger"><%= errors.get("estatus") %></span>
                    <% } %>
                    </div>
                    <%-- <div class="form-group">
                        <label for="estatus">Estatus</label>
                        <input type="text" id="estatus" name="estatus" class="form-control">
                    </div> --%>
                    

                    <div class="form-group">
                        <button type="submit" class="btn btn-success">Guardar Reservación</button>
                        <a href="<%= request.getContextPath() %>/reservaciones/listar" class="btn btn-secondary">Cancelar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
