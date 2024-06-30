package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Enum.EnumEstadoMesa;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mesas/editar")
public class EditarMesaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Mesa> service = new MesaService(conn);

        long id;

        try {
            id = Long.parseLong(req.getParameter("id"));

        } catch (Exception e) {
            id = 0L;
        }

        Mesa mesa = new Mesa();

        if (id > 0) {
            Optional<Mesa> optional = service.getByID(id);

            if (optional.isPresent()) {
                mesa = optional.get();
                req.setAttribute("mesa", mesa);
                getServletContext().getRequestDispatcher("/EditarMesa.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro la mesa");
            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se debe enviar como parametro en la url");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");
        IService<Mesa> service = new MesaService(conn);
        Map<String, String> errors = new HashMap<>();

        String nombre = req.getParameter("numMesa");
        String capacidad = req.getParameter("capacidad");
        String lugar = req.getParameter("lugar");
        String estado = req.getParameter("estado");

        long id = 0;
        try {
            String idParem = req.getParameter("id");
            if (idParem != null && !idParem.isEmpty()) {
                id = Long.parseLong(idParem);
            }
        } catch (Exception e) {
            errors.put("id", "Error de conversion");
        }

        if (nombre == null || nombre.isEmpty()) {
            errors.put("nombre", "El nombre es obligatorio");
        }
        if (capacidad == null || capacidad.isEmpty()) {
            errors.put("capacidad", "La capacidad es obligatoria");
        }
        if (lugar == null || lugar.isEmpty()) {
            errors.put("lugar", "El lugar es obligatorio");
        }
        if (estado == null || estado.isEmpty()) {
            errors.put("estado", "El estado es obligatorio");
        }

        Mesa mesa = new Mesa();
        mesa.setId_mesa(id);
        mesa.setNum_mesa(Long.parseLong(nombre));
        mesa.setCapacidad(Long.parseLong(capacidad));
        mesa.setLugar(lugar);
        mesa.setEstado(EnumEstadoMesa.valueOf(estado));

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/EditarMesa.jsp").forward(req, resp);
        } else {
            service.guardar(mesa);
            resp.sendRedirect(req.getContextPath() + "/mesas/listar");
        }

    }

}
