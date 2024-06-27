package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.service.ClienteService;
import com.lopez.app.restaurante.service.IService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clientes/listar")
public class ListarClientesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Cliente> services = new ClienteService(conn);
        List<Cliente> clientes = services.lista();

        // for (Cliente c : clientes) {
        // resp.getWriter().println("<h1>" + c.getId() + "->"
        // + c.getNombre() + "->" + c.getApPaterno() + "</h1>");
        // }

        req.setAttribute("clientes", clientes);
        getServletContext().getRequestDispatcher("/ListarCliente.jsp").forward(req, resp);

    }

}
