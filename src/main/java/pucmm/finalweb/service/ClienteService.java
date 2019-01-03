package pucmm.finalweb.service;

import pucmm.finalweb.model.Cliente;

import java.util.List;

public interface ClienteService {

     void crearCliente(Cliente cliente);
     void actualizarCliente(Cliente cliente);
     void borrarClientePorId(Cliente cliente);
     void borrarTodosLosClientes();
     List<Cliente> buscarTodosClientes();
     Cliente buscarPorId(long id);
     Cliente findByNombre(String nombre);
     boolean clienteExiste(Cliente cliente);

}
