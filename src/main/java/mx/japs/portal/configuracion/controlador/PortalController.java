package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.Portal;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/portals")
@Controller
@RooWebScaffold(path = "portals", formBackingObject = Portal.class)
@RooWebJson(jsonObject = Portal.class)
public class PortalController {
}
