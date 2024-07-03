package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.OrdenMeseroMesa;
import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.service.IOrdenarService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;
import com.lopez.app.restaurante.service.MeseroService;
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

        IOrdenarService<Ordenar> service = new OrdenarService(conn);
        IService<Mesa> serviceMesa = new MesaService(conn);
        IService<Mesero> serviceMesero = new MeseroService(conn);

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
                OrdenMeseroMesa ordenMeseroMesa = new OrdenMeseroMesa();
                ordenar = optional.get();

                Mesa mesa = serviceMesa.getByID(ordenar.getId_mesa()).get();

                Mesero mesero = serviceMesero.getByID(ordenar.getId_mesero()).get();

                ordenMeseroMesa.setMesa(mesa);
                ordenMeseroMesa.setMesero(mesero);
                ordenMeseroMesa.setOrdenar(ordenar);
                req.setAttribute("orden", ordenMeseroMesa);
                getServletContext().getRequestDispatcher("/DetalleOrden.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro la mesa");
            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se debe enviar como parametro en la url");
        }
    }
}
