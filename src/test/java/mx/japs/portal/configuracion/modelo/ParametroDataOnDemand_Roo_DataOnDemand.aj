// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import mx.japs.portal.configuracion.modelo.Parametro;
import mx.japs.portal.configuracion.modelo.ParametroDataOnDemand;
import mx.japs.portal.configuracion.modelo.PortalDataOnDemand;
import mx.japs.portal.configuracion.repositorio.ParametroRepository;
import mx.japs.portal.configuracion.servicio.ParametroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ParametroDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ParametroDataOnDemand: @Component;
    
    private Random ParametroDataOnDemand.rnd = new SecureRandom();
    
    private List<Parametro> ParametroDataOnDemand.data;
    
    @Autowired
    PortalDataOnDemand ParametroDataOnDemand.portalDataOnDemand;
    
    @Autowired
    ParametroService ParametroDataOnDemand.parametroService;
    
    @Autowired
    ParametroRepository ParametroDataOnDemand.parametroRepository;
    
    public Parametro ParametroDataOnDemand.getNewTransientParametro(int index) {
        Parametro obj = new Parametro();
        setDescripcion(obj, index);
        setGrupo(obj, index);
        setNombre(obj, index);
        setValor(obj, index);
        return obj;
    }
    
    public void ParametroDataOnDemand.setDescripcion(Parametro obj, int index) {
        String descripcion = "descripcion_" + index;
        obj.setDescripcion(descripcion);
    }
    
    public void ParametroDataOnDemand.setGrupo(Parametro obj, int index) {
        String grupo = "grupo_" + index;
        obj.setGrupo(grupo);
    }
    
    public void ParametroDataOnDemand.setNombre(Parametro obj, int index) {
        String nombre = "nombre_" + index;
        obj.setNombre(nombre);
    }
    
    public void ParametroDataOnDemand.setValor(Parametro obj, int index) {
        String valor = "valor_" + index;
        obj.setValor(valor);
    }
    
    public Parametro ParametroDataOnDemand.getSpecificParametro(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Parametro obj = data.get(index);
        Long id = obj.getId();
        return parametroService.findParametro(id);
    }
    
    public Parametro ParametroDataOnDemand.getRandomParametro() {
        init();
        Parametro obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return parametroService.findParametro(id);
    }
    
    public boolean ParametroDataOnDemand.modifyParametro(Parametro obj) {
        return false;
    }
    
    public void ParametroDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = parametroService.findParametroEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Parametro' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Parametro>();
        for (int i = 0; i < 10; i++) {
            Parametro obj = getNewTransientParametro(i);
            try {
                parametroService.saveParametro(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            parametroRepository.flush();
            data.add(obj);
        }
    }
    
}
