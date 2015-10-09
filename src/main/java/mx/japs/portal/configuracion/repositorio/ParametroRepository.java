package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.Parametro;

import java.util.List;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Parametro.class)
public interface ParametroRepository {
	public List<Parametro> findByPortal_Id(Long idPortal);
}
