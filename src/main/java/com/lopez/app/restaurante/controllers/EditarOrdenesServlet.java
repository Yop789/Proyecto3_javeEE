package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.service.IOrdenarService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;
import com.lopez.app.restaurante.service.MeseroService;
import com.lopez.app.restaurante.service.OrdenarService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ordenes/editar")
public class EditarOrdenesServlet extends HttpServlet {
    @Override
    protected void doGet(final HttpServletRequest req, final HttpServletResponse resp)
            throws ServletException, IOException {
        final Connection conn = (Connection) req.getAttribute("conn");

        final IOrdenarService<Ordenar> service = new OrdenarService(conn);
        long id;
        final IService<Mesa> serviceMesa = new MesaService(conn);
        final List<Mesa> mesas = serviceMesa.lista();

        final IService<Mesero> serviceMesero = new MeseroService(conn);
        final List<Mesero> clientes = serviceMesero.lista();

        req.setAttribute("mesas", mesas);
        req.setAttribute("meseros", clientes);

        try {
            id = Long.parseLong(req.getParameter("id"));

        } catch (final Exception e) {
            id = 0L;
        }

        Ordenar ordenar = new Ordenar();

        if (id > 0) {
            final Optional<Ordenar> optional = service.getByID(id);

            if (optional.isPresent()) {
                ordenar = optional.get();
                req.setAttribute("orden", ordenar);
                getServletContext().getRequestDispatcher("/EditarOrden.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro el orden");

            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se deve enviar como parametro en la url");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");

        IOrdenarService<Ordenar> service = new OrdenarService(conn);
        Map<String, String> errors = new HashMap<>();

        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (Exception e) {
            id = 0L;
        }

        Long idMesa = Long.parseLong(req.getParameter("id_mesa"));
        Long idMesero = Long.parseLong(req.getParameter("id_mesero"));
        String fecha = req.getParameter("fecha");
        LocalDateTime fechaAReservar = null;
        try {
            fechaAReservar = LocalDateTime.parse(fecha, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        } catch (Exception e) {
            errors.put("fecha_a_reservar", "Debe seleccionar una fecha y hora válidas");
        }

        // Crear objeto Ordenar con los datos actualizados
        Ordenar orden = new Ordenar();
        orden.setId(id);
        orden.setId_mesa(idMesa);
        orden.setId_mesero(idMesero);
        orden.setFecha(fechaAReservar);

        // Actualizar la orden en la base de datos
        try {
            service.guardar(orden);
            resp.sendRedirect(req.getContextPath() + "/ordenes/listar");
        } catch (Exception e) {
            errors.put("error", e.getMessage());
            getServletContext().getRequestDispatcher("/EditarOrden.jsp").forward(req, resp);

        }

    }

}
