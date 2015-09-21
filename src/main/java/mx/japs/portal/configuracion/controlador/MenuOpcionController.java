package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/menuopcions")
@Controller
@RooWebScaffold(path = "menuopcions", formBackingObject = MenuOpcion.class)
@RooWebJson(jsonObject = MenuOpcion.class)
public class MenuOpcionController {
}
