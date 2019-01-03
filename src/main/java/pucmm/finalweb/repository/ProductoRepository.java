package pucmm.finalweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pucmm.finalweb.model.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Long> {

    Producto findByNombre(String nombre);

}
