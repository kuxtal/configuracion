package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Modulo;
import java.util.List;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Modulo.class)
public interface ModuloRepository {
	public List<Modulo> findByPortal_Id(Long idPortal);
}
