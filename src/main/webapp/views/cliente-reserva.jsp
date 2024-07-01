<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>
<%@page import="com.lopez.app.restaurante.models.Enum.*" %>

<%
List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
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

    <script
      src="https://www.paypal.com/sdk/js?client-id=AV0ck_Ct1X9jmj9gf-nGV-uCygB7W4NvT844h0LZL2AzvSZhzwAsGzJix1snLt2nadchaw9wa7tcbInz&buyer-country=US&currency=USD&components=buttons&enable-funding=venmo"
      data-sdk-integration-source="developer-studio"
    ></script>

  </head>
  <body>
    <%@ include file="../Header.jsp" %>

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
        <form action="<%= request.getContextPath() %>/clientes/alta" method="post">
          <div class="col-md-12">

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
                        <label for="fecha_a_reservar">Fecha y Hora a Reservar</label>
                        <input type="datetime-local" id="fecha_a_reservar" name="fecha_a_reservar" class="form-control" />
                        <% if (errors != null && errors.containsKey("fecha_a_reservar")) { %>
                            <span class="text-danger"><%= errors.get("fecha_a_reservar") %></span>
                        <% } %>
                    </div>
            
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
            <div id="paypal-button-container"></div>
              <button type="submit" class="btn btn-success">Guardar</button>
            </div>
           


          </div>
        </form>
      </div>
    </div>
    <script>
      paypal
        .Buttons({
            style: {
                disableMaxWidth: true,
            },
          createOrder: function (data, actions) {
            // Configurar el pedido
            return actions.order.create({
              purchase_units: [
                {
                  amount: {
                    value: "10.00", // El valor del pedido
                  },
                },
              ],
            });
          },
          onApprove: function (data, actions) {
            // Capturar el pedido cuando el usuario apruebe el pago
            return actions.order.capture().then(function (details) {
              alert("Pago completado por " + details.payer.name.given_name);
            });
          },
          onError: function (err) {
            // Manejar errores
            console.error("Error durante el pago:", err);
          },
        })
        
        .render("#paypal-button-container"); // Renderizar el botón en el div con id paypal-button-container
    </script>

  </body>
</html>
