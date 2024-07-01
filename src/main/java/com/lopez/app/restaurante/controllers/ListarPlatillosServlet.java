package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;

import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/platillos/listar")
public class ListarPlatillosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");

        IService<Platillo> platilloService = new PlatilloService(conn);

        // List<Platillo> platillos = platilloService.lista();
        // for (Platillo platillo : platillos) {
        // resp.getWriter().println(
        // "<h1>" + platillo.getId() + "->"
        // + platillo.getNombre() + "->" + platillo.getPrecio() + "</h1>");
        // }

        req.setAttribute("platillos", platilloService.lista());

        getServletContext().getRequestDispatcher("/ListarPlatillos.jsp").forward(req, resp);

    }

}
