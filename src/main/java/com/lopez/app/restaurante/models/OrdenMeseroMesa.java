package com.lopez.app.restaurante.models;

public class OrdenMeseroMesa {
    Ordenar ordenar;
    Mesero mesero;
    Mesa mesa;

    public Ordenar getOrdenar() {
        return ordenar;
    }

    public void setOrdenar(Ordenar ordenar) {
        this.ordenar = ordenar;
    }

    public Mesero getMesero() {
        return mesero;
    }

    public void setMesero(Mesero mesero) {
        this.mesero = mesero;
    }

    public Mesa getMesa() {
        return mesa;
    }

    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }

}
