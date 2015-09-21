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
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "SERVICIO")
@RooEquals
@RooSerializable
@RooJson
public class Servicio {

    /**
     */
    private String nombre;

    /**
     */
    private String descripcion;

    /**
     */
    private String url;

    public Servicio(String nombre, String descripcion) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Servicio(String nombre, String descripcion, String url) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.url = url;
    }

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "servicio")
    private Set<ServicioOperacion> operaciones = new HashSet<ServicioOperacion>();

    /**
     */
    @ManyToOne
    private Portal portal;
}
