package com.lopez.app.restaurante.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.repositories.IRepository;
import com.lopez.app.restaurante.repositories.MesaRepository;

public class MesaService implements IService<Mesa> {
    private IRepository<Mesa> mesaRepo;

    public MesaService(Connection conn) {
        this.mesaRepo = new MesaRepository(conn);
    }

    @Override
    public List<Mesa> lista() {
        try {
            return mesaRepo.lista();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public Optional<Mesa> getByID(Long id) {
        try {
            return Optional.ofNullable(mesaRepo.get(id));
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public void guardar(Mesa t) {
        try {
            mesaRepo.guardar(t);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public void eliminar(Long id) {
        try {
            mesaRepo.eliminar(id);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

}
