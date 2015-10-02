package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Operacion;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Operacion.class)
public interface OperacionRepository {
}
