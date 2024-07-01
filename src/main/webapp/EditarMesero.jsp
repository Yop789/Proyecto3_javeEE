<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.Enum.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>

<%
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
Mesero mesero = (Mesero) request.getAttribute("mesero");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Editar Mesero</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="Header.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <h2>Editar Mesero</h2>
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
            <form action="<%= request.getContextPath() %>/meseros/editar" method="post">
                <input type="hidden" name="id" value="<%= mesero != null ? mesero.getId() : "" %>" />
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" value="<%= mesero != null ? mesero.getNombre() : "" %>" />
                        <% if (errors != null && errors.containsKey("nombre")) { %>
                        <span class="text-danger"><%= errors.get("nombre") %></span>
                        <% } %>
                    </div>

                    

                    <div class="form-group">
                        <label for="apPaterno">Apellido Paterno</label>
                        <input type="text" id="apPaterno" name="apPaterno" class="form-control" value="<%= mesero != null ? mesero.getApPaterno() : "" %>" />
                        <% if (errors != null && errors.containsKey("apPaterno")) { %>
                        <span class="text-danger"><%= errors.get("apPaterno") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="apMaterno">Apellido Materno</label>
                        <input type="text" id="apMaterno" name="apMaterno" class="form-control" value="<%= mesero != null ? mesero.getApMaterno() : "" %>" />
                        <% if (errors != null && errors.containsKey("apMaterno")) { %>
                        <span class="text-danger"><%= errors.get("apMaterno") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="fechaNacimiento">Fecha de Nacimiento</label>
                        <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" value="<%= mesero != null && mesero.getFecha_nacimiento() != null ? mesero.getFecha_nacimiento().toString() : "" %>" />
                        <% if (errors != null && errors.containsKey("fechaNacimiento")) { %>
                        <span class="text-danger"><%= errors.get("fechaNacimiento") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" id="telefono" name="telefono" class="form-control" value="<%= mesero != null ? mesero.getTelefono() : "" %>" />
                        <% if (errors != null && errors.containsKey("telefono")) { %>
                        <span class="text-danger"><%= errors.get("telefono") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo</label>
                        <input type="text" id="correo" name="correo" class="form-control" value="<%= mesero != null ? mesero.getCorreo() : "" %>" />
                        <% if (errors != null && errors.containsKey("correo")) { %>
                        <span class="text-danger"><%= errors.get("correo") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="calle">Calle</label>
                        <input type="text" id="calle" name="calle" class="form-control" value="<%= mesero != null ? mesero.getCalle() : "" %>" />
                        <% if (errors != null && errors.containsKey("calle")) { %>
                        <span class="text-danger"><%= errors.get("calle") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="numExterior">Número Exterior</label>
                        <input type="number" id="numExterior" name="numExterior" class="form-control" value="<%= mesero != null ? mesero.getNum_exterior() : "" %>" />
                        <% if (errors != null && errors.containsKey("numExterior")) { %>
                        <span class="text-danger"><%= errors.get("numExterior") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="numInterior">Número Interior</label>
                        <input type="number" id="numInterior" name="numInterior" class="form-control" value="<%= mesero != null ? mesero.getNum_interior() : "" %>" />
                        <% if (errors != null && errors.containsKey("numInterior")) { %>
                        <span class="text-danger"><%= errors.get("numInterior") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="colonia">Colonia</label>
                        <input type="text" id="colonia" name="colonia" class="form-control" value="<%= mesero != null ? mesero.getColonia() : "" %>" />
                        <% if (errors != null && errors.containsKey("colonia")) { %>
                        <span class="text-danger"><%= errors.get("colonia") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="ciudad">Ciudad</label>
                        <input type="text" id="ciudad" name="ciudad" class="form-control" value="<%= mesero != null ? mesero.getCiudad() : "" %>" />
                        <% if (errors != null && errors.containsKey("ciudad")) { %>
                        <span class="text-danger"><%= errors.get("ciudad") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="estado">Estado</label>
                        <select id="estado" name="estado" class="form-control" aria-label="Default select example">
                            <option value="">---Selecciona un estado---</option>
                            <% for (EnumEstado c : EnumEstado.values()) { %>
                            <option value="<%= c %>" <%= mesero != null && mesero.getEstado() != null && c.name().equals(mesero.getEstado().name()) ? "selected" : "" %>><%= c %></option>
                            <% } %>
                        </select>
                        <% if (errors != null && errors.containsKey("estado")) { %>
                        <span class="text-danger"><%= errors.get("estado") %></span>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="cp">Código Postal</label>
                        <input type="number" id="cp" name="cp" class="form-control" value="<%= mesero != null ? mesero.getCp() : "" %>" />
                        <% if (errors != null && errors.containsKey("cp")) { %>
                        <span class="text-danger"><%= errors.get("cp") %></span>
                        <% } %>
                    </div>
                    <!-- Aquí se agrega el campo num_Empleado -->
                    <div class="form-group">
                        <label for="numEmpleado">Número de Empleado</label>
                        <input type="text" id="numEmpleado" name="numEmpleado" class="form-control" value="<%= mesero != null ? mesero.getNum_Empleado() : "" %>" />
                        <% if (errors != null && errors.containsKey("numEmpleado")) { %>
                        <span class="text-danger"><%= errors.get("numEmpleado") %></span>
                        <% } %>
                    </div>

                    <!-- Aquí se agrega el campo edad -->
                    <div class="form-group">
                        <label for="edad">Edad</label>
                        <input type="number" id="edad" name="edad" class="form-control" value="<%= mesero != null ? mesero.getEdad() : "" %>" />
                        <% if (errors != null && errors.containsKey("edad")) { %>
                        <span class="text-danger"><%= errors.get("edad") %></span>
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
