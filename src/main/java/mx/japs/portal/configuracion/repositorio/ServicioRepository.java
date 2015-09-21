package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Servicio;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Servicio.class)
public interface ServicioRepository {
}
