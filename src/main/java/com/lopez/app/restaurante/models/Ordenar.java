package com.lopez.app.restaurante.models;

import java.time.LocalDate;

public class Ordenar {
    private Long id;
    private Long id_mesa;
    private Long id_mesero;
    private LocalDate fecha;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId_mesa() {
        return id_mesa;
    }

    public void setId_mesa(Long id_mesa) {
        this.id_mesa = id_mesa;
    }

    public Long getId_mesero() {
        return id_mesero;
    }

    public void setId_mesero(Long id_mesero) {
        this.id_mesero = id_mesero;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

}
