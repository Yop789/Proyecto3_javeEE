package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MeseroService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/platillos/eliminar")
public class EliminarPlatillosServelet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Platillo> service = new PlatilloService(conn);
        Map<String, String> errors = new HashMap<>();

        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        if (id > 0) {
            Optional<Platillo> optional = service.getByID(id);
            if (optional.isPresent()) {
                try {
                    service.eliminar(id);
                    resp.sendRedirect(req.getContextPath() + "/platillos/listar");
                    return;

                } catch (Exception e) {
                    errors.put("error",
                            "No se puede eliminar el platillo debido a restricciones de integridad en la base de datos: "
                                    + e.getMessage());
                }

            } else {
                errors.put("error", "No se encontró el platillo con ID: " + id);
            }

        } else {
            errors.put("error", "ID inválido o no proporcionado en la URL");
        }

        req.setAttribute("errors", errors);
        getServletContext().getRequestDispatcher("/platillos/listar").forward(req, resp);
    }

}
