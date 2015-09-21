// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import mx.japs.portal.configuracion.modelo.Servicio;

privileged aspect Servicio_Roo_Json {
    
    public String Servicio.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Servicio.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Servicio Servicio.fromJsonToServicio(String json) {
        return new JSONDeserializer<Servicio>()
        .use(null, Servicio.class).deserialize(json);
    }
    
    public static String Servicio.toJsonArray(Collection<Servicio> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Servicio.toJsonArray(Collection<Servicio> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Servicio> Servicio.fromJsonArrayToServicios(String json) {
        return new JSONDeserializer<List<Servicio>>()
        .use("values", Servicio.class).deserialize(json);
    }
    
}