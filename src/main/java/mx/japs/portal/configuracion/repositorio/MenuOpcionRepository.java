package mx.japs.portal.configuracion.repositorio;
import mx.japs.portal.configuracion.modelo.MenuOpcion;

import java.util.List;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = MenuOpcion.class)
public interface MenuOpcionRepository {
	public List<MenuOpcion> findByModulo_Id(Long idModulo);
	
	public List<MenuOpcion> findByOpcionPadre_Id(Long idOpcionPadre);
}
