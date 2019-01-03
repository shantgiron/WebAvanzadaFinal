package pucmm.finalweb.service;

import pucmm.finalweb.model.FacturaEquipo;
import pucmm.finalweb.model.FacturaProducto;

import java.util.List;

public interface FacturaProductoService {

    void crearFacturaEquipo(FacturaProducto facturaEquipo);
    void actualizarFacturaEquipo(FacturaProducto facturaEquipo);
    void borrarFacturaEquipoPorId(long id);
    void borrarTodasLasFacturaEquipos();
    List<FacturaProducto> buscarTodasFacturaEquipos();
    FacturaProducto buscarPorId(long id);
    boolean facturaEquipoExiste(FacturaProducto facturaEquipo);
}
