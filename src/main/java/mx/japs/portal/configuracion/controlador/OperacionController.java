package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.Operacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/operacions")
@Controller
@RooWebScaffold(path = "operacions", formBackingObject = Operacion.class)
@RooWebJson(jsonObject = Operacion.class)
public class OperacionController {
}
