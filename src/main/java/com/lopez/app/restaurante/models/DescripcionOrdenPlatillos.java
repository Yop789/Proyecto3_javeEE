package com.lopez.app.restaurante.models;

public class DescripcionOrdenPlatillos {
    Platillo platillo;
    Ordenar orden;
    DescripcioOrden descripcio;

    public Platillo getPlatillo() {
        return platillo;
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
