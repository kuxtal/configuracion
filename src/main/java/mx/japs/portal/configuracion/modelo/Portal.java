package mx.japs.portal.configuracion.modelo;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "PORTAL")
@RooEquals
@RooSerializable
@RooJson
public class Portal {

    /**
     */
    private String nombre;

    /**
     */
    private String descripcion;

    /**
     */
    private String url;

    public Portal(String nombre, String descripcion) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Portal(String nombre, String descripcion, String url) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.url = url;
    }

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portal")
    private Set<Parametro> parametros = new HashSet<Parametro>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portal")
    private Set<Modulo> modulos = new HashSet<Modulo>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portal")
    private Set<Servicio> servicios = new HashSet<Servicio>();

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "portal")
    private Set<Perfil> perfiles = new HashSet<Perfil>();
}
