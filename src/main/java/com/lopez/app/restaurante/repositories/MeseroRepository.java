package com.lopez.app.restaurante.repositories;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Enum.EnumEstado;

public class MeseroRepository implements IRepository<Mesero> {
    private Connection conn;

    public MeseroRepository(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Mesero> lista() throws SQLException {
        List<Mesero> meseros = new ArrayList<>();
        try (Statement stm = conn.createStatement();
                ResultSet rs = stm.executeQuery("SELECT * FROM MESEROS")) {

            while (rs.next()) {
                Mesero mesero = this.getMesero(rs);
                meseros.add(mesero);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }

        return meseros;

    }

    @Override
    public Mesero get(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'get'");
    }

    @Override
    public void guardar(Mesero t) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

    private Mesero getMesero(ResultSet rs) throws SQLException {
        Mesero mesero = new Mesero();
        mesero.setId(rs.getLong("NUM_EMPLEADO"));
        mesero.setNombre(rs.getString("NOMBRE"));
        mesero.setApPaterno(rs.getString("AP_PATERNO"));
        mesero.setApMaterno(rs.getString("AP_MATERNO"));
        mesero.setTelefono(rs.getString("TELEFONO"));
        mesero.setCorreo(rs.getString("CORREO"));
        mesero.setCalle(rs.getString("CALLE"));
        mesero.setNum_exterior(rs.getLong("NUMERO_INT"));
        mesero.setNum_exterior(rs.getLong("NUMERO_EXT"));
        mesero.setColonia(rs.getString("COLONIA"));
        mesero.setCiudad(rs.getString("CIUDAD"));
        mesero.setEstado(EnumEstado.valueOf(rs.getString("ESTADO")));
        mesero.setCp(rs.getInt("CODIGO_POSTAL"));
        mesero.setFecha_nacimiento(rs.getDate("FECHA_NACIMIENTO").toLocalDate());
        mesero.setNum_Empleado(rs.getLong("NUM_EMPLEADO"));
        mesero.setEdad(rs.getLong("EDAD"));
        return mesero;
    }
}
