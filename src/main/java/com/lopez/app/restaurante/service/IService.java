package com.lopez.app.restaurante.service;

import java.util.List;
import java.util.Optional;

public interface IService<T> {

    List<T> lista();

    Optional<T> getByID(Long id);

    void guardar(T t);

    void eliminar(Long id);

}
