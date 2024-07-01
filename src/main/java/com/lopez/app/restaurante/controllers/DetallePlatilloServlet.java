package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/platillos/detalle")
public class DetallePlatilloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        String id = req.getParameter("id");

        if (id == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el id del platillo");
            return;
        }

        try {
            Long platilloId = Long.parseLong(id);
            IService<Platillo> service = new PlatilloService(conn);
            Optional<Platillo> platilloOptional = service.getByID(platilloId);
            if (platilloOptional.isPresent()) {
                Platillo platillo = platilloOptional.get();
                req.setAttribute("platillo", platillo);
                getServletContext().getRequestDispatcher("/DetallePlatillo.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro el platillo");
            }
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error al obtener el platillo");
        }
    }

}
