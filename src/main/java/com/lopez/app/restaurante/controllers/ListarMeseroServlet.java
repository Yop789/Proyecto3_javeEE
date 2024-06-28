package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MeseroService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/meseros/listar")
public class ListarMeseroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");

        IService<Mesero> meseroService = new MeseroService(conn);
        List<Mesero> meseros = meseroService.lista();

        for (Mesero mesero : meseros) {
            resp.getWriter().println(
                    "<h1>" + mesero.getId() + "->"
                            + mesero.getNombre() + "->" + mesero.getApPaterno() + "</h1>");
        }
    }

}
