// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.controlador;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import mx.japs.portal.configuracion.controlador.ParametroController;
import mx.japs.portal.configuracion.modelo.Parametro;
import mx.japs.portal.configuracion.repositorio.ParametroRepository;
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

privileged aspect ParametroController_Roo_Controller {
    
    @Autowired
    ParametroRepository ParametroController.parametroRepository;
    
    @Autowired
    PortalRepository ParametroController.portalRepository;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ParametroController.create(@Valid Parametro parametro, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, parametro);
            return "parametroes/create";
        }
        uiModel.asMap().clear();
        parametroRepository.save(parametro);
        return "redirect:/parametroes/" + encodeUrlPathSegment(parametro.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ParametroController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Parametro());
        return "parametroes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ParametroController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("parametro", parametroRepository.findOne(id));
        uiModel.addAttribute("itemId", id);
        return "parametroes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ParametroController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("parametroes", parametroRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
            float nrOfPages = (float) parametroRepository.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("parametroes", parametroRepository.findAll());
        }
        return "parametroes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ParametroController.update(@Valid Parametro parametro, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, parametro);
            return "parametroes/update";
        }
        uiModel.asMap().clear();
        parametroRepository.save(parametro);
        return "redirect:/parametroes/" + encodeUrlPathSegment(parametro.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ParametroController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, parametroRepository.findOne(id));
        return "parametroes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ParametroController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Parametro parametro = parametroRepository.findOne(id);
        parametroRepository.delete(parametro);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/parametroes";
    }
    
    void ParametroController.populateEditForm(Model uiModel, Parametro parametro) {
        uiModel.addAttribute("parametro", parametro);
        uiModel.addAttribute("portals", portalRepository.findAll());
    }
    
    String ParametroController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
