package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;

import com.lopez.app.restaurante.models.Reservacio;
import com.lopez.app.restaurante.service.IReservasService;
import com.lopez.app.restaurante.service.ReservasService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservaciones/eliminar")
public class EliminarReservacionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection con = (Connection) req.getAttribute("conn");
        Long id = Long.parseLong(req.getParameter("id"));
        IReservasService<Reservacio> reservasService = new ReservasService(con);
        Map<String, String> errors = new HashMap<>();

        try {
            reservasService.eliminar(id);
            resp.sendRedirect(req.getContextPath() + "/reservaciones/listar");

        } catch (Exception e) {
            errors.put("error",
                    "No se puede eliminar la reservación debido a restricciones de integridad en la base de datos: "
                            + e.getMessage());

            req.setAttribute("errors", errors);

            getServletContext().getRequestDispatcher("/reservaciones/listar").forward(req, resp);
        }

    }

}
