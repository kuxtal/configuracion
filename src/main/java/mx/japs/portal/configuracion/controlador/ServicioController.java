package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.Servicio;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/servicios")
@Controller
@RooWebScaffold(path = "servicios", formBackingObject = Servicio.class)
@RooWebJson(jsonObject = Servicio.class)
public class ServicioController {
}
