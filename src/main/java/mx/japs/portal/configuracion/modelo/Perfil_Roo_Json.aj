// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package mx.japs.portal.configuracion.modelo;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import mx.japs.portal.configuracion.modelo.Perfil;

privileged aspect Perfil_Roo_Json {
    
    public String Perfil.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Perfil.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Perfil Perfil.fromJsonToPerfil(String json) {
        return new JSONDeserializer<Perfil>()
        .use(null, Perfil.class).deserialize(json);
    }
    
    public static String Perfil.toJsonArray(Collection<Perfil> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Perfil.toJsonArray(Collection<Perfil> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Perfil> Perfil.fromJsonArrayToPerfils(String json) {
        return new JSONDeserializer<List<Perfil>>()
        .use("values", Perfil.class).deserialize(json);
    }
    
}