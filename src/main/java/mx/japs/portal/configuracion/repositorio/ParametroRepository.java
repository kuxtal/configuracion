package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Parametro;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Parametro.class)
public interface ParametroRepository {
}
