package pucmm.finalweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pucmm.finalweb.model.Rol;

public interface RolRepository extends JpaRepository<Rol, Long> {

    Rol findByNombreRol(String rol);

}
