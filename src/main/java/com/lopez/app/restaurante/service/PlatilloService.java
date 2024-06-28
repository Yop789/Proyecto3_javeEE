package com.lopez.app.restaurante.service;

import java.sql.Connection;
import java.util.List;
import java.util.Optional;

import com.lopez.app.restaurante.models.Platillo;
import com.lopez.app.restaurante.repositories.IRepository;
import com.lopez.app.restaurante.repositories.PlatilloRepository;

public class PlatilloService implements IService<Platillo> {

    private IRepository<Platillo> platilloRepo;

    public PlatilloService(Connection conn) {
        this.platilloRepo = new PlatilloRepository(conn);
    }

    @Override
    public List<Platillo> lista() {
        try {
            return platilloRepo.lista();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public Optional<Platillo> getByID(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getByID'");
    }

    @Override
    public void guardar(Platillo t) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

}
