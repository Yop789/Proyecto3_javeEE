package com.lopez.app.restaurante.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Enum.EnumEstado;

import com.lopez.app.restaurante.service.IService;
import com.lopez.app.restaurante.service.MeseroService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/meseros/alta")
public class AltaMeseroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        getServletContext().getRequestDispatcher("/AltaMesero.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        IService<Mesero> service = new MeseroService(conn);

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");

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
        String numEmpleado = req.getParameter("num_Empleado");
        String edad = req.getParameter("edad");

        String fechaNacimiento = req.getParameter("fechaNacimiento");
        LocalDate fecha;
        try {
            Date fechaInput = inputFormat.parse(fechaNacimiento);
            String formato = outputFormat.format(fechaInput);
            fecha = LocalDate.parse(formato, DateTimeFormatter.ofPattern("dd/MM/yyyy"));
        } catch (Exception e) {
            fecha = null;
        }

        Long num_interno = 0L;
        Long num_externo = 0L;
        Integer cp = 0;

        Map<String, String> errors = new HashMap<>();

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

            errors.put("telefono", "El telfoon es requerido");
        }

        if (correo == null || correo.isEmpty()) {
            errors.put("correo", "El correo es requerido");
        }

        if (calle == null || calle.isEmpty()) {
            errors.put("calle", "La calle es requerida");
        }

        if (numInteriorParam != null && !numInteriorParam.isEmpty()) {
            try {
                num_interno = Long.parseLong(numInteriorParam);
            } catch (Exception e) {
                errors.put("numInterior", "El interior es requerido");
            }

        }

        if (numExteriorParam != null && !numExteriorParam.isEmpty()) {
            try {
                num_externo = Long.parseLong(numExteriorParam);
            } catch (Exception e) {
                errors.put("numExterior", "El exterior es requerido");
            }
        }

        if (cpParam != null && !cpParam.isEmpty()) {
            try {
                cp = Integer.parseInt(cpParam);
            } catch (Exception e) {
                errors.put("cp", "El cp es requerido");
            }
        }

        if (colonia == null || colonia.isEmpty()) {
            errors.put("colonia", "La colonia es requerida");
        }

        if (ciudad == null || ciudad.isEmpty()) {
            errors.put("ciudad", "La ciudad es requerida");
        }

        if (estado == null || estado.isEmpty()) {
            errors.put("estado", "El estado es requerido");
        }

        if (numEmpleado == null || numEmpleado.isEmpty()) {
            errors.put("numEmpleado", "El num_Empleado es requerido");
        }

        if (edad == null || edad.isEmpty()) {
            errors.put("edad", "La edad es requerida");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            getServletContext().getRequestDispatcher("/AltaMesero.jsp").forward(req, resp);
            return;
        } else {
            Mesero mesero = new Mesero();
            mesero.setNombre(nombre);
            mesero.setApPaterno(apPaterno);
            mesero.setApMaterno(apMaterno);
            mesero.setTelefono(telefono);
            mesero.setCorreo(correo);
            mesero.setCalle(calle);
            mesero.setNum_exterior(num_externo);
            mesero.setNum_interior(num_interno);
            mesero.setColonia(colonia);
            mesero.setCiudad(ciudad);
            mesero.setCp(cp);
            mesero.setEstado(EnumEstado.valueOf(estado));
            mesero.setNum_Empleado(num_externo);
            mesero.setEdad(num_externo);
            mesero.setFecha_nacimiento(fecha);

            service.guardar(mesero);
            resp.sendRedirect(req.getContextPath() + "/meseros/listar");
        }
    }

}
