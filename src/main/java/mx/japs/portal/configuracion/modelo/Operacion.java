package mx.japs.portal.configuracion.modelo;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "OPERACION")
@RooEquals
@RooSerializable
@RooJson
public class Operacion {

    /**
     */
    private String nombre;

    /**
     */
    private String descripcion;

    /**
     */
    private String url;

    public Operacion(String nombre, String descripcion) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Operacion(String nombre, String descripcion, String url) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.url = url;
    }

    /**
     */
    @ManyToOne
    private Servicio servicio;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "operaciones")
    private Set<Perfil> perfiles = new HashSet<Perfil>();
}
