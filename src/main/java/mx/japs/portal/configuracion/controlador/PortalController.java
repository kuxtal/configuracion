package mx.japs.portal.configuracion.controlador;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import mx.japs.portal.configuracion.modelo.Modulo;
import mx.japs.portal.configuracion.modelo.Parametro;
import mx.japs.portal.configuracion.modelo.Perfil;
import mx.japs.portal.configuracion.modelo.Portal;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import flexjson.JSONSerializer;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanComparator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;

@RequestMapping("/portals")
@Controller
@RooWebScaffold(path = "portals", formBackingObject = Portal.class)
@RooWebJson(jsonObject = Portal.class)
public class PortalController {
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/{id}/menu", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> menuJson(@PathVariable("id") Long idPortal, @RequestParam Map<String,String> jsonParams) {
		logger.debug("jsonParams : {}", jsonParams);
		logger.debug("idPortal : {}", idPortal);
		
		HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-Type", "application/json; charset=utf-8");
	    
	    try {
	    	Portal portal = portalRepository.findOne(idPortal);
	    	
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
	    		
	    		List<MenuOpcion> opciones = new ArrayList(modulo.getOpciones());
	    		BeanComparator bc = new BeanComparator("orden");
	    		Collections.sort(opciones, bc);
	    		for(MenuOpcion opcion : opciones){

	    			listaSubMenu = new LinkedList();
	    			
	    			List<MenuOpcion> subOpciones = new ArrayList(opcion.getOpciones());
	    			Collections.sort(subOpciones, bc);
	    			for(MenuOpcion opcionHijo : subOpciones){
	    				hashSubMenu = new HashMap();
	    				hashSubMenu.put("texto", opcionHijo.getTexto());

    					String url = portal.getUrl() + modulo.getUrl() + opcionHijo.getUrl();
	    				hashSubMenu.put("url", url);

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
	
	@RequestMapping(value = "/{id}/parametros", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> parametrosJson(@PathVariable("id") Long idPortal, @RequestParam Map<String,String> jsonParams) {
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            List<Parametro> result = parametroRepository.findByPortal_Id(idPortal);
            return new ResponseEntity<String>(Parametro.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	@RequestMapping(value = "/{id}/modulos", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> modulosJson(@PathVariable("id") Long idPortal, @RequestParam Map<String,String> jsonParams) {
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            List<Modulo> result = moduloRepository.findByPortal_Id(idPortal);
            return new ResponseEntity<String>(Modulo.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	@RequestMapping(value = "/{id}/perfiles", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseEntity<String> perfilesJson(@PathVariable("id") Long idPortal, @RequestParam Map<String,String> jsonParams) {
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        try {
            List<Perfil> result = perfilRepository.findByPortal_Id(idPortal);
            return new ResponseEntity<String>(Perfil.toJsonArray(result), headers, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<String>("{\"ERROR\":"+e.getMessage()+"\"}", headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
}
