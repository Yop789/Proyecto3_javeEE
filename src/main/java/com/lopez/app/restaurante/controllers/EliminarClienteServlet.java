package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.service.ClienteService;
import com.lopez.app.restaurante.service.IService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clientes/eliminar")
public class EliminarClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Cliente> service = new ClienteService(conn);
        Map<String, String> errors = new HashMap<>();

        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        if (id > 0) {
            Optional<Cliente> optional = service.getByID(id);
            if (optional.isPresent()) {
                try {
                    service.eliminar(id);
                    resp.sendRedirect(req.getContextPath() + "/clientes/listar");
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
        getServletContext().getRequestDispatcher("/clientes/listar").forward(req, resp);
    }

}
