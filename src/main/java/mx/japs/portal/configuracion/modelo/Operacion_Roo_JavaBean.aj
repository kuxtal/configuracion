// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import java.util.Set;
import mx.japs.portal.configuracion.modelo.Operacion;
import mx.japs.portal.configuracion.modelo.Perfil;
import mx.japs.portal.configuracion.modelo.Servicio;

privileged aspect Operacion_Roo_JavaBean {
    
    public String Operacion.getNombre() {
        return this.nombre;
    }
    
    public void Operacion.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Operacion.getDescripcion() {
        return this.descripcion;
    }
    
    public void Operacion.setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String Operacion.getUrl() {
        return this.url;
    }
    
    public void Operacion.setUrl(String url) {
        this.url = url;
    }
    
    public Servicio Operacion.getServicio() {
        return this.servicio;
    }
    
    public void Operacion.setServicio(Servicio servicio) {
        this.servicio = servicio;
    }
    
    public Set<Perfil> Operacion.getPerfiles() {
        return this.perfiles;
    }
    
    public void Operacion.setPerfiles(Set<Perfil> perfiles) {
        this.perfiles = perfiles;
    }
    
}
