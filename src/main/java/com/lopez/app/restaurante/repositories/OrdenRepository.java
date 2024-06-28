package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lopez.app.restaurante.models.Ordenar;

public class OrdenRepository implements IRepository<Ordenar> {
    private Connection conn;

    public OrdenRepository(Connection conn) {

        this.conn = conn;
    }

    @Override
    public List<Ordenar> lista() throws SQLException {
        List<Ordenar> ordenes = new ArrayList<>();
        try (Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM PEDIDOS")) {

            while (rs.next()) {
                Ordenar orden = this.getOrden(rs);
                ordenes.add(orden);
            }

        }
        return ordenes;
    }

    @Override
    public Ordenar get(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get'");
    }

    @Override
    public void guardar(Ordenar t) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

    private Ordenar getOrden(ResultSet rs) throws SQLException {
        Ordenar orden = new Ordenar();
        orden.setId(rs.getLong("ID_PEDIDO"));
        orden.setId_mesa(rs.getLong("ID_MESA"));
        orden.setId_mesero(rs.getLong("ID_MESERO"));
        orden.setFecha(rs.getDate("FECHA").toLocalDate());
        return orden;
    }

}
