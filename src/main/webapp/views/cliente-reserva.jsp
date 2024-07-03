<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="com.lopez.app.restaurante.models.*" %>
<%@page import="com.lopez.app.restaurante.models.Enum.*" %>

<%
List<Mesa> mesas = (List<Mesa>) request.getAttribute("mesas");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Formulario Alta Cliente</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://www.paypal.com/sdk/js?client-id=AV0ck_Ct1X9jmj9gf-nGV-uCygB7W4NvT844h0LZL2AzvSZhzwAsGzJix1snLt2nadchaw9wa7tcbInz&buyer-country=US&currency=USD&components=buttons&enable-funding=venmo" data-sdk-integration-source="developer-studio"></script>
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

      <div class="row">
        <form id="clienteForm">
          <div class="col-md-12">
            <div class="form-group">
              <label for="id_mesa">Mesa</label>
              <select id="id_mesa" name="id_mesa" class="form-control">
                <option value="">---Seleccione una mesa---</option>
                <% for (Mesa mesa : mesas) { %>
                  <option value="<%= mesa.getId_mesa() %>">Numero de mesa: <%= mesa.getNum_mesa() %> capacidad: <%= mesa.getCapacidad() %> descripcion: <%= mesa.getLugar()%></option>
                <% } %>
              </select>
              <span class="text-danger" id="error-id_mesa"></span>
            </div>
            <div class="form-group">
              <label for="fecha_a_reservar">Fecha y Hora a Reservar</label>
              <input type="datetime-local" id="fecha_a_reservar" name="fecha_a_reservar" class="form-control" />
              <span class="text-danger" id="error-fecha_a_reservar"></span>
            </div>
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" id="nombre" name="nombre" class="form-control" />
              <span class="text-danger" id="error-nombre"></span>
            </div>
            <div class="form-group">
              <label for="apPaterno">Apellido Paterno</label>
              <input type="text" id="apPaterno" name="apPaterno" class="form-control" />
              <span class="text-danger" id="error-apPaterno"></span>
            </div>
            <div class="form-group">
              <label for="apMaterno">Apellido Materno</label>
              <input type="text" id="apMaterno" name="apMaterno" class="form-control" />
              <span class="text-danger" id="error-apMaterno"></span>
            </div>
            <div class="form-group">
              <label for="fechaNacimiento">Fecha Nacimiento</label>
              <input type="date" id="fechaNacimiento" name="fechaNacimiento" class="form-control" />
              <span class="text-danger" id="error-fechaNacimiento"></span>
            </div>
            <div class="form-group">
              <label for="telefono">Teléfono</label>
              <input type="text" id="telefono" name="telefono" class="form-control" />
              <span class="text-danger" id="error-telefono"></span>
            </div>
            <div class="form-group">
              <label for="correo">Correo</label>
              <input type="text" id="correo" name="correo" class="form-control" />
              <span class="text-danger" id="error-correo"></span>
            </div>
            <div class="form-group">
              <label for="calle">Calle</label>
              <input type="text" id="calle" name="calle" class="form-control" />
              <span class="text-danger" id="error-calle"></span>
            </div>
            <div class="form-group">
              <label for="numExterior">Número Exterior</label>
              <input type="number" id="numExterior" name="numExterior" class="form-control" />
              <span class="text-danger" id="error-numExterior"></span>
            </div>
            <div class="form-group">
              <label for="numInterior">Número Interior (Opcional)</label>
              <input type="number" id="numInterior" name="numInterior" class="form-control" />
              <span class="text-danger" id="error-numInterior"></span>
            </div>
            <div class="form-group">
              <label for="colonia">Colonia</label>
              <input type="text" id="colonia" name="colonia" class="form-control" />
              <span class="text-danger" id="error-colonia"></span>
            </div>
            <div class="form-group">
              <label for="ciudad">Ciudad</label>
              <input type="text" id="ciudad" name="ciudad" class="form-control" />
              <span class="text-danger" id="error-ciudad"></span>
            </div>
            <div class="form-group">
              <label for="estado">Estado</label>
              <select id="estado" name="estado" class="form-control" aria-label="Default select example">
                <option value="">---selecciona un estado de México---</option>
                <% for (EnumEstado c : EnumEstado.values()) { %>
                  <option value="<%= c %>" <%= c.name().equals(request.getParameter("estado")) ? "selected" : "" %>><%= c %></option>
                <% } %>
              </select>
              <span class="text-danger" id="error-estado"></span>
            </div>
            <div class="form-group">
              <label for="cp">Código Postal</label>
              <input type="number" id="cp" name="cp" class="form-control" />
              <span class="text-danger" id="error-cp"></span>
            </div>
            <div class="form-group">
              <input type="hidden" id="ordenToken" name="ordenToken" class="form-control" />
            </div>
            <div class="form-group">
              <label for="">Debes de pagar 10 dólares para realisar la recervacion</label>
              prueva 
              correo:sb-xj29q31448825@personal.example.com
              Contraseña:8H8rj6$r

              <div id="paypal-button-container"></div>
              <button type="button" id="guardarBtn" class="btn btn-success">Guardar</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <script>
      paypal.Buttons({
        style: {
          disableMaxWidth: true,
        },
        createOrder: function (data, actions) {
          return actions.order.create({
            purchase_units: [
              {
                amount: {
                  value: "10.00", 
                },
              },
            ],
          });
        },
        onApprove: function (data, actions) {
          $("#ordenToken").val(data.orderID);
        },
        onError: function (err) {
          console.error("Error durante el pago:", err);
        },
      }).render("#paypal-button-container");

      $(document).ready(function () {
        // Función para validar campos antes de permitir el envío del formulario
        function validarCampos() {
          var formValido = true;
          $(".form-control").each(function () {
            if ($(this).attr("id") !== "numInterior" && $(this).val().trim() === "") {
              formValido = false;
              $("#error-" + $(this).attr("id")).text("Este campo es obligatorio");
            } else {
              $("#error-" + $(this).attr("id")).text("");
            }
          });
          return formValido;
        }

        // Habilitar o deshabilitar botón basado en la validación de campos

        $("#guardarBtn").click(function () {
          if (validarCampos()) {
            var formData = $("#clienteForm").serialize();
            $.ajax({
              type: "POST",
              url: "http://localhost:8080/ApiRestaurante/altaReservacion", 
              data: formData,
              success: function (response) {
                
                window.location.href = "<%= request.getContextPath() %>/reservaciones/detalle?id="+response.reservacionId;
                
              }, error: function (xhr, status, error) {
                
              }
            });
          } else {
            alert("Por favor, completa todos los campos obligatorios y page los 10 Dólares para poder recervar");
          }
        });
      });
    </script>
  </body>
</html>
