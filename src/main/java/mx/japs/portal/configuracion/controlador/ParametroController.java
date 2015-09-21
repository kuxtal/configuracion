package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.Parametro;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/parametroes")
@Controller
@RooWebScaffold(path = "parametroes", formBackingObject = Parametro.class)
@RooWebJson(jsonObject = Parametro.class)
public class ParametroController {
}
