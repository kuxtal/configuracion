// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import mx.japs.portal.configuracion.modelo.Perfil;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Perfil_Roo_Equals {
    
    public boolean Perfil.equals(Object obj) {
        if (!(obj instanceof Perfil)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Perfil rhs = (Perfil) obj;
        return new EqualsBuilder().append(descripcion, rhs.descripcion).append(id, rhs.id).append(nombre, rhs.nombre).append(portal, rhs.portal).isEquals();
    }
    
    public int Perfil.hashCode() {
        return new HashCodeBuilder().append(descripcion).append(id).append(nombre).append(portal).toHashCode();
    }
    
}
