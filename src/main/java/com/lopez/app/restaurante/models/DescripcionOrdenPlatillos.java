package com.lopez.app.restaurante.models;

public class DescripcionOrdenPlatillos {
    Platillo platillo;
    Ordenar orden;
    DescripcioOrden descripcio;
    Mesa mesa;
    Mesero mesero;

    public Platillo getPlatillo() {
        return platillo;
    }

    public Mesa getMesa() {
        return mesa;
    }

    public void setMesa(Mesa mesa) {
        this.mesa = mesa;
    }

    public Mesero getMesero() {
        return mesero;
    }

    public void setMesero(Mesero mesero) {
        this.mesero = mesero;
    }

    public void setPlatillo(Platillo platillo) {
        this.platillo = platillo;
    }

    public Ordenar getOrden() {
        return orden;
    }

    public void setOrden(Ordenar orden) {
        this.orden = orden;
    }

    public DescripcioOrden getDescripcio() {
        return descripcio;
    }

    public void setDescripcio(DescripcioOrden descripcio) {
        this.descripcio = descripcio;
    }

}
