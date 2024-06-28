package com.lopez.app.restaurante.service;

import java.sql.Connection;
import java.util.List;
import java.util.Optional;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.repositories.IRepository;
import com.lopez.app.restaurante.repositories.MesaRepository;
import com.lopez.app.restaurante.repositories.MeseroRepository;
import com.lopez.app.restaurante.repositories.OrdenRepository;

public class OrdenarService implements IOrdenarService<Ordenar> {
    IRepository<Ordenar> ordenarRepo;
    IRepository<Mesa> mesaRepo;
    IRepository<Mesero> meseroRepo;

    public OrdenarService(Connection conn) {
        this.ordenarRepo = new OrdenRepository(conn);
        this.mesaRepo = new MesaRepository(conn);
        this.meseroRepo = new MeseroRepository(conn);
    }

    @Override
    public List<Ordenar> lista() {
        try {
            return ordenarRepo.lista();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public Optional<Ordenar> getByID(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getByID'");
    }

    @Override
    public void guardar(Ordenar t) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'guardar'");
    }

    @Override
    public void eliminar(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'eliminar'");
    }

    @Override
    public List<Mesa> listaMesas() {
        try {
            return mesaRepo.lista();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

    @Override
    public List<Mesero> listaMeseros() {
        try {
            return meseroRepo.lista();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage(), e.getCause());
        }
    }

}
