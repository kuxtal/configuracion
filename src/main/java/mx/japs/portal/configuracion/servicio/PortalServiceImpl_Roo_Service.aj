// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.servicio;

import java.util.List;
import mx.japs.portal.configuracion.modelo.Portal;
import mx.japs.portal.configuracion.repositorio.PortalRepository;
import mx.japs.portal.configuracion.servicio.PortalServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PortalServiceImpl_Roo_Service {
    
    declare @type: PortalServiceImpl: @Service;
    
    declare @type: PortalServiceImpl: @Transactional;
    
    @Autowired
    PortalRepository PortalServiceImpl.portalRepository;
    
    public long PortalServiceImpl.countAllPortals() {
        return portalRepository.count();
    }
    
    public void PortalServiceImpl.deletePortal(Portal portal) {
        portalRepository.delete(portal);
    }
    
    public Portal PortalServiceImpl.findPortal(Long id) {
        return portalRepository.findOne(id);
    }
    
    public List<Portal> PortalServiceImpl.findAllPortals() {
        return portalRepository.findAll();
    }
    
    public List<Portal> PortalServiceImpl.findPortalEntries(int firstResult, int maxResults) {
        return portalRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void PortalServiceImpl.savePortal(Portal portal) {
        portalRepository.save(portal);
    }
    
    public Portal PortalServiceImpl.updatePortal(Portal portal) {
        return portalRepository.save(portal);
    }
    
}
