package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.service.IOrdenarService;

import com.lopez.app.restaurante.service.OrdenarService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ordenes/listar")
public class ListarOrdenesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");

        IOrdenarService<Ordenar> ordenarService = new OrdenarService(conn);
        List<Ordenar> ordenes = ordenarService.lista();

        for (Ordenar orden : ordenes) {
            resp.getWriter().println(
                    "<h1>" + orden.getId() + "->"
                            + orden.getFecha() + "->" + orden.getFecha() + "</h1>");
        }

    }

}
