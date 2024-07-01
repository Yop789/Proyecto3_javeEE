package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.OrdenarService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ordenes/detalle")
public class DetalleOrdenarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        IService<Ordenar> service = new OrdenarService(conn);

        long id;

        try {
            id = Long.parseLong(req.getParameter("id"));

        } catch (Exception e) {
            id = 0L;
        }

        Ordenar ordenar = new Ordenar();

        if (id > 0) {
            Optional<Ordenar> optional = service.getByID(id);

            if (optional.isPresent()) {
                ordenar = optional.get();
                req.setAttribute("orden", ordenar);
                getServletContext().getRequestDispatcher("/DetalleOrden.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro la mesa");
            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se debe enviar como parametro en la url");
        }
    }
}
