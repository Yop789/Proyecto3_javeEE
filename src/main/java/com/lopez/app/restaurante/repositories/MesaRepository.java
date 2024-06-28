package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Enum.EnumEstadoMesa;

public class MesaRepository implements IRepository<Mesa> {
    private Connection conn;

    public MesaRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Mesa> lista() throws SQLException {
        List<Mesa> mesas = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM MESAS")) {

            while (rs.next()) {
                Mesa mesa = this.getMesa(rs);
                mesas.add(mesa);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
        return mesas;
    }

    @Override
    public Mesa get(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get'");
    }

    @Override
    public void guardar(Mesa t) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

    private Mesa getMesa(ResultSet rs) throws SQLException {
        Mesa mesa = new Mesa();
        mesa.setId_mesa(rs.getLong("ID_MESA"));
        mesa.setNum_mesa(rs.getLong("NUMERO"));
        mesa.setCapacidad(rs.getLong("CAPACIDAD"));
        mesa.setLugar(rs.getString("LUGAR"));
        mesa.setEstado(EnumEstadoMesa.valueOf(rs.getString("ESTATUS")));
        return mesa;
    }

}
