// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import mx.japs.portal.configuracion.modelo.Servicio;
import mx.japs.portal.configuracion.modelo.ServicioOperacion;

privileged aspect ServicioOperacion_Roo_JavaBean {
    
    public String ServicioOperacion.getNombre() {
        return this.nombre;
    }
    
    public void ServicioOperacion.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String ServicioOperacion.getDescripcion() {
        return this.descripcion;
    }
    
    public void ServicioOperacion.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String ServicioOperacion.getUrl() {
        return this.url;
    }
    
    public void ServicioOperacion.setUrl(String url) {
        this.url = url;
    }
    
    public Servicio ServicioOperacion.getServicio() {
        return this.servicio;
    }
    
    public void ServicioOperacion.setServicio(Servicio servicio) {
        this.servicio = servicio;
    }
    
}
