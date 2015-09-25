// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.controlador;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import mx.japs.portal.configuracion.controlador.ModuloController;
import mx.japs.portal.configuracion.modelo.Modulo;
import mx.japs.portal.configuracion.repositorio.MenuOpcionRepository;
import mx.japs.portal.configuracion.repositorio.ModuloRepository;
import mx.japs.portal.configuracion.repositorio.PortalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ModuloController_Roo_Controller {
    
    @Autowired
    ModuloRepository ModuloController.moduloRepository;
    
    @Autowired
    MenuOpcionRepository ModuloController.menuOpcionRepository;
    
    @Autowired
    PortalRepository ModuloController.portalRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ModuloController.create(@Valid Modulo modulo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, modulo);
            return "moduloes/create";
        }
        uiModel.asMap().clear();
        moduloRepository.save(modulo);
        return "redirect:/moduloes/" + encodeUrlPathSegment(modulo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ModuloController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Modulo());
        return "moduloes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ModuloController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("modulo", moduloRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "moduloes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ModuloController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("moduloes", moduloRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) moduloRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("moduloes", moduloRepository.findAll());
        }
        return "moduloes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ModuloController.update(@Valid Modulo modulo, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, modulo);
            return "moduloes/update";
        }
        uiModel.asMap().clear();
        moduloRepository.save(modulo);
        return "redirect:/moduloes/" + encodeUrlPathSegment(modulo.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ModuloController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, moduloRepository.findOne(id));
        return "moduloes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ModuloController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Modulo modulo = moduloRepository.findOne(id);
        moduloRepository.delete(modulo);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/moduloes";
    }
    
    void ModuloController.populateEditForm(Model uiModel, Modulo modulo) {
        uiModel.addAttribute("modulo", modulo);
        uiModel.addAttribute("menuopcions", menuOpcionRepository.findAll());
        uiModel.addAttribute("portals", portalRepository.findAll());
    }
    
    String ModuloController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
