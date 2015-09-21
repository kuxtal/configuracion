// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.controlador;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import mx.japs.portal.configuracion.controlador.ServicioOperacionController;
import mx.japs.portal.configuracion.modelo.ServicioOperacion;
import mx.japs.portal.configuracion.servicio.ServicioOperacionService;
import mx.japs.portal.configuracion.servicio.ServicioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ServicioOperacionController_Roo_Controller {
    
    @Autowired
    ServicioOperacionService ServicioOperacionController.servicioOperacionService;
    
    @Autowired
    ServicioService ServicioOperacionController.servicioService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ServicioOperacionController.create(@Valid ServicioOperacion servicioOperacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, servicioOperacion);
            return "serviciooperacions/create";
        }
        uiModel.asMap().clear();
        servicioOperacionService.saveServicioOperacion(servicioOperacion);
        return "redirect:/serviciooperacions/" + encodeUrlPathSegment(servicioOperacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ServicioOperacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ServicioOperacion());
        return "serviciooperacions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ServicioOperacionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("serviciooperacion", servicioOperacionService.findServicioOperacion(id));
        uiModel.addAttribute("itemId", id);
        return "serviciooperacions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ServicioOperacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("serviciooperacions", servicioOperacionService.findServicioOperacionEntries(firstResult, sizeNo));
            float nrOfPages = (float) servicioOperacionService.countAllServicioOperacions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("serviciooperacions", servicioOperacionService.findAllServicioOperacions());
        }
        return "serviciooperacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ServicioOperacionController.update(@Valid ServicioOperacion servicioOperacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, servicioOperacion);
            return "serviciooperacions/update";
        }
        uiModel.asMap().clear();
        servicioOperacionService.updateServicioOperacion(servicioOperacion);
        return "redirect:/serviciooperacions/" + encodeUrlPathSegment(servicioOperacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ServicioOperacionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, servicioOperacionService.findServicioOperacion(id));
        return "serviciooperacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ServicioOperacionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ServicioOperacion servicioOperacion = servicioOperacionService.findServicioOperacion(id);
        servicioOperacionService.deleteServicioOperacion(servicioOperacion);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/serviciooperacions";
    }
    
    void ServicioOperacionController.populateEditForm(Model uiModel, ServicioOperacion servicioOperacion) {
        uiModel.addAttribute("servicioOperacion", servicioOperacion);
        uiModel.addAttribute("servicios", servicioService.findAllServicios());
    }
    
    String ServicioOperacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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