// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import mx.japs.portal.configuracion.modelo.Parametro;

privileged aspect Parametro_Roo_Json {
    
    public String Parametro.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Parametro.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Parametro Parametro.fromJsonToParametro(String json) {
        return new JSONDeserializer<Parametro>()
        .use(null, Parametro.class).deserialize(json);
    }
    
    public static String Parametro.toJsonArray(Collection<Parametro> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Parametro.toJsonArray(Collection<Parametro> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Parametro> Parametro.fromJsonArrayToParametroes(String json) {
        return new JSONDeserializer<List<Parametro>>()
        .use("values", Parametro.class).deserialize(json);
    }
    
}
