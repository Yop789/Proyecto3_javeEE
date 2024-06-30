package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.DescripcioOrden;
import com.lopez.app.restaurante.service.DescripcioService;
import com.lopez.app.restaurante.service.IDescripcioOrdenService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/descripciones/listar")
public class ListarDescripcioOrdenes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");

        IDescripcioOrdenService<DescripcioOrden> descripcioOrdenService = new DescripcioService(conn);
        List<DescripcioOrden> descripciones = descripcioOrdenService.lista();
        // for (DescripcioOrden descripcio : descripciones) {
        // resp.getWriter().println(
        // "<h1>" + descripcio.getId() + "->"
        // + descripcio.getId_platillo() + "->" + descripcio.getId_orden() + "</h1>");
        // }

        req.setAttribute("descripciones", descripciones);

        getServletContext().getRequestDispatcher("/ListarDescripciones.jsp").forward(req, resp);
    }

}
