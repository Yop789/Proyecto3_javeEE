package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.models.Platillo;

import com.lopez.app.restaurante.service.IOrdenarService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.OrdenarService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/descripciones/alta")
public class AltaDescripcionOrdenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        IService<Platillo> servicePlatillo = new PlatilloService(conn);
        List<Platillo> platillos = servicePlatillo.lista();

        IOrdenarService<Ordenar> serviceOrdenar = new OrdenarService(conn);
        List<Ordenar> ordenars = serviceOrdenar.lista();

        req.setAttribute("platillos", platillos);
        req.setAttribute("ordenars", ordenars);

        getServletContext().getRequestDispatcher("/AltaDescripciones.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }

}
