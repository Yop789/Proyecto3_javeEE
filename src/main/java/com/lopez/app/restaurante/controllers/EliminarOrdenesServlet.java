package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.service.IOrdenarService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.OrdenarService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.mail.search.OrTerm;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ordenes/eliminar")
public class EliminarOrdenesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IOrdenarService<Ordenar> service = new OrdenarService(conn);
        Map<String, String> errors = new HashMap<>();

        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        if (id > 0) {
            Optional<Ordenar> optional = service.getByID(id);
            if (optional.isPresent()) {
                try {
                    service.eliminar(id);
                    resp.sendRedirect(req.getContextPath() + "/ordenes/listar");
                    return;

                } catch (Exception e) {
                    errors.put("error",
                            "No se puede eliminar el orden debido a restricciones de integridad en la base de datos: "
                                    + e.getMessage());
                }

            } else {
                errors.put("error", "No se encontró el orden con ID: " + id);
            }

        } else {
            errors.put("error", "ID inválido o no proporcionado en la URL");
        }

        req.setAttribute("errors", errors);
        getServletContext().getRequestDispatcher("/ordenes/listar").forward(req, resp);
    }
}
