// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import mx.japs.portal.configuracion.modelo.Servicio;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Servicio_Roo_Equals {
    
    public boolean Servicio.equals(Object obj) {
        if (!(obj instanceof Servicio)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Servicio rhs = (Servicio) obj;
        return new EqualsBuilder().append(descripcion, rhs.descripcion).append(id, rhs.id).append(nombre, rhs.nombre).append(portal, rhs.portal).append(url, rhs.url).isEquals();
    }
    
    public int Servicio.hashCode() {
        return new HashCodeBuilder().append(descripcion).append(id).append(nombre).append(portal).append(url).toHashCode();
    }
    
}
