// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.controlador;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import mx.japs.portal.configuracion.controlador.OperacionController;
import mx.japs.portal.configuracion.modelo.Operacion;
import mx.japs.portal.configuracion.repositorio.OperacionRepository;
import mx.japs.portal.configuracion.repositorio.PerfilRepository;
import mx.japs.portal.configuracion.repositorio.ServicioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect OperacionController_Roo_Controller {
    
    @Autowired
    OperacionRepository OperacionController.operacionRepository;
    
    @Autowired
    PerfilRepository OperacionController.perfilRepository;
    
    @Autowired
    ServicioRepository OperacionController.servicioRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String OperacionController.create(@Valid Operacion operacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, operacion);
            return "operacions/create";
        }
        uiModel.asMap().clear();
        operacionRepository.save(operacion);
        return "redirect:/operacions/" + encodeUrlPathSegment(operacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OperacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Operacion());
        return "operacions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OperacionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("operacion", operacionRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "operacions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String OperacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("operacions", operacionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) operacionRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("operacions", operacionRepository.findAll());
        }
        return "operacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OperacionController.update(@Valid Operacion operacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, operacion);
            return "operacions/update";
        }
        uiModel.asMap().clear();
        operacionRepository.save(operacion);
        return "redirect:/operacions/" + encodeUrlPathSegment(operacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OperacionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, operacionRepository.findOne(id));
        return "operacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OperacionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Operacion operacion = operacionRepository.findOne(id);
        operacionRepository.delete(operacion);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/operacions";
    }
    
    void OperacionController.populateEditForm(Model uiModel, Operacion operacion) {
        uiModel.addAttribute("operacion", operacion);
        uiModel.addAttribute("perfils", perfilRepository.findAll());
        uiModel.addAttribute("servicios", servicioRepository.findAll());
    }
    
    String OperacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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