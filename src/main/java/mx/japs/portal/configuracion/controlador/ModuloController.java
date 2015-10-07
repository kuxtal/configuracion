package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.Modulo;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/moduloes")
@Controller
@RooWebScaffold(path = "moduloes", formBackingObject = Modulo.class)
@RooWebJson(jsonObject = Modulo.class)
public class ModuloController {
}
