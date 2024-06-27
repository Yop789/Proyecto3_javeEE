package com.lopez.app.restaurante.models;

import com.lopez.app.restaurante.models.Enum.Estado;

public class Cliente {

    private Long id;
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String telefono;
    private String correo;
    private String calle;
    private Long num_interno;
    private Long num_externo;
    private String colonia;
    private String ciudad;
    private Estado estado;
    private Integer cp;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public Long getNum_interno() {
        return num_interno;
    }

    public void setNum_interno(Long num_interno) {
        this.num_interno = num_interno;
    }

    public Long getNum_externo() {
        return num_externo;
    }

    public void setNum_externo(Long num_externo) {
        this.num_externo = num_externo;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Integer getCp() {
        return cp;
    }

    public void setCp(Integer cp) {
        this.cp = cp;
    }

}
