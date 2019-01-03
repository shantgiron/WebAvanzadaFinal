package pucmm.finalweb.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pucmm.finalweb.model.Producto;

import pucmm.finalweb.repository.ProductoRepository;

import javax.transaction.Transactional;
import java.util.List;

@Service("equipoService")
@Transactional
public class ProductoServiceImpl implements ProductoService {

    @Autowired
    private ProductoRepository equipoRepository;

    public void crearEquipo(Producto producto){
        equipoRepository.save(producto);
    }
    public void actualizarEquipo(Producto producto){
        crearEquipo(producto);
    }
    public void borrarEquipoPorId(Producto producto){
        producto.setDeleted(true);
        actualizarEquipo(producto);
    }
    public void borrarTodosLosEquipos(){
        equipoRepository.deleteAll();
    }
    public List<Producto> buscarTodosEquipos(){
        return equipoRepository.findAll();
    }
    @Override
    public Producto buscarPorId(long id){
        return equipoRepository.findById(id).get();
    }
    public Producto findByNombreEquipo(String nombre){
        return equipoRepository.findByNombre(nombre);
    }
    public boolean equipoExiste(Producto producto){
        return findByNombreEquipo(producto.getNombre()) != null;
    }
}
