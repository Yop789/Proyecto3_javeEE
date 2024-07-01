package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesero;

import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MeseroService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/meseros/eliminar")
public class EliminarMeseroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Mesero> service = new MeseroService(conn);
        Map<String, String> errors = new HashMap<>();

        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        if (id > 0) {
            Optional<Mesero> optional = service.getByID(id);
            if (optional.isPresent()) {
                try {
                    service.eliminar(id);
                    resp.sendRedirect(req.getContextPath() + "/meseros/listar");
                    return;

                } catch (Exception e) {
                    errors.put("error",
                            "No se puede eliminar el cliente debido a restricciones de integridad en la base de datos: "
                                    + e.getMessage());
                }

            } else {
                errors.put("error", "No se encontró el cliente con ID: " + id);
            }

        } else {
            errors.put("error", "ID inválido o no proporcionado en la URL");
        }

        req.setAttribute("errors", errors);
        getServletContext().getRequestDispatcher("/meseros/listar").forward(req, resp);
    }

}
