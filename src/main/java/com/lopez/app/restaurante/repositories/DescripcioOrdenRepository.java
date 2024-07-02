package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lopez.app.restaurante.models.DescripcioOrden;
import com.lopez.app.restaurante.models.Enum.EnumEstatusDetalleOrder;

public class DescripcioOrdenRepository implements IRepository<DescripcioOrden> {
    private Connection conn;

    public DescripcioOrdenRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<DescripcioOrden> lista() throws SQLException {
        List<DescripcioOrden> descripcions = new ArrayList<>();
        try (Statement stm = this.conn.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM DETALLE_PEDIDO")) {
            while (rs.next()) {
                DescripcioOrden descripcio = this.getDescripcio(rs);
                descripcions.add(descripcio);
            }

        } catch (SQLException e) {
            throw new SQLException(e);

        }
        return descripcions;
    }

    @Override
    public DescripcioOrden get(Long id) throws SQLException {
        String sql = "SELECT * FROM DETALLE_PEDIDO WHERE ID_DETALLEP = " + id;
        try (Statement stm = this.conn.createStatement();
                ResultSet rs = stm.executeQuery(sql)) {
            if (rs.next()) {
                return this.getDescripcio(rs);
            }

        } catch (SQLException e) {
            throw new SQLException(e);
        }

        return null;
    }

    @Override
    public void guardar(DescripcioOrden t) throws SQLException {
        String sql = "";
        if (t.getId() != null && t.getId() > 0) {
            sql = "UPDATE DETALLE_PEDIDO SET ID_PEDIDO=?,ID_PLATILLO=?,CANTIDAD=?,ESTATUS=? WHERE ID_DETALLEP=?";
        } else {
            sql = "INSERT INTO DETALLE_PEDIDO(ID_DETALLEP,ID_PEDIDO,ID_PLATILLO,CANTIDAD,ESTATUS) VALUES(SEQUENCE_DETALLEP.NEXTVAL,?,?,?,?,?)";
        }
        try (PreparedStatement stm = this.conn.prepareStatement(sql)) {
            stm.setLong(1, t.getId_orden());
            stm.setLong(2, t.getId_platillo());
            stm.setLong(3, t.getCantidad());
            stm.setString(4, t.getEstatus().toString());
            if (t.getId() != null && t.getId() > 0) {
                stm.setLong(5, t.getId());
            }
            stm.executeUpdate();
        }
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        String sql = "DELETE FROM DETALLE_PEDIDO WHERE ID_DETALLEP = " + id;
        try (Statement stm = this.conn.createStatement()) {
            stm.executeUpdate(sql);
        }
    }

    private DescripcioOrden getDescripcio(ResultSet rs) throws SQLException {
        DescripcioOrden descripcio = new DescripcioOrden();
        descripcio.setId(rs.getLong("ID_DETALLEP"));
        descripcio.setId_orden(rs.getLong("ID_PEDIDO"));
        descripcio.setId_platillo(rs.getLong("ID_PLATILLO"));
        descripcio.setCantidad(rs.getLong("CANTIDAD"));
        descripcio.setEstatus(EnumEstatusDetalleOrder.valueOf(rs.getString("ESTATUS")));
        return descripcio;
    }

}
