<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>
<%@ page import="com.lopez.app.restaurante.models.Enum.*" %> 

<%
List<Platillo> platillos = (List<Platillo>) request.getAttribute("platillos");
List<Ordenar> ordenars = (List<Ordenar>) request.getAttribute("ordenars");
Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <div class="col-md-12">
                
                <div class="form-group">
                    <label for="id_Orden">Ordenes</label>
                    <select id="id_Orden" name="id_Orden" class="form-control">
                        <option value="">---Seleccione un orden---</option>
                        <% for (Ordenar ordenar : ordenars) { %>
                            <option value="<%= ordenar.getId() %>">Num. Orden <%= ordenar.getId() %> Num. Mesa<%= ordenar.getId_mesero() %> Fecha: <%= ordenar.getFecha() %> </option>
                        <% } %>
                    </select>
                </div>
            
                <div class="form-group">
                    <label for="id_platillo">Platillo</label>
                    <select id="id_platillo" name="id_platillo" class="form-control">
                        <option value="">---Seleccione un platillo---</option>
                        <% for (Platillo platillo : platillos) { %>
                            <option value="<%= platillo.getId() %>"><%= platillo.getNombre() %> $<%= platillo.getPrecio() %>  </option>
                        <% } %>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="cantidad">Cantidad</label>
                    <input type="number" id="cantidad" name="cantidad" class="form-control" />
                </div>
                
                <div class="form-group">
                    <button type="button" id="agregarPlatillo" class="btn btn-success">Agregar Platillo</button>
                </div>
            
            </div>
            
            <div class="col-md-12">
                <h3>Platillos Seleccionados</h3>
                <table id="tablaPlatillos" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Platillo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyPlatillos">
                        <!-- Aquí se agregarán dinámicamente las filas de platillos -->
                    </tbody>
                </table>
            </div>

            <div class="col-md-12">
                <div class="form-group">
                    <button type="button" id="enviarOrden" class="btn btn-primary">Enviar Orden</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        var platillosSeleccionados = [];

        $('#agregarPlatillo').click(function() {
            var idPlatillo = $('#id_platillo').val();
            var nombrePlatillo = $('#id_platillo option:selected').text();
            var cantidad = $('#cantidad').val();

            if (idPlatillo && cantidad) {
                var platillo = {
                    idPlatillo: idPlatillo,
                    nombrePlatillo: nombrePlatillo,
                    cantidad: cantidad
                };
                platillosSeleccionados.push(platillo);
                actualizarTablaPlatillos();
                limpiarFormulario();
            } else {
                alert('Seleccione un platillo y especifique la cantidad.');
            }
        });

        function actualizarTablaPlatillos() {
            $('#tbodyPlatillos').empty();
            for (var i = 0; i < platillosSeleccionados.length; i++) {
                var platillo = platillosSeleccionados[i];
                $('#tbodyPlatillos').append('<tr><td>' + platillo.nombrePlatillo + '</td><td>' + platillo.cantidad + '</td></tr>');
            }
        }

        function limpiarFormulario() {
            $('#id_platillo').val('');
            $('#cantidad').val('');
        }

        $('#enviarOrden').click(function() {
            if (platillosSeleccionados.length > 0) {
                // Preparar los datos para enviar mediante AJAX
                var ordenData = {
                    idOrden: $('#id_Orden').val(),
                    platillos: platillosSeleccionados
                };

                // Realizar la llamada AJAX
                $.ajax({
                    type: 'POST',
                    url: 'http://localhost:8080/ApiRestaurante/descripciones/alta', // URL de tu API REST para crear órdenes
                    contentType: 'application/json',
                    data: JSON.stringify(ordenData),
                    success: function(response) {
                        window.location.href = "http://localhost:8080/UnPractica/descripciones/listar";
                    },
                    error: function(xhr, status, error) {
                        alert('Error al enviar la orden.');
                        console.error(error);
                    }
                });
            } else {
                alert('Agregue al menos un platillo antes de enviar la orden.');
            }
        });
    });
    </script>

</body>
</html>
