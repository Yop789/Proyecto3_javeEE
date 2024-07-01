package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MeseroService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/meseros/detalle")
public class DetalleMeseroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        IService<Mesero> service = new MeseroService(conn);
        long id;

        try {
            id = Long.parseLong(req.getParameter("id"));

        } catch (Exception e) {
            id = 0L;
        }

        Mesero mesero = new Mesero();

        if (id > 0) {
            Optional<Mesero> optional = service.getByID(id);

            if (optional.isPresent()) {
                mesero = optional.get();
                req.setAttribute("mesero", mesero);
                getServletContext().getRequestDispatcher("/DetallerMesero.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro el mesero");

            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se deve enviar como parametro en la url");
        }

    }

}
