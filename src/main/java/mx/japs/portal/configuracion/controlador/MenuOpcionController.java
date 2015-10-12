package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/menuopcions")
@Controller
@RooWebScaffold(path = "menuopcions", formBackingObject = MenuOpcion.class)
@RooWebJson(jsonObject = MenuOpcion.class)
public class MenuOpcionController {
	@RequestMapping(value = "/{id}/menuopciones", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> menuOpcionesJson(@PathVariable("id") Long idMenuOpcion, @RequestParam Map<String,String> jsonParams) {
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            List<MenuOpcion> result = menuOpcionRepository.findByOpcionPadre_Id(idMenuOpcion);
            return new ResponseEntity<String>(MenuOpcion.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
}
