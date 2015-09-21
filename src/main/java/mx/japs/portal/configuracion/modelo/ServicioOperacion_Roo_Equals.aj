// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import mx.japs.portal.configuracion.modelo.ServicioOperacion;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ServicioOperacion_Roo_Equals {
    
    public boolean ServicioOperacion.equals(Object obj) {
        if (!(obj instanceof ServicioOperacion)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ServicioOperacion rhs = (ServicioOperacion) obj;
        return new EqualsBuilder().append(descripcion, rhs.descripcion).append(id, rhs.id).append(nombre, rhs.nombre).append(servicio, rhs.servicio).append(url, rhs.url).isEquals();
    }
    
    public int ServicioOperacion.hashCode() {
        return new HashCodeBuilder().append(descripcion).append(id).append(nombre).append(servicio).append(url).toHashCode();
    }
    
}