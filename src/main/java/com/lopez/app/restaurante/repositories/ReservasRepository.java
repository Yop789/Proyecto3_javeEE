package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lopez.app.restaurante.models.Reservacio;

public class ReservasRepository implements IRepository<Reservacio> {
    private Connection conn;

    public ReservasRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Reservacio> lista() throws SQLException {
        List<Reservacio> reservas = new ArrayList<>();
        try (Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM RESERVAS")) {

            while (rs.next()) {
                Reservacio reservacio = this.getReservacio(rs);
                reservas.add(reservacio);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }

        return reservas;

    }

    @Override
    public Reservacio get(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get'");
    }

    @Override
    public void guardar(Reservacio t) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

    private Reservacio getReservacio(ResultSet rs) throws SQLException {
        Reservacio reservacio = new Reservacio();
        reservacio.setId(rs.getLong("ID_RESERVA"));
        reservacio.setId_mesa(rs.getLong("ID_MESA"));
        reservacio.setId_cliente(rs.getLong("ID_CLIENTE"));
        reservacio.setFecha(rs.getDate("FECHA").toLocalDate());
        reservacio.setFecha_a_reservar(rs.getDate("FECHA_A_RESERVAR").toLocalDate());
        reservacio.setEstatus(rs.getString("ESTATUS"));
        return reservacio;
    }

}
