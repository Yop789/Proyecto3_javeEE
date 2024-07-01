package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.models.Enum.EnumEstatusPlatillo;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/platillos/alta")
public class AltaPlatillosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/AltaPlatillo.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Platillo> service = new PlatilloService(conn);

        String nombre = req.getParameter("nombre");
        String precioParam = req.getParameter("precio");
        String descripcion = req.getParameter("descripcion");
        String estatus = req.getParameter("estatus");

        Float precio = 0.0f;

        Map<String, String> errors = new HashMap<>();

        Long id = null;
        try {
            String idParam = req.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                id = Long.parseLong(idParam);
            }
        } catch (NumberFormatException e) {
            errors.put("id", "El ID debe ser un número válido");
        }

        if (nombre == null || nombre.isEmpty()) {
            errors.put("nombre", "El nombre es requerido");
        }

        if (precioParam == null || precioParam.isEmpty()) {
            errors.put("precio", "El precio es requerido");
        } else {
            try {
                precio = Float.parseFloat(precioParam);
            } catch (NumberFormatException e) {
                errors.put("precio", "El precio debe ser un número válido");
            }
        }

        if (descripcion == null || descripcion.isEmpty()) {
            errors.put("descripcion", "La descripción es requerida");
        }

        if (estatus == null || estatus.isEmpty()) {
            errors.put("estatus", "El estatus es requerido");
        }

        if (errors.isEmpty()) {
            Platillo platillo = new Platillo();
            platillo.setNombre(nombre);
            platillo.setPrecio(precio);
            platillo.setDescripcion(descripcion);
            platillo.setEstatus(EnumEstatusPlatillo.valueOf(estatus));
            service.guardar(platillo);
            resp.sendRedirect(req.getContextPath() + "/platillos/listar");
        } else {
            req.setAttribute("errors", errors);

            getServletContext().getRequestDispatcher("/AltaPlatillo.jsp").forward(req, resp);
        }
    }
}
