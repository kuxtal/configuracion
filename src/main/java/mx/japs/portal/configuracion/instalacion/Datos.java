package mx.japs.portal.configuracion.instalacion;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mx.japs.portal.configuracion.modelo.MenuOpcion;
import mx.japs.portal.configuracion.modelo.Modulo;
import mx.japs.portal.configuracion.modelo.Parametro;
import mx.japs.portal.configuracion.modelo.Portal;
import mx.japs.portal.configuracion.modelo.Perfil;
import mx.japs.portal.configuracion.repositorio.MenuOpcionRepository;
import mx.japs.portal.configuracion.repositorio.ModuloRepository;
import mx.japs.portal.configuracion.repositorio.ParametroRepository;
import mx.japs.portal.configuracion.repositorio.PortalRepository;
import mx.japs.portal.configuracion.repositorio.PerfilRepository;

@Component
public class Datos {
	private static final Logger logger = LoggerFactory.getLogger(Datos.class);

	@Autowired
	private PortalRepository portal_repository;

	@Autowired
	private ParametroRepository param_repository;
	
	@Autowired
	private ModuloRepository modulo_repository;
	
	@Autowired
	private MenuOpcionRepository menuOpcion_repository;

	@Autowired
	private PerfilRepository perfil_repository;

	@PostConstruct
	public void seedData() {
		logger.info("Inicializando Base de Datos");
		
		if (0 == portal_repository.count()) {
			logger.info("No existe informacion en la Base de Datos");
			
			Portal portalConfiguracion = new Portal("Configuracion", "Portal de Configuracion", "/configuracion");
			portal_repository.save(portalConfiguracion);

			Parametro param01 = new Parametro("configuracion", "ip_principal", "localhost", "");
			Parametro param02 = new Parametro("configuracion", "ip_secundaria", "localhost", "");
			Parametro param03 = new Parametro("configuracion", "ip_logs", "localhost", "");
			
			param01.setPortal(portalConfiguracion);
			param02.setPortal(portalConfiguracion);
			param03.setPortal(portalConfiguracion);
			
			param01 = param_repository.save(param01);
			param02 = param_repository.save(param02);
			param03 = param_repository.save(param03);

			Modulo moduloInicio = new Modulo("Inicio", "Inicio", "/inicio");
			moduloInicio.setPortal(portalConfiguracion);
			modulo_repository.save(moduloInicio);
			
			Modulo moduloAdmin = new Modulo("Administracion", "Modulo de Administracion", "/administracion");
			moduloAdmin.setPortal(portalConfiguracion);
			modulo_repository.save(moduloAdmin);

			MenuOpcion menuAdmin = new MenuOpcion("MenuAdministracion", "Administracion", "#", 1);
			menuAdmin.setModulo(moduloAdmin);
			menuOpcion_repository.save(menuAdmin);
			
			MenuOpcion opcion01 = new MenuOpcion("Portal", "Portales", "/portal", 2);
			opcion01.setOpcionPadre(menuAdmin);
			
			MenuOpcion opcion02 = new MenuOpcion("Parametro", "Parametros", "/parametro", 3);
			opcion02.setOpcionPadre(menuAdmin);
			
			MenuOpcion opcion03 = new MenuOpcion("Modulo", "Modulos", "/modulo", 4);
			opcion03.setOpcionPadre(menuAdmin);
			
			MenuOpcion opcion05 = new MenuOpcion("Perfil", "Perfiles", "/perfil",  5);
			opcion05.setOpcionPadre(menuAdmin);
			
			menuOpcion_repository.save(opcion01);
			menuOpcion_repository.save(opcion02);
			menuOpcion_repository.save(opcion03);
			menuOpcion_repository.save(opcion05);

			Portal portalPrueba01 = portal_repository.save(new Portal("Portal Prueba 01", "Portal Prueba 01", "/portal01"));
			Portal portalPrueba02 = portal_repository.save(new Portal("Portal Prueba 02", "Portal Prueba 02", "/portal02"));

			moduloAdmin = new Modulo("Catalogos", "Catalogos Generales", "/catalogos");
			moduloAdmin.setPortal(portalPrueba01);
			modulo_repository.save(moduloAdmin);

			menuAdmin = new MenuOpcion("MenuCatalogosGenerales", "Generales", "#", 1);
			menuAdmin.setModulo(moduloAdmin);
			menuOpcion_repository.save(menuAdmin);

			opcion01 = new MenuOpcion("TipoPieza", "Tipo Pieza", "/tipo_pieza", 2);
			opcion01.setOpcionPadre(menuAdmin);
			menuOpcion_repository.save(opcion01);

			Perfil perfilAdmin = new Perfil("Administrador", "Perfil Administrador");
			perfilAdmin.setPortal(portalConfiguracion);
			perfil_repository.save(perfilAdmin);
		}
	}
}