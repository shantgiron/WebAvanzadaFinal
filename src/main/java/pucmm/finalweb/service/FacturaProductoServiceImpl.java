package pucmm.finalweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pucmm.finalweb.model.FacturaProducto;
import pucmm.finalweb.repository.FacturaProductoRepository;
import pucmm.finalweb.model.FacturaEquipo;

import javax.transaction.Transactional;
import java.util.List;

@Service("facturaEquipoService")
@Transactional
public class FacturaProductoServiceImpl implements FacturaProductoService {

    @Autowired
    private FacturaProductoRepository facturaProductoRepository;

    public void crearFacturaEquipo(FacturaProducto facturaEquipo){
        facturaProductoRepository.save(facturaEquipo);
    }
    public void actualizarFacturaEquipo(FacturaProducto facturaEquipo){
        crearFacturaEquipo(facturaEquipo);
    }
    public void borrarFacturaEquipoPorId(long id){
        facturaProductoRepository.deleteById(id);
    }
    public void borrarTodasLasFacturaEquipos(){
        facturaProductoRepository.deleteAll();
    }
    public List<FacturaProducto> buscarTodasFacturaEquipos(){
        return facturaProductoRepository.findAll();
    }
    @Override
    public FacturaProducto buscarPorId(long id){
        return facturaProductoRepository.findById(id).get();
    }

    public boolean facturaEquipoExiste(FacturaProducto facturaEquipo){
        return buscarPorId(facturaEquipo.getId()) != null;
    }
}
