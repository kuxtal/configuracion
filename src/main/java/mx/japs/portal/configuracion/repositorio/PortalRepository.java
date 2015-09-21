package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Portal;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Portal.class)
public interface PortalRepository {
}
