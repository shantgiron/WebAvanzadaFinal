package pucmm.finalweb.service;

import pucmm.finalweb.model.ClienteProducto;

import java.util.List;

public interface ClienteEquipoService {

    void crearClienteEquipo(ClienteProducto clienteProducto);
    void actualizarClienteEquipo(ClienteProducto clienteProducto);
    void borrarClienteEquipoPorId(ClienteProducto clienteProducto);
    void borrarTodosLosClientesEquipos();
    List<ClienteProducto> buscarTodosClientesEquipos();
    ClienteProducto buscarPorId(long id);
    boolean clienteEquipoExiste(ClienteProducto clienteProducto);
    List<Object[]> equiposAlquiladosNoDevueltos();
    List<Object[]> historialCliente(long id);
    List<Object[]> promedioAlquilerPorFamilia(long id);


}
