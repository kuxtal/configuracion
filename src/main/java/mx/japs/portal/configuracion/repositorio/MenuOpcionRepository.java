package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.MenuOpcion;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = MenuOpcion.class)
public interface MenuOpcionRepository {
}
