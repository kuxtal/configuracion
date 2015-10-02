package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Perfil;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Perfil.class)
public interface PerfilRepository {
}
