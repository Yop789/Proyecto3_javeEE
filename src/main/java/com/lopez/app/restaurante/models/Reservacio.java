package com.lopez.app.restaurante.models;

import java.time.LocalDate;

public class Reservacio {
    private Long id;
    private Long id_mesa;
    private Long id_cliente;
    private LocalDate fecha;
    private LocalDate fecha_a_reservar;
    private String estatus;

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

    public Long getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(Long id_cliente) {
        this.id_cliente = id_cliente;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalDate getFecha_a_reservar() {
        return fecha_a_reservar;
    }

    public void setFecha_a_reservar(LocalDate fecha_a_reservar) {
        this.fecha_a_reservar = fecha_a_reservar;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

}
