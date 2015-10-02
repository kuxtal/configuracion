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
import mx.japs.portal.configuracion.modelo.Servicio;
import mx.japs.portal.configuracion.modelo.Operacion;
import mx.japs.portal.configuracion.repositorio.MenuOpcionRepository;
import mx.japs.portal.configuracion.repositorio.ModuloRepository;
import mx.japs.portal.configuracion.repositorio.ParametroRepository;
import mx.japs.portal.configuracion.repositorio.PortalRepository;
import mx.japs.portal.configuracion.repositorio.OperacionRepository;
import mx.japs.portal.configuracion.repositorio.ServicioRepository;

@Component
public class Datos {
	private static final Logger logger = LoggerFactory.getLogger(Datos.class);

	@Autowired
	private PortalRepository portal_repository;

	@Autowired
	private ServicioRepository servicio_repository;

	@Autowired
	private OperacionRepository servicioOp_repository;
	
	@Autowired
	private ParametroRepository param_repository;
	
	@Autowired
	private ModuloRepository modulo_repository;
	
	@Autowired
	private MenuOpcionRepository menuOpcion_repository;

	@PostConstruct
	public void seedData() {
		logger.info("Inicializando Base de Datos");
		
		if (0 == portal_repository.count()) {
			logger.info("No existe informacion en la Base de Datos");
			
			Portal portalConfiguracion = new Portal("Configuracion", "Portal de Configuracion", "/configuracion");
			portal_repository.save(portalConfiguracion);

			Parametro param01 = new Parametro("configuracion", "IP_01", "localhost", "");
			Parametro param02 = new Parametro("configuracion", "IP_02", "localhost", "");
			Parametro param03 = new Parametro("configuracion", "IP_03", "localhost", "");
			
			param01.setPortal(portalConfiguracion);
			param02.setPortal(portalConfiguracion);
			param03.setPortal(portalConfiguracion);
			
			param01 = param_repository.save(param01);
			param02 = param_repository.save(param02);
			param03 = param_repository.save(param03);

			// Servicios
			Servicio servicioPortal = new Servicio("Portal", "Portal", "/portals");
			servicioPortal.setPortal(portalConfiguracion);
			servicioPortal = servicio_repository.save(servicioPortal);
			
			Servicio servicioModulo = new Servicio("Modulo", "Modulo", "/moduloes");
			servicioModulo.setPortal(portalConfiguracion);
			servicioModulo = servicio_repository.save(servicioModulo);
			
			Servicio servicioParametro = new Servicio("Parametro", "Parametro", "/parametroes");
			servicioParametro.setPortal(portalConfiguracion);
			servicioParametro = servicio_repository.save(servicioParametro);
			
			Servicio servicioServicio = new Servicio("Servicio", "Servicio", "/servicios");
			servicioParametro.setPortal(portalConfiguracion);
			servicioParametro = servicio_repository.save(servicioParametro);
			
			// Operaciones
			Operacion operacionPortalList = new Operacion("Portal_list", "Controlador Portal Listar", "/");
			operacionPortalList.setServicio(servicioPortal);
			servicioOp_repository.save(operacionPortalList);
			
			Operacion operacionPortalShow = new Operacion("Portal_show", "Controlador Portal Registro", "/");
			operacionPortalShow.setServicio(servicioPortal);
			servicioOp_repository.save(operacionPortalShow);
			
			Operacion operacionPortalUpdateForm = new Operacion("Portal_updateForm", "Controlador Update Form", "/");
			operacionPortalUpdateForm.setServicio(servicioPortal);
			servicioOp_repository.save(operacionPortalUpdateForm);
			
			Operacion operacionParametroList = new Operacion("Parametro_list", "Operacion Parametro Listar", "/");
			operacionParametroList.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroList);
			
			Operacion operacionParametroShow = new Operacion("Parametro_show", "Operacion Parametro Registro", "/");
			operacionParametroShow.setServicio(servicioPortal);
			servicioOp_repository.save(operacionParametroShow);
			
			Operacion operacionParametroUpdateForm = new Operacion("Parametro_updateForm", "Operacion Parametro Formulario Actualizar", "/");
			operacionParametroUpdateForm.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroUpdateForm);
			
			Operacion operacionParametroCreateForm = new Operacion("Parametro_createForm", "Operacion Parametro Formulario Crear", "/?form");
			operacionParametroCreateForm.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroCreateForm);
			
			Operacion operacionParametroUpdate = new Operacion("Parametro_update", "Operacion Parametro Actualizar", "/");
			operacionParametroUpdate.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroUpdate);
			
			Operacion operacionParametroCreate = new Operacion("Parametro_create", "Operacion Parametro Crear", "/?form");
			operacionParametroCreate.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroCreate);
			
			Operacion operacionModuloList = new Operacion("Modulo_list", "Operacion Modulo Listar", "/");
			operacionModuloList.setServicio(servicioModulo);
			servicioOp_repository.save(operacionModuloList);
			
			Modulo moduloInicio = new Modulo("Inicio", "Inicio", "/inicio");
			moduloInicio.setPortal(portalConfiguracion);
			modulo_repository.save(moduloInicio);
			
			Modulo moduloAdmin = new Modulo("Administracion", "Modulo de Administracion", "/administracion");
			moduloAdmin.setPortal(portalConfiguracion);
			modulo_repository.save(moduloAdmin);

			MenuOpcion menuAdmin = new MenuOpcion("MenuAdministracion", "Administracion", 1);
			menuAdmin.setModulo(moduloAdmin);
			menuOpcion_repository.save(menuAdmin);
			
			MenuOpcion opcion01 = new MenuOpcion("Portal", "Portales", 2);
			opcion01.setOpcionPadre(menuAdmin);
			opcion01.setOperacion(operacionPortalList);
			
			MenuOpcion opcion02 = new MenuOpcion("Parametro", "Parametros", 3);
			opcion02.setOpcionPadre(menuAdmin);
			opcion02.setOperacion(operacionParametroList);
			
			MenuOpcion opcion03 = new MenuOpcion("Modulo", "Modulos", 4);
			opcion03.setOpcionPadre(menuAdmin);
			opcion02.setOperacion(operacionParametroList);
			
			MenuOpcion opcion05 = new MenuOpcion("Servicio", "Servicios", 5);
			opcion05.setOpcionPadre(menuAdmin);
			opcion02.setOperacion(operacionParametroList);
			
			menuOpcion_repository.save(opcion01);
			menuOpcion_repository.save(opcion02);
			menuOpcion_repository.save(opcion03);
			menuOpcion_repository.save(opcion05);

			Portal portalPrueba01 = portal_repository.save(new Portal("Portal Prueba 01", "Portal Prueba 01", "/portal01"));
			Portal portalPrueba02 = portal_repository.save(new Portal("Portal Prueba 02", "Portal Prueba 02", "/portal02"));

			moduloAdmin = new Modulo("Catalogos", "Catalogos Generales", "/catalogos");
			moduloAdmin.setPortal(portalPrueba01);
			modulo_repository.save(moduloAdmin);

			menuAdmin = new MenuOpcion("MenuCatalogosGenerales", "Generales", 1);
			menuAdmin.setModulo(moduloAdmin);
			menuOpcion_repository.save(menuAdmin);

			opcion01 = new MenuOpcion("TipoPieza", "Tipo Pieza", 2);
			opcion01.setOpcionPadre(menuAdmin);
			menuOpcion_repository.save(opcion01);
		}
	}
}