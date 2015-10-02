package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.Perfil;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/perfils")
@Controller
@RooWebScaffold(path = "perfils", formBackingObject = Perfil.class)
@RooWebJson(jsonObject = Perfil.class)
public class PerfilController {
}
