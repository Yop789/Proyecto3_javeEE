<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>
<%@ page import="com.lopez.app.restaurante.models.Enum.*" %> 

<%
List<Platillo> platillo = (List<Platillo>) request.getAttribute("platillos");
List<Ordenar> ordenars = (List<Ordenar>) request.getAttribute("ordenars");
List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
List<Mesero> meseros = (List<Mesero>) request.getAttribute("meseros");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Alta de Descripciones Orden</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Alta de Descripciones Orden</h2>
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
            <form action="<%= request.getContextPath() %>/ordenes/alta" method="post">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="id_mesa">Mesa</label>
                        <select id="id_mesa" name="id_mesa" class="form-control">
                            <option value="">---Seleccione una mesa---</option>
                            <% for (Mesa mesa : mesas) { %>
                                <option value="<%= mesa.getId_mesa() %>">Numero de mesa: <%= mesa.getNum_mesa() %> capacidad: <%= mesa.getCapacidad() %> descripcion: <%= mesa.getLugar()%></option>
                            <% } %>
                        </select>
                        <% if (errors != null && errors.containsKey("id_mesa")) { %>
                            <span class="text-danger"><%= errors.get("id_mesa") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="id_mesero">mesero</label>
                        <select id="id_mesero" name="id_mesero" class="form-control">
                            <option value="">---Seleccione un mesero---</option>
                            <% for (Mesero mesero : meseros) { %>
                                <option value="<%= mesero.getId() %>"><%= mesero.getNombre() %> <%= mesero.getApPaterno() %> <%= mesero.getApMaterno() %></option>
                            <% } %>
                        </select>
                        <% if (errors != null && errors.containsKey("id_mesero")) { %>
                            <span class="text-danger"><%= errors.get("id_mesero") %></span>
                        <% } %>
                    </div>                  

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
