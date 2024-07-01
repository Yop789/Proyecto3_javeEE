package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.models.Enum.EnumEstatusPlatillo;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/platillos/editar")
public class EditarPlatillosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Platillo> service = new PlatilloService(conn);

        Long id = Long.parseLong(req.getParameter("id"));
        Optional<Platillo> platillo = service.getByID(id);
        Platillo p = new Platillo();
        if (platillo != null) {
            p = platillo.get();
            req.setAttribute("platillo", p);
            getServletContext().getRequestDispatcher("/EditarPlatillo.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/platillos/listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Platillo> service = new PlatilloService(conn);

        Long id = Long.parseLong(req.getParameter("id"));
        String nombre = req.getParameter("nombre");
        String precioParam = req.getParameter("precio");
        String descripcion = req.getParameter("descripcion");
        String estatus = req.getParameter("estatus");

        Float precio = 0.0f;

        Map<String, String> errors = new HashMap<>();

        if (nombre == null || nombre.isEmpty()) {
            errors.put("nombre", "El nombre es requerido");
        }

        if (precioParam == null || precioParam.isEmpty()) {
            errors.put("precio", "El precio es requerido");
        } else {
            try {
                precio = Float.parseFloat(precioParam);
            } catch (NumberFormatException e) {
                errors.put("precio", "El precio debe ser un número válido");
            }
        }

        if (descripcion == null || descripcion.isEmpty()) {
            errors.put("descripcion", "La descripción es requerida");
        }

        if (estatus == null || estatus.isEmpty()) {
            errors.put("estatus", "El estatus es requerido");
        }

        if (errors.isEmpty()) {
            Optional<Platillo> platillo = service.getByID(id);
            if (platillo != null) {
                Platillo p = new Platillo();
                p.setId(id);
                p.setNombre(nombre);
                p.setPrecio(precio);
                p.setDescripcion(descripcion);
                p.setEstatus(EnumEstatusPlatillo.valueOf(estatus));
                service.guardar(p);
                resp.sendRedirect(req.getContextPath() + "/platillos/listar");
            }
        } else {
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/EditarPlatillo.jsp").forward(req, resp);
        }
    }

}
