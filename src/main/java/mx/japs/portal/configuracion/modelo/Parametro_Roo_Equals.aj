// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import mx.japs.portal.configuracion.modelo.Parametro;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Parametro_Roo_Equals {
    
    public boolean Parametro.equals(Object obj) {
        if (!(obj instanceof Parametro)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Parametro rhs = (Parametro) obj;
        return new EqualsBuilder().append(descripcion, rhs.descripcion).append(grupo, rhs.grupo).append(id, rhs.id).append(nombre, rhs.nombre).append(portal, rhs.portal).append(valor, rhs.valor).isEquals();
    }
    
    public int Parametro.hashCode() {
        return new HashCodeBuilder().append(descripcion).append(grupo).append(id).append(nombre).append(portal).append(valor).toHashCode();
    }
    
}
