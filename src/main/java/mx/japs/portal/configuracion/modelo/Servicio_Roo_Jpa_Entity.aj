// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;
import mx.japs.portal.configuracion.modelo.Servicio;

privileged aspect Servicio_Roo_Jpa_Entity {
    
    declare @type: Servicio: @Entity;
    
    declare @type: Servicio: @Table(name = "SERVICIO");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Servicio.id;
    
    @Version
    @Column(name = "version")
    private Integer Servicio.version;
    
    public Servicio.new() {
        super();
    }

    public Long Servicio.getId() {
        return this.id;
    }
    
    public void Servicio.setId(Long id) {
        this.id = id;
    }
    
    public Integer Servicio.getVersion() {
        return this.version;
    }
    
    public void Servicio.setVersion(Integer version) {
        this.version = version;
    }
    
}