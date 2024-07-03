package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.DescripcioOrden;
import com.lopez.app.restaurante.service.DescripcioService;
import com.lopez.app.restaurante.service.IDescripcioOrdenService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/descripciones/eliminar")
public class EliminarDescripcioOrden extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Connection conn = (Connection) req.getAttribute("conn");
        IDescripcioOrdenService<DescripcioOrden> descripcioOrdenService = new DescripcioService(conn);
        Map<String, String> errors = new HashMap<>();

        long id;
        try {
            id = Long.parseLong(req.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        if (id > 0) {
            Optional<DescripcioOrden> optional = descripcioOrdenService.getByID(id);
            if (optional.isPresent()) {
                try {
                    descripcioOrdenService.eliminar(id);
                    resp.sendRedirect(req.getContextPath() + "/descripciones/listar");
                    return;

                } catch (Exception e) {
                    errors.put("error",
                            "No se puede eliminar la descripción debido a restricciones de integridad en la base de datos: "
                                    + e.getMessage());
                }

            } else {
                errors.put("error", "No se encontró la descripción con ID: " + id);
            }

        } else {
            errors.put("error", "ID inválido o no proporcionado en la URL");
        }

    }

}
