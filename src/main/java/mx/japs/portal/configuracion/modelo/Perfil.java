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
@RooJpaEntity(table = "PERFIL")
@RooEquals
@RooSerializable
@RooJson
public class Perfil {

    /**
     */
    private String nombre;

    /**
     */
    private String descripcion;

    public Perfil(String nombre, String descripcion) {
        super();
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    /**
     */
    @ManyToOne
    private Portal portal;

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<MenuOpcion> opciones = new HashSet<MenuOpcion>();
}
