package pucmm.finalweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pucmm.finalweb.repository.ClienteEquipoRepository;
import pucmm.finalweb.model.ClienteProducto;

import javax.transaction.Transactional;
import java.util.List;

@Service("clienteEquipoService")
@Transactional
public class ClienteEquipoServiceImpl implements ClienteEquipoService {

    @Autowired
    private ClienteEquipoRepository clienteEquipoRepository;

    public void crearClienteEquipo(ClienteProducto clienteProducto){
        clienteEquipoRepository.save(clienteProducto);
    }
    public void actualizarClienteEquipo(ClienteProducto clienteProducto){
        crearClienteEquipo(clienteProducto);
    }
    public void borrarClienteEquipoPorId(ClienteProducto clienteProducto){
        clienteProducto.setDeleted(true);
        actualizarClienteEquipo(clienteProducto);
    }
    public void borrarTodosLosClientesEquipos(){
        clienteEquipoRepository.deleteAll();
    }
    public List<ClienteProducto> buscarTodosClientesEquipos(){
        return clienteEquipoRepository.findAll();
    }
    @Override
    public ClienteProducto buscarPorId(long id){
        return clienteEquipoRepository.findById(id).get();
    }

    public boolean clienteEquipoExiste(ClienteProducto clienteProducto){
        return buscarPorId(clienteProducto.getId()) != null;
    }

    public List<Object[]> equiposAlquiladosNoDevueltos(){
        return clienteEquipoRepository.equiposAlquiladosNoDevueltos();
    }

    public List<Object[]> historialCliente(long id){
        return clienteEquipoRepository.historialCliente(id);
    }
    public List<Object[]> promedioAlquilerPorFamilia(long id){
        return clienteEquipoRepository.promediosAlquiler(id);
    }


}
