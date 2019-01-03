package pucmm.finalweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pucmm.finalweb.model.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {

    Cliente findByNombre(String nombre);

}
