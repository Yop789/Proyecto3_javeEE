package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.Reservacio;
import com.lopez.app.restaurante.service.IReservasService;
import com.lopez.app.restaurante.service.ReservasService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservas/listar")
public class ListarReservasServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IReservasService<Reservacio> mesaService = new ReservasService(conn);

        List<Reservacio> mesas = mesaService.lista();
        for (Reservacio mesa : mesas) {
            resp.getWriter().println(
                    "<h1>" + mesa.getId() + "->"
                            + mesa.getFecha() + "->" + mesa.getFecha_a_reservar() + "</h1>");
        }
    }

}
