package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Optional;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Reservacio;
import com.lopez.app.restaurante.service.ClienteService;
import com.lopez.app.restaurante.service.IReservasService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;
import com.lopez.app.restaurante.service.ReservasService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservaciones/editar")
public class EditarRecervacionesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Cliente> serviceCliente = new ClienteService(conn);
        IService<Mesa> serviceMesa = new MesaService(conn);

        List<Mesa> mesas = serviceMesa.lista();
        req.setAttribute("mesas", mesas);

        List<Cliente> clientes = serviceCliente.lista();
        req.setAttribute("clientes", clientes);
        Long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (Exception e) {
            id = 0L;
        }
        Reservacio reservacio = new Reservacio();
        if (id > 0) {
            IReservasService<Reservacio> service = new ReservasService(conn);
            Optional<Reservacio> optional = service.getByID(id);
            if (optional.isPresent()) {
                reservacio = optional.get();
                req.setAttribute("reservacio", reservacio);
                getServletContext().getRequestDispatcher("/EditarReservaciones.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro la reservación");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se debe enviar como parametro en la url");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }

}
