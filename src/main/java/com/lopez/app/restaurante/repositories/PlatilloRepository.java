package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.models.Enum.EnumEstatusPlatillo;

public class PlatilloRepository implements IRepository<Platillo> {
    private Connection conn;

    public PlatilloRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Platillo> lista() throws SQLException {
        List<Platillo> platillos = new ArrayList<>();
        try (Statement stm = this.conn.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM PLATILLOS")) {
            while (rs.next()) {
                Platillo a = this.getPlatillo(rs);
                platillos.add(a);
            }
        } catch (SQLException e) {
            throw new SQLException(e);
        }
        return platillos;
    }

    @Override
    public Platillo get(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get'");
    }

    @Override
    public void guardar(Platillo t) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

    private Platillo getPlatillo(ResultSet rs) throws SQLException {
        Platillo platillo = new Platillo();
        platillo.setId(rs.getLong("ID_PLATILLO"));
        platillo.setNombre(rs.getString("NOMBRE"));
        platillo.setPrecio(rs.getFloat("PRECIO"));
        platillo.setDescripcion(rs.getString("DESCRIPCION"));
        platillo.setEstatus(EnumEstatusPlatillo.valueOf(rs.getString("ESTATUS")));
        return platillo;
    }

}
