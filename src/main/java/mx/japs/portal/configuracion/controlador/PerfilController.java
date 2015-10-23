package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import mx.japs.portal.configuracion.modelo.Perfil;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/perfils")
@Controller
@RooWebScaffold(path = "perfils", formBackingObject = Perfil.class)
@RooWebJson(jsonObject = Perfil.class)
public class PerfilController {
	@RequestMapping(value = "/{id}/opciones", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> opcionesJson(@PathVariable("id") Long idPerfil, @RequestParam Map<String,String> jsonParams) {
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            Perfil perfil = perfilRepository.findOne(idPerfil);
            if (perfil == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            
            return new ResponseEntity<String>(MenuOpcion.toJsonArray(perfil.getOpciones()), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	@RequestMapping(value = "/{id}/opciones/{idOpcion}", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> updateOpcionesFromJson(@RequestBody String json, @PathVariable("id") Long id, @PathVariable("idOpcion") Long idOpcion) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
        	Perfil perfil = perfilRepository.findOne(id);
        	MenuOpcion menuOpcion = menuOpcionRepository.findOne(idOpcion);
        	
        	if(perfil.getId() != null && menuOpcion.getId() != null)
        		perfil.getOpciones().add(menuOpcion);
        	
            if (perfilRepository.save(perfil) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
	@RequestMapping(value = "/{id}/opciones/{idOpcion}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> deleteOpcionesFromJson(@RequestBody String json, @PathVariable("id") Long id, @PathVariable("idOpcion") Long idOpcion) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        try {
        	Perfil perfil = perfilRepository.findOne(id);
        	MenuOpcion menuOpcion = menuOpcionRepository.findOne(idOpcion);
        	
        	if(perfil.getId() != null && menuOpcion.getId() != null)
        		perfil.getOpciones().remove(menuOpcion);
        	
            if (perfilRepository.save(perfil) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
            return new ResponseEntity<String>(headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
