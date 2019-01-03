package pucmm.finalweb.service;

import pucmm.finalweb.model.Producto;

import java.util.List;

public interface ProductoService {

    void crearEquipo(Producto producto);
    void actualizarEquipo(Producto producto);
    void borrarEquipoPorId(Producto producto);
    void borrarTodosLosEquipos();
    List<Producto> buscarTodosEquipos();
    Producto buscarPorId(long id);
    Producto findByNombreEquipo(String nombre);
    boolean equipoExiste(Producto producto);
}
