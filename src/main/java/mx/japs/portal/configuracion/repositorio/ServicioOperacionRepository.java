package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.ServicioOperacion;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ServicioOperacion.class)
public interface ServicioOperacionRepository {
}
