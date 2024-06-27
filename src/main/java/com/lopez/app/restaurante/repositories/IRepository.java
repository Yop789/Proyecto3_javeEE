package com.lopez.app.restaurante.repositories;

import java.sql.SQLException;
import java.util.List;

public interface IRepository<T> {

    List<T> lista() throws SQLException;

    T get(Long id) throws SQLException;

    void guardar(T t) throws SQLException;

    void eliminar(Long id) throws SQLException;
}
