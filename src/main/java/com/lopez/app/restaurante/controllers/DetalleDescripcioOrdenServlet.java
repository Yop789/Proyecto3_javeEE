package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

import com.lopez.app.restaurante.models.DescripcioOrden;
import com.lopez.app.restaurante.models.DescripcionOrdenPlatillos;
import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.service.DescripcioService;
import com.lopez.app.restaurante.service.IDescripcioOrdenService;
import com.lopez.app.restaurante.service.IOrdenarService;
import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MesaService;
import com.lopez.app.restaurante.service.MeseroService;
import com.lopez.app.restaurante.service.OrdenarService;
import com.lopez.app.restaurante.service.PlatilloService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/descripciones/detalles")
public class DetalleDescripcioOrdenServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IDescripcioOrdenService<DescripcioOrden> descripcioOrdenService = new DescripcioService(conn);
        Long id = Long.parseLong(req.getParameter("id"));
        Optional<DescripcioOrden> descripcio = descripcioOrdenService.getByID(id);

        IOrdenarService<Ordenar> ordenarService = new OrdenarService(conn);
        Long id_orden = descripcio.get().getId_orden();
        Optional<Ordenar> orden = ordenarService.getByID(id_orden);

        IService<Platillo> platilloService = new PlatilloService(conn);
        Long id_Platillo = descripcio.get().getId_platillo();
        Optional<Platillo> platillo = platilloService.getByID(id_Platillo);

        IService<Mesero> meseroService = new MeseroService(conn);
        Long id_mesero = orden.get().getId_mesero();
        Optional<Mesero> mesero = meseroService.getByID(id_mesero);

        IService<Mesa> mesaService = new MesaService(conn);
        Long id_mesa = orden.get().getId_mesa();
        Optional<Mesa> mesa = mesaService.getByID(id_mesa);

        DescripcionOrdenPlatillos desOrden = new DescripcionOrdenPlatillos();

        desOrden.setDescripcio(descripcio.get());
        desOrden.setOrden(orden.get());
        desOrden.setPlatillo(platillo.get());
        desOrden.setMesero(mesero.get());
        desOrden.setMesa(mesa.get());
        req.setAttribute("desOrden", desOrden);
        getServletContext().getRequestDispatcher("/DetalleDescripciones.jsp").forward(req, resp);
    }

}
