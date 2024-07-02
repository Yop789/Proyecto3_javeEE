package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Mesero;
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

@WebServlet("/ordenes/alta")
public class AltaOrdenarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        IService<Mesa> serviceMesa = new MesaService(conn);
        List<Mesa> mesas = serviceMesa.lista();

        IService<Mesero> serviceMesero = new MeseroService(conn);
        List<Mesero> clientes = serviceMesero.lista();

        req.setAttribute("mesas", mesas);
        req.setAttribute("meseros", clientes);
        getServletContext().getRequestDispatcher("/AltaOrdenes.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");
        IOrdenarService<Ordenar> service = new OrdenarService(conn);
        IService<Mesa> serviceMesa = new MesaService(conn);
        List<Mesa> mesas = serviceMesa.lista();

        IService<Mesero> serviceMesero = new MeseroService(conn);
        List<Mesero> clientes = serviceMesero.lista();

        Map<String, String> errors = new HashMap<>();

        String id_mesa = req.getParameter("id_mesa");
        String id_mesero = req.getParameter("id_mesero");

        if (id_mesa == null || id_mesa.isEmpty()) {
            errors.put("id_mesa", "Debe seleccionar una mesa");
        }

        if (id_mesero == null || id_mesero.isEmpty()) {
            errors.put("id_mesero", "Debe seleccionar un mesero");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("mesas", mesas);
            req.setAttribute("meseros", clientes);
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/AltaOrdenes.jsp").forward(req, resp);
            return;
        }

        long idMesa = Long.parseLong(id_mesa);
        long idMesero = Long.parseLong(id_mesero);
        LocalDateTime fecha = LocalDateTime.now();
        Ordenar orden = new Ordenar();
        try {
            orden.setId_mesa(idMesa);
            orden.setId_mesero(idMesero);
            orden.setFecha(fecha);
            service.guardar(orden);

            resp.sendRedirect(req.getContextPath() + "/ordenes/listar");
        } catch (Exception e) {
            req.setAttribute("mesas", mesas);
            req.setAttribute("meseros", clientes);
            errors.put("error", e.getMessage());
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/AltaOrdenes.jsp").forward(req, resp);
        }

    }

}
