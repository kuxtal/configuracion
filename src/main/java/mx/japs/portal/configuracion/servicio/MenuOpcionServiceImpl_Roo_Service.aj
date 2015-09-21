// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.servicio;

import java.util.List;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import mx.japs.portal.configuracion.repositorio.MenuOpcionRepository;
import mx.japs.portal.configuracion.servicio.MenuOpcionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MenuOpcionServiceImpl_Roo_Service {
    
    declare @type: MenuOpcionServiceImpl: @Service;
    
    declare @type: MenuOpcionServiceImpl: @Transactional;
    
    @Autowired
    MenuOpcionRepository MenuOpcionServiceImpl.menuOpcionRepository;
    
    public long MenuOpcionServiceImpl.countAllMenuOpcions() {
        return menuOpcionRepository.count();
    }
    
    public void MenuOpcionServiceImpl.deleteMenuOpcion(MenuOpcion menuOpcion) {
        menuOpcionRepository.delete(menuOpcion);
    }
    
    public MenuOpcion MenuOpcionServiceImpl.findMenuOpcion(Long id) {
        return menuOpcionRepository.findOne(id);
    }
    
    public List<MenuOpcion> MenuOpcionServiceImpl.findAllMenuOpcions() {
        return menuOpcionRepository.findAll();
    }
    
    public List<MenuOpcion> MenuOpcionServiceImpl.findMenuOpcionEntries(int firstResult, int maxResults) {
        return menuOpcionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void MenuOpcionServiceImpl.saveMenuOpcion(MenuOpcion menuOpcion) {
        menuOpcionRepository.save(menuOpcion);
    }
    
    public MenuOpcion MenuOpcionServiceImpl.updateMenuOpcion(MenuOpcion menuOpcion) {
        return menuOpcionRepository.save(menuOpcion);
    }
    
}
