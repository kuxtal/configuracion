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
import mx.japs.portal.configuracion.modelo.ServicioOperacion;
import mx.japs.portal.configuracion.repositorio.MenuOpcionRepository;
import mx.japs.portal.configuracion.repositorio.ModuloRepository;
import mx.japs.portal.configuracion.repositorio.ParametroRepository;
import mx.japs.portal.configuracion.repositorio.PortalRepository;
import mx.japs.portal.configuracion.repositorio.ServicioOperacionRepository;
import mx.japs.portal.configuracion.repositorio.ServicioRepository;

@Component
public class Datos {
	private static final Logger logger = LoggerFactory.getLogger(Datos.class);

	@Autowired
	private PortalRepository portal_repository;

	@Autowired
	private ServicioRepository servicio_repository;

	@Autowired
	private ServicioOperacionRepository servicioOp_repository;
	
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
			
			Portal portalConfiguracion = new Portal("Configuracion", "Portal de Configuracion", "/configuracion", "http://localhost\\:8080/roo_rest/");
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
			Servicio servicioPortal = new Servicio("Portal", "Controlador UI Portal", "/servicios");
			servicioPortal.setPortal(portalConfiguracion);
			servicioPortal = servicio_repository.save(servicioPortal);
			
			Servicio servicioModulo = new Servicio("Modulo", "Modulo", "/moduloes");
			servicioModulo.setPortal(portalConfiguracion);
			servicioModulo = servicio_repository.save(servicioModulo);
			
			Servicio servicioParametro = new Servicio("Parametro", "Controlador UI Parametro", "/parametroes");
			servicioParametro.setPortal(portalConfiguracion);
			servicioParametro = servicio_repository.save(servicioParametro);
			
			// Operaciones
			ServicioOperacion operacionPortalList = new ServicioOperacion("Portal_list", "Controlador Portal Listar", "/");
			operacionPortalList.setServicio(servicioPortal);
			servicioOp_repository.save(operacionPortalList);
			
			ServicioOperacion operacionPortalShow = new ServicioOperacion("Portal_show", "Controlador Portal Registro", "/");
			operacionPortalShow.setServicio(servicioPortal);
			servicioOp_repository.save(operacionPortalShow);
			
			ServicioOperacion operacionPortalUpdateForm = new ServicioOperacion("Portal_updateForm", "Controlador Update Form", "/");
			operacionPortalUpdateForm.setServicio(servicioPortal);
			servicioOp_repository.save(operacionPortalUpdateForm);
			
			ServicioOperacion operacionParametroList = new ServicioOperacion("Parametro_list", "Operacion Parametro Listar", "/");
			operacionParametroList.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroList);
			
			ServicioOperacion operacionParametroShow = new ServicioOperacion("Parametro_show", "Operacion Parametro Registro", "/");
			operacionParametroShow.setServicio(servicioPortal);
			servicioOp_repository.save(operacionParametroShow);
			
			ServicioOperacion operacionParametroUpdateForm = new ServicioOperacion("Parametro_updateForm", "Operacion Parametro Formulario Actualizar", "/");
			operacionParametroUpdateForm.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroUpdateForm);
			
			ServicioOperacion operacionParametroCreateForm = new ServicioOperacion("Parametro_createForm", "Operacion Parametro Formulario Crear", "/?form");
			operacionParametroCreateForm.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroCreateForm);
			
			ServicioOperacion operacionParametroUpdate = new ServicioOperacion("Parametro_update", "Operacion Parametro Actualizar", "/");
			operacionParametroUpdate.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroUpdate);
			
			ServicioOperacion operacionParametroCreate = new ServicioOperacion("Parametro_create", "Operacion Parametro Crear", "/?form");
			operacionParametroCreate.setServicio(servicioParametro);
			servicioOp_repository.save(operacionParametroCreate);
			
			ServicioOperacion operacionModuloList = new ServicioOperacion("Modulo_list", "Operacion Modulo Listar", "/");
			operacionModuloList.setServicio(servicioModulo);
			servicioOp_repository.save(operacionModuloList);
			
			Modulo moduloInicio = new Modulo("Inicio", "Inicio", "/inicio");
			moduloInicio.setPortal(portalConfiguracion);
			modulo_repository.save(moduloInicio);
			
			Modulo moduloAdmin = new Modulo("Administracion", "Modulo de Administracion", "/administracion");
			moduloAdmin.setPortal(portalConfiguracion);
			modulo_repository.save(moduloAdmin);

			MenuOpcion menuAdmin = new MenuOpcion("MenuAdministracion", "Administracion", "");
			menuAdmin.setModulo(moduloAdmin);
			menuOpcion_repository.save(menuAdmin);
			
			MenuOpcion opcion01 = new MenuOpcion("Portal", "Portales", "/portal");
			opcion01.setOpcionPadre(menuAdmin);
			
			MenuOpcion opcion02 = new MenuOpcion("Parametro", "Parametros", "/parametro");
			opcion02.setOpcionPadre(menuAdmin);
			
			MenuOpcion opcion03 = new MenuOpcion("Modulo", "Modulos", "/modulo");
			opcion03.setOpcionPadre(menuAdmin);
			
			MenuOpcion opcion05 = new MenuOpcion("Servicio", "Servicios", "/servicio");
			opcion05.setOpcionPadre(menuAdmin);
			
			menuOpcion_repository.save(opcion01);
			menuOpcion_repository.save(opcion02);
			menuOpcion_repository.save(opcion03);
			menuOpcion_repository.save(opcion05);

			Portal portalPrueba01 = portal_repository.save(new Portal("Portal Prueba 01", "Portal Prueba 01", "/portal01", "http://localhost\\:8080/siam_rest/"));
			Portal portalPrueba02 = portal_repository.save(new Portal("Portal Prueba 02", "Portal Prueba 02", "/portal02", "http://localhost\\:8080/cfdi_rest/"));

			moduloAdmin = new Modulo("Catalogos", "Catalogos Generales", "/catalogos");
			moduloAdmin.setPortal(portalPrueba01);
			modulo_repository.save(moduloAdmin);

			menuAdmin = new MenuOpcion("MenuCatalogosGenerales", "Generales", "");
			menuAdmin.setModulo(moduloAdmin);
			menuOpcion_repository.save(menuAdmin);

			opcion01 = new MenuOpcion("TipoPieza", "Tipo Pieza", "/tipo_pieza");
			opcion01.setOpcionPadre(menuAdmin);
			menuOpcion_repository.save(opcion01);
		}
	}
}