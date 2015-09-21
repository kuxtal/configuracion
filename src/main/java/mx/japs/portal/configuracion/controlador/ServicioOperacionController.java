package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.ServicioOperacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/serviciooperacions")
@Controller
@RooWebScaffold(path = "serviciooperacions", formBackingObject = ServicioOperacion.class)
@RooWebJson(jsonObject = ServicioOperacion.class)
public class ServicioOperacionController {
}
