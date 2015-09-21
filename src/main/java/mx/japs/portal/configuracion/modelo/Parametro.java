package mx.japs.portal.configuracion.modelo;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "PARAMETRO")
@RooEquals
@RooSerializable
@RooJson
public class Parametro {

    /**
     */
    private String grupo;

    /**
     */
    private String nombre;

    /**
     */
    private String valor;

    /**
     */
    private String descripcion;

    public Parametro(String grupo, String nombre, String valor, String descripcion) {
        super();
        this.grupo = grupo;
        this.nombre = nombre;
        this.valor = valor;
        this.descripcion = descripcion;
    }

    /**
     */
    @ManyToOne
    private Portal portal;
}
