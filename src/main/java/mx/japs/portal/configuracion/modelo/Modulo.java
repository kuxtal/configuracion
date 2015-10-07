package mx.japs.portal.configuracion.modelo;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "MODULO")
@RooEquals
@RooSerializable
@RooJson
public class Modulo {

    /**
     */
    private String nombre;

    /**
     */
    private String descripcion;

    /**
     * Url del Modulo
     */
    @Size(max = 100)
    private String url;

    public Modulo(String nombre, String descripcion) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Modulo(String nombre, String descripcion, String url) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.url = url;
    }

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "modulo")
    private Set<MenuOpcion> opciones = new HashSet<MenuOpcion>();

    /**
     */
    @ManyToOne
    private Portal portal;
}
