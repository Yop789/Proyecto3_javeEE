package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mesas/listar")
public class ListarMesaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Mesa> mesaService = new MesaService(conn);

        List<Mesa> mesas = mesaService.lista();
        for (Mesa mesa : mesas) {
            resp.getWriter().println(
                    "<h1>" + mesa.getId_mesa() + "->"
                            + mesa.getNum_mesa() + "->" + mesa.getCapacidad() + "</h1>");
        }
    }

}
