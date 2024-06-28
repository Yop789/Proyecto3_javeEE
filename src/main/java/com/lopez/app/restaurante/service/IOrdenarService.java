package com.lopez.app.restaurante.service;

import java.util.List;

import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Mesero;
import com.lopez.app.restaurante.models.Ordenar;

public interface IOrdenarService<T> extends IService<Ordenar> {
    List<Mesa> listaMesas();

    List<Mesero> listaMeseros();

}
