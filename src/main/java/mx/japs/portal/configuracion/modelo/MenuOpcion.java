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
import javax.persistence.OneToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "MENU_OPCION")
@RooEquals
@RooSerializable
@RooJson
public class MenuOpcion {

    /**
     */
    private String nombre;

    /**
     */
    private String texto;

    /**
     */
    private Integer orden;

    public MenuOpcion(String nombre, String texto) {
        super();
        this.nombre = nombre;
        this.texto = texto;
    }

    public MenuOpcion(String nombre, String texto, Integer orden) {
        super();
        this.nombre = nombre;
        this.texto = texto;
        this.orden = orden;
    }

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "opcionPadre")
    private Set<MenuOpcion> opciones = new HashSet<MenuOpcion>();

    /**
     */
    @ManyToOne
    private Modulo modulo;

    /**
     */
    @ManyToOne
    private MenuOpcion opcionPadre;

    /**
     */
    @OneToOne
    private Operacion operacion;
}
