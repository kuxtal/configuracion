// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import java.util.Set;
import mx.japs.portal.configuracion.modelo.Portal;
import mx.japs.portal.configuracion.modelo.Servicio;
import mx.japs.portal.configuracion.modelo.ServicioOperacion;

privileged aspect Servicio_Roo_JavaBean {
    
    public String Servicio.getNombre() {
        return this.nombre;
    }
    
    public void Servicio.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Servicio.getDescripcion() {
        return this.descripcion;
    }
    
    public void Servicio.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String Servicio.getUrl() {
        return this.url;
    }
    
    public void Servicio.setUrl(String url) {
        this.url = url;
    }
    
    public Set<ServicioOperacion> Servicio.getOperaciones() {
        return this.operaciones;
    }
    
    public void Servicio.setOperaciones(Set<ServicioOperacion> operaciones) {
        this.operaciones = operaciones;
    }
    
    public Portal Servicio.getPortal() {
        return this.portal;
    }
    
    public void Servicio.setPortal(Portal portal) {
        this.portal = portal;
    }
    
}