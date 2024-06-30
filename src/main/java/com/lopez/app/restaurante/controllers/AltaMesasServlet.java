package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Enum.EnumEstadoMesa;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mesas/alta")
public class AltaMesasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getServletContext().getRequestDispatcher("/AltaMesas.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Mesa> service = new MesaService(conn);
        Map<String, String> errors = new HashMap<>();

        // parametros
        // numMesa: 45
        // capacidad: 34
        // lugar: Es una mesa en frente de una vista esepcionante
        // estado: DISPONIBLE

        String numMesa = req.getParameter("numMesa");
        String capacidad = req.getParameter("capacidad");
        String lugar = req.getParameter("lugar");
        String estado = req.getParameter("estado");

        if (numMesa == null || numMesa.isEmpty()) {
            errors.put("numMesa", "El campo numMesa es obligatorio");
        }

        if (capacidad == null || capacidad.isEmpty()) {
            errors.put("capacidad", "El campo capacidad es obligatorio");
        }

        if (lugar == null || lugar.isEmpty()) {
            errors.put("lugar", "El campo lugar es obligatorio");
        }

        if (estado == null || estado.isEmpty()) {
            errors.put("estado", "El campo estado es obligatorio");
        }

        if (errors.isEmpty()) {
            try {
                Mesa mesa = new Mesa();
                mesa.setNum_mesa(Long.parseLong(numMesa));
                mesa.setCapacidad(Long.parseLong(capacidad));
                mesa.setLugar(lugar);
                mesa.setEstado(EnumEstadoMesa.valueOf(estado));
                service.guardar(mesa);
                resp.sendRedirect(req.getContextPath() + "/mesas/listar");
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage(), e.getCause());
            }

        } else {
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/AltaMesas.jsp").forward(req, resp);

        }

    }

}
