package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;
import java.util.HashMap;

import java.util.Map;
import java.util.Optional;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.models.Enum.EnumEstado;
import com.lopez.app.restaurante.service.ClienteService;
import com.lopez.app.restaurante.service.IService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clientes/editar")
public class EditarClienteServlet extends HttpServlet {

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
                getServletContext().getRequestDispatcher("/EditarCliente.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontro el chofer");

            }

        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Error es nulo se deve enviar como parametro en la url");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");

        Map<String, String> errors = new HashMap<>();
        IService<Cliente> service = new ClienteService(conn);

        String nombre = req.getParameter("nombre");
        String apPaterno = req.getParameter("apPaterno");
        String apMaterno = req.getParameter("apMaterno");
        String telefono = req.getParameter("telefono");
        String correo = req.getParameter("correo");
        String calle = req.getParameter("calle");
        String numInteriorParam = req.getParameter("numInterior");
        String numExteriorParam = req.getParameter("numExterior");
        String colonia = req.getParameter("colonia");
        String ciudad = req.getParameter("ciudad");
        String cpParam = req.getParameter("cp");
        String estado = req.getParameter("estado");
        String fechaNacimiento = req.getParameter("fechaNacimiento");

        LocalDate fecha = null;
        try {
            Date fechaInput = inputFormat.parse(fechaNacimiento);
            fecha = LocalDate.parse(outputFormat.format(fechaInput), DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        } catch (ParseException | DateTimeParseException e) {
            errors.put("fechaNacimiento", "Fecha de nacimiento inválida");
        }

        Long id = null;
        try {
            String idParam = req.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                id = Long.parseLong(idParam);
            }
        } catch (NumberFormatException e) {
            errors.put("id", "El ID debe ser un número válido");
        }

        if (nombre == null || nombre.isEmpty()) {
            errors.put("nombre", "El nombre es requerido");
        }

        if (apPaterno == null || apPaterno.isEmpty()) {
            errors.put("apPaterno", "El apellido paterno es requerido");
        }

        if (apMaterno == null || apMaterno.isEmpty()) {
            errors.put("apMaterno", "El apellido materno es requerido");
        }

        if (telefono == null || telefono.isEmpty()) {
            errors.put("telefono", "El teléfono es requerido");
        }

        if (correo == null || correo.isEmpty()) {
            errors.put("correo", "El correo es requerido");
        }

        if (calle == null || calle.isEmpty()) {
            errors.put("calle", "La calle es requerida");
        }

        Long numInterior = 0L; // Valor predeterminado si está vacío
        try {
            numInterior = Long.parseLong(numInteriorParam);
        } catch (NumberFormatException e) {
            numInterior = 0l;
        }

        Long numExterior = null; // Permitir que el número exterior sea null si está vacío
        if (numExteriorParam != null && !numExteriorParam.isEmpty()) {
            try {
                numExterior = Long.parseLong(numExteriorParam);
            } catch (NumberFormatException e) {
                errors.put("numExterior", "El número exterior debe ser un número válido");
            }
        }

        if (colonia == null || colonia.isEmpty()) {
            errors.put("colonia", "La colonia es requerida");
        }

        if (ciudad == null || ciudad.isEmpty()) {
            errors.put("ciudad", "La ciudad es requerida");
        }

        int cp = 0; // Valor predeterminado si está vacío
        try {
            cp = Integer.parseInt(cpParam);
        } catch (NumberFormatException e) {
            errors.put("cp", "El C.P. debe ser un número válido");
        }

        if (estado == null || estado.isEmpty()) {
            errors.put("estado", "El estado es requerido");
        }

        Cliente cl = new Cliente();
        cl.setNombre(nombre);
        cl.setApPaterno(apPaterno);
        cl.setApMaterno(apMaterno);
        cl.setTelefono(telefono);
        cl.setCorreo(correo);
        cl.setCalle(calle);
        cl.setNum_interior(numInterior);
        cl.setNum_exterior(numExterior);
        cl.setColonia(colonia);
        cl.setCiudad(ciudad);
        cl.setCp(cp);
        cl.setEstado(EnumEstado.valueOf(estado));
        cl.setFecha_nacimiento(fecha);
        cl.setId(id);

        if (errors.isEmpty()) {
            service.guardar(cl);
            resp.sendRedirect(req.getContextPath() + "/clientes/listar");
        } else {
            req.setAttribute("errors", errors);
            req.setAttribute("cliente", cl);
            getServletContext().getRequestDispatcher("/EditarCliente.jsp").forward(req, resp);
        }

    }

}
