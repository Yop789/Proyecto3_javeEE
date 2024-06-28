package com.lopez.app.restaurante.service;

import java.util.List;

import com.lopez.app.restaurante.models.DescripcioOrden;
import com.lopez.app.restaurante.models.Ordenar;
import com.lopez.app.restaurante.models.Platillo;

public interface IDescripcioOrdenService<T> extends IService<DescripcioOrden> {
    List<Platillo> listaPlatillos();

    List<Ordenar> listaOrdenes();
}
