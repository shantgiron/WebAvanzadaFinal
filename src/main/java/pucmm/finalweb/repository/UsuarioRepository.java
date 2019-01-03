package pucmm.finalweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pucmm.finalweb.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Usuario findByUsername(String username);

}
