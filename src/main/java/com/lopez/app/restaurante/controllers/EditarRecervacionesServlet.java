package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Reservacio;
import com.lopez.app.restaurante.models.Enum.EnumReservacion;
import com.lopez.app.restaurante.service.ClienteService;
import com.lopez.app.restaurante.service.IReservasService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;
import com.lopez.app.restaurante.service.ReservasService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservaciones/editar")
public class EditarRecervacionesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Cliente> serviceCliente = new ClienteService(conn);
        IService<Mesa> serviceMesa = new MesaService(conn);

        List<Mesa> mesas = serviceMesa.lista();
        req.setAttribute("mesas", mesas);

        List<Cliente> clientes = serviceCliente.lista();
        req.setAttribute("clientes", clientes);
        Long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (Exception e) {
            id = 0L;
        }
        Reservacio reservacio = new Reservacio();
        if (id > 0) {
            IReservasService<Reservacio> service = new ReservasService(conn);
            Optional<Reservacio> optional = service.getByID(id);
            if (optional.isPresent()) {
                reservacio = optional.get();
                req.setAttribute("reservacio", reservacio);
                getServletContext().getRequestDispatcher("/EditarReservaciones.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro la reservación");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se debe enviar como parametro en la url");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");
        IReservasService<Reservacio> service = new ReservasService(conn);
        Map<String, String> errors = new HashMap<>();

        Long id_mesa = null;
        Long id_cliente = null;
        String estatus = req.getParameter("estatus");
        String fechaAReservarStr = req.getParameter("fecha_a_reservar");
        LocalDateTime fechaAReservar = null;

        try {
            id_mesa = Long.parseLong(req.getParameter("id_mesa"));
        } catch (NumberFormatException e) {
            errors.put("id_mesa", "Debe seleccionar una mesa válida");
        }

        try {
            id_cliente = Long.parseLong(req.getParameter("id_cliente"));
        } catch (NumberFormatException e) {
            errors.put("id_cliente", "Debe seleccionar un cliente válido");
        }

        try {
            fechaAReservar = LocalDateTime.parse(fechaAReservarStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        } catch (Exception e) {
            errors.put("fecha_a_reservar", "Debe seleccionar una fecha y hora válidas");
        }

        if (estatus == null || estatus.isBlank()) {
            errors.put("estatus", "El estatus es obligatorio");
        }

        if (errors.isEmpty()) {
            Reservacio reservacion = new Reservacio();
            reservacion.setId_mesa(id_mesa);
            reservacion.setId_cliente(id_cliente);
            reservacion.setFecha(LocalDate.now()); // Fecha actual
            reservacion.setFecha_a_reservar(fechaAReservar);
            reservacion.setEstatus(EnumReservacion.valueOf(estatus));

            Long id = Long.parseLong(req.getParameter("id"));
            reservacion.setId(id);

            service.guardar(reservacion);
            resp.sendRedirect(req.getContextPath() + "/reservaciones/listar");
        } else {
            req.setAttribute("errors", errors);
            doGet(req, resp);
        }
    }

}
