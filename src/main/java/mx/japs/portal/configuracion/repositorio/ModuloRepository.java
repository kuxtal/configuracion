package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Modulo;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Modulo.class)
public interface ModuloRepository {
}
