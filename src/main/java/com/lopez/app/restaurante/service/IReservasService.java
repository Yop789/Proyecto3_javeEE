package com.lopez.app.restaurante.service;

import java.util.List;

import com.lopez.app.restaurante.models.Cliente;
import com.lopez.app.restaurante.models.Mesa;
import com.lopez.app.restaurante.models.Reservacio;

public interface IReservasService<T> extends IService<Reservacio> {
    List<Cliente> listaClientes();

    List<Mesa> listaMesas();

}
