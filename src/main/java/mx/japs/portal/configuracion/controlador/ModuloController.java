package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import mx.japs.portal.configuracion.modelo.Modulo;
import mx.japs.portal.configuracion.modelo.Portal;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import flexjson.JSONSerializer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/moduloes")
@Controller
@RooWebScaffold(path = "moduloes", formBackingObject = Modulo.class)
@RooWebJson(jsonObject = Modulo.class)
public class ModuloController {
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(headers = "Accept=application/json", value = "/menuJson", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> menuJson(@RequestParam(value = "idPortal", required = true) Long idPortal, @RequestParam Map<String,String> jsonParams) {
		logger.debug("jsonParams : {}", jsonParams);
		logger.debug("idPortal : {}", idPortal);
		
		HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json; charset=utf-8");
	    
	    try {
	    	Portal portal = portalService.findPortal(idPortal);
	    	
	    	List<Modulo> modulos = new ArrayList(portal.getModulos());
	    	logger.info("listaModulos.size : {}", modulos.size());
	    	
	    	String menu = "";
	    	
	    	HashMap hash_menu = new HashMap();
	    	LinkedList listaModulos = new LinkedList();
	    	LinkedList listaMenu;
	    	LinkedList listaSubMenu;
	    	
	    	HashMap hashModulo;
	    	HashMap hashMenu;
	    	HashMap hashSubMenu;
	    	
	    	for(Modulo modulo : modulos){
	    		logger.info("Modulo {} opciones {}", modulo.getNombre(), modulo.getOpciones().size());

	    		listaMenu = new LinkedList();
	    		for(MenuOpcion opcion : modulo.getOpciones()){

	    			listaSubMenu = new LinkedList();
	    			for(MenuOpcion opcionHijo : opcion.getOpciones()){
	    				hashSubMenu = new HashMap();
	    				hashSubMenu.put("texto", opcionHijo.getTexto());
	    				hashSubMenu.put("url", opcionHijo.getUrl());
	    				logger.debug("hashSubMenu : {}", hashSubMenu);
	    				
	    				listaSubMenu.add(hashSubMenu);
		    			
	    			}
	    			hashMenu = new HashMap(); 
	    			hashMenu.put("texto", opcion.getTexto());
	    			hashMenu.put("url", opcion.getUrl());
	    			hashMenu.put("subMenu", listaSubMenu);
	    			logger.debug("hashMenu : {}", hashMenu);
	    			
	    			listaMenu.add(hashMenu);
	    		}
	    		hashModulo = new HashMap();
	    		hashModulo.put("texto", modulo.getNombre());
	    		hashModulo.put("url", modulo.getPortal().getUrl().concat(modulo.getUrl()));
	    		hashModulo.put("menu", listaMenu);
	    		logger.debug("hashModulo : {}", hashModulo);
	    		
	    		listaModulos.add(hashModulo);
	    	}
	    	
	    	logger.info("listaModulos : {}", listaModulos);
	    	menu = new JSONSerializer().deepSerialize(listaModulos); 
	    	
	    	return new ResponseEntity<String>(menu, headers, HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
}
