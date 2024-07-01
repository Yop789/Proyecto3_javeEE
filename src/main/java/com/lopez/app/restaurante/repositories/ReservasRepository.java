package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import java.util.List;

import com.lopez.app.restaurante.models.Reservacio;
import com.lopez.app.restaurante.models.Enum.EnumReservacion;

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
        String sql = "SELECT * FROM RESERVAS WHERE ID_RESERVA=?";
        Reservacio reservacio = null;
        try (PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setLong(1, id);
            try (ResultSet rs = stm.executeQuery()) {
                if (rs.next()) {
                    reservacio = this.getReservacio(rs);
                }
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }

        return reservacio;
    }

    @Override
    public void guardar(Reservacio t) throws SQLException {
        String sql = "";
        if (t.getId() != null && t.getId() > 0) {
            sql = "UPDATE RESERVAS SET ID_MESA=?,ID_CLIENTE=?,FECHA=?,FECHA_A_RESERVAR=?,ESTATUS=? WHERE ID_RESERVA=?";
        } else {
            sql = "INSERT INTO RESERVAS(ID_RESERVA,ID_CLIENTE,ID_MESA,FECHA,FECHA_A_RESERVAR,ESTATUS) VALUES(SEQUENCE_RESERVAS.NEXTVAL,?,?,?,?,?)";
        }
        try (PreparedStatement stm = conn.prepareStatement(sql)) {

            stm.setLong(1, t.getId_cliente());
            stm.setLong(2, t.getId_mesa());
            stm.setDate(3, Date.valueOf(t.getFecha()));
            stm.setTimestamp(4, Timestamp.valueOf(t.getFecha_a_reservar()));
            stm.setString(5, t.getEstatus().toString());
            if (t.getId() != null && t.getId() > 0) {
                stm.setLong(6, t.getId());
            }
            stm.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException(e);
        }

    }

    @Override
    public void eliminar(Long id) throws SQLException {
        String sql = "DELETE FROM RESERVAS WHERE ID_RESERVA=?";
        try (PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setLong(1, id);
            stm.executeUpdate();
        }
    }

    private Reservacio getReservacio(ResultSet rs) throws SQLException {
        Reservacio reservacio = new Reservacio();
        reservacio.setId(rs.getLong("ID_RESERVA"));
        reservacio.setId_mesa(rs.getLong("ID_MESA"));
        reservacio.setId_cliente(rs.getLong("ID_CLIENTE"));
        reservacio.setFecha(rs.getDate("FECHA").toLocalDate());
        reservacio.setFecha_a_reservar(rs.getTimestamp("FECHA_A_RESERVAR").toLocalDateTime());
        reservacio.setEstatus(EnumReservacion.valueOf(rs.getString("ESTATUS")));
        return reservacio;
    }

}
