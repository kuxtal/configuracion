// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.controlador;

import mx.japs.portal.configuracion.controlador.ApplicationConversionServiceFactoryBean;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    MenuOpcionRepository ApplicationConversionServiceFactoryBean.menuOpcionRepository;
    
    @Autowired
    ModuloRepository ApplicationConversionServiceFactoryBean.moduloRepository;
    
    @Autowired
    ParametroRepository ApplicationConversionServiceFactoryBean.parametroRepository;
    
    @Autowired
    PortalRepository ApplicationConversionServiceFactoryBean.portalRepository;
    
    @Autowired
    ServicioRepository ApplicationConversionServiceFactoryBean.servicioRepository;
    
    @Autowired
    ServicioOperacionRepository ApplicationConversionServiceFactoryBean.servicioOperacionRepository;
    
    public Converter<MenuOpcion, String> ApplicationConversionServiceFactoryBean.getMenuOpcionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<mx.japs.portal.configuracion.modelo.MenuOpcion, java.lang.String>() {
            public String convert(MenuOpcion menuOpcion) {
                return new StringBuilder().append(menuOpcion.getNombre()).append(' ').append(menuOpcion.getTexto()).append(' ').append(menuOpcion.getUrl()).toString();
            }
        };
    }
    
    public Converter<Long, MenuOpcion> ApplicationConversionServiceFactoryBean.getIdToMenuOpcionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, mx.japs.portal.configuracion.modelo.MenuOpcion>() {
            public mx.japs.portal.configuracion.modelo.MenuOpcion convert(java.lang.Long id) {
                return menuOpcionRepository.findOne(id);
            }
        };
    }
    
    public Converter<String, MenuOpcion> ApplicationConversionServiceFactoryBean.getStringToMenuOpcionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, mx.japs.portal.configuracion.modelo.MenuOpcion>() {
            public mx.japs.portal.configuracion.modelo.MenuOpcion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), MenuOpcion.class);
            }
        };
    }
    
    public Converter<Modulo, String> ApplicationConversionServiceFactoryBean.getModuloToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<mx.japs.portal.configuracion.modelo.Modulo, java.lang.String>() {
            public String convert(Modulo modulo) {
                return new StringBuilder().append(modulo.getNombre()).append(' ').append(modulo.getDescripcion()).append(' ').append(modulo.getUrl()).toString();
            }
        };
    }
    
    public Converter<Long, Modulo> ApplicationConversionServiceFactoryBean.getIdToModuloConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, mx.japs.portal.configuracion.modelo.Modulo>() {
            public mx.japs.portal.configuracion.modelo.Modulo convert(java.lang.Long id) {
                return moduloRepository.findOne(id);
            }
        };
    }
    
    public Converter<String, Modulo> ApplicationConversionServiceFactoryBean.getStringToModuloConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, mx.japs.portal.configuracion.modelo.Modulo>() {
            public mx.japs.portal.configuracion.modelo.Modulo convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Modulo.class);
            }
        };
    }
    
    public Converter<Parametro, String> ApplicationConversionServiceFactoryBean.getParametroToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<mx.japs.portal.configuracion.modelo.Parametro, java.lang.String>() {
            public String convert(Parametro parametro) {
                return new StringBuilder().append(parametro.getGrupo()).append(' ').append(parametro.getNombre()).append(' ').append(parametro.getValor()).append(' ').append(parametro.getDescripcion()).toString();
            }
        };
    }
    
    public Converter<Long, Parametro> ApplicationConversionServiceFactoryBean.getIdToParametroConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, mx.japs.portal.configuracion.modelo.Parametro>() {
            public mx.japs.portal.configuracion.modelo.Parametro convert(java.lang.Long id) {
                return parametroRepository.findOne(id);
            }
        };
    }
    
    public Converter<String, Parametro> ApplicationConversionServiceFactoryBean.getStringToParametroConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, mx.japs.portal.configuracion.modelo.Parametro>() {
            public mx.japs.portal.configuracion.modelo.Parametro convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Parametro.class);
            }
        };
    }
    
    public Converter<Portal, String> ApplicationConversionServiceFactoryBean.getPortalToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<mx.japs.portal.configuracion.modelo.Portal, java.lang.String>() {
            public String convert(Portal portal) {
                return new StringBuilder().append(portal.getNombre()).append(' ').append(portal.getDescripcion()).append(' ').append(portal.getUrl()).append(' ').append(portal.getApi_url()).toString();
            }
        };
    }
    
    public Converter<Long, Portal> ApplicationConversionServiceFactoryBean.getIdToPortalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, mx.japs.portal.configuracion.modelo.Portal>() {
            public mx.japs.portal.configuracion.modelo.Portal convert(java.lang.Long id) {
                return portalRepository.findOne(id);
            }
        };
    }
    
    public Converter<String, Portal> ApplicationConversionServiceFactoryBean.getStringToPortalConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, mx.japs.portal.configuracion.modelo.Portal>() {
            public mx.japs.portal.configuracion.modelo.Portal convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Portal.class);
            }
        };
    }
    
    public Converter<Servicio, String> ApplicationConversionServiceFactoryBean.getServicioToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<mx.japs.portal.configuracion.modelo.Servicio, java.lang.String>() {
            public String convert(Servicio servicio) {
                return new StringBuilder().append(servicio.getNombre()).append(' ').append(servicio.getDescripcion()).append(' ').append(servicio.getUrl()).toString();
            }
        };
    }
    
    public Converter<Long, Servicio> ApplicationConversionServiceFactoryBean.getIdToServicioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, mx.japs.portal.configuracion.modelo.Servicio>() {
            public mx.japs.portal.configuracion.modelo.Servicio convert(java.lang.Long id) {
                return servicioRepository.findOne(id);
            }
        };
    }
    
    public Converter<String, Servicio> ApplicationConversionServiceFactoryBean.getStringToServicioConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, mx.japs.portal.configuracion.modelo.Servicio>() {
            public mx.japs.portal.configuracion.modelo.Servicio convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Servicio.class);
            }
        };
    }
    
    public Converter<ServicioOperacion, String> ApplicationConversionServiceFactoryBean.getServicioOperacionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<mx.japs.portal.configuracion.modelo.ServicioOperacion, java.lang.String>() {
            public String convert(ServicioOperacion servicioOperacion) {
                return new StringBuilder().append(servicioOperacion.getNombre()).append(' ').append(servicioOperacion.getDescripcion()).append(' ').append(servicioOperacion.getUrl()).toString();
            }
        };
    }
    
    public Converter<Long, ServicioOperacion> ApplicationConversionServiceFactoryBean.getIdToServicioOperacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, mx.japs.portal.configuracion.modelo.ServicioOperacion>() {
            public mx.japs.portal.configuracion.modelo.ServicioOperacion convert(java.lang.Long id) {
                return servicioOperacionRepository.findOne(id);
            }
        };
    }
    
    public Converter<String, ServicioOperacion> ApplicationConversionServiceFactoryBean.getStringToServicioOperacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, mx.japs.portal.configuracion.modelo.ServicioOperacion>() {
            public mx.japs.portal.configuracion.modelo.ServicioOperacion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ServicioOperacion.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getMenuOpcionToStringConverter());
        registry.addConverter(getIdToMenuOpcionConverter());
        registry.addConverter(getStringToMenuOpcionConverter());
        registry.addConverter(getModuloToStringConverter());
        registry.addConverter(getIdToModuloConverter());
        registry.addConverter(getStringToModuloConverter());
        registry.addConverter(getParametroToStringConverter());
        registry.addConverter(getIdToParametroConverter());
        registry.addConverter(getStringToParametroConverter());
        registry.addConverter(getPortalToStringConverter());
        registry.addConverter(getIdToPortalConverter());
        registry.addConverter(getStringToPortalConverter());
        registry.addConverter(getServicioToStringConverter());
        registry.addConverter(getIdToServicioConverter());
        registry.addConverter(getStringToServicioConverter());
        registry.addConverter(getServicioOperacionToStringConverter());
        registry.addConverter(getIdToServicioOperacionConverter());
        registry.addConverter(getStringToServicioOperacionConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
