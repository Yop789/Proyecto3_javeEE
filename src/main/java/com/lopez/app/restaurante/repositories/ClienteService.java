package com.lopez.app.restaurante.repositories;

import com.lopez.app.restaurante.model.Cliente;

import java.util.List;
import java.util.Optional;

public class ClienteService implements IService<Cliente>{

    @Override
    public List<Cliente> lista() {
        return List.of();
    }

    @Override
    public Optional<Cliente> getByID(Long id) {
        return Optional.empty();
    }

    @Override
    public void guardar(Cliente cliente) {

    }

    @Override
    public void eliminar(Long id) {

    }

    @Override
    public void edit(Cliente cliente) {

    }
}
