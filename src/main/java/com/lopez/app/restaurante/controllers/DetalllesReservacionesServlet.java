package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Reservacio;
import com.lopez.app.restaurante.models.ReservacionMesaCliente;
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

@WebServlet("/reservaciones/detalle")
public class DetalllesReservacionesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IReservasService service = new ReservasService(conn);
        IService<Cliente> service2 = new ClienteService(conn);
        IService<Mesa> service3 = new MesaService(conn);

        ReservacionMesaCliente reservacionC = new ReservacionMesaCliente();
        long id;

        try {
            id = Long.parseLong(req.getParameter("id"));

        } catch (Exception e) {
            id = 0L;
        }

        if (id > 0) {
            Optional<Reservacio> optional = service.getByID(id);
            if (optional.isPresent()) {
                Reservacio reservacio = optional.get();

                Optional<Cliente> optional2 = service2.getByID(reservacio.getId_cliente());
                Optional<Mesa> optional3 = service3.getByID(reservacio.getId_mesa());

                reservacionC.setReservacio(reservacio);
                reservacionC.setCliente(optional2.get());
                reservacionC.setMesa(optional3.get());

                req.setAttribute("reservacion", reservacionC);
                getServletContext().getRequestDispatcher("/DetalleReservaciones.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro la reservacio");
            }
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se debe enviar como parametro en la url");
        }
    }

}
