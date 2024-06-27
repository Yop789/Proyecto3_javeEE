package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.service.ClienteService;
import com.lopez.app.restaurante.service.IService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clientes/detalle")
public class DetalleClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        IService<Cliente> service = new ClienteService(conn);
        long id;

        try {
            id = Long.parseLong(req.getParameter("id"));

        } catch (Exception e) {
            id = 0L;
        }

        Cliente cliente = new Cliente();

        if (id > 0) {
            Optional<Cliente> optional = service.getByID(id);

            if (optional.isPresent()) {
                cliente = optional.get();
                req.setAttribute("cliente", cliente);
                getServletContext().getRequestDispatcher("/DetallerCliente.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro el chofer");

            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se deve enviar como parametro en la url");
        }

    }

}
