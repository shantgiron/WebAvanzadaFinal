package pucmm.finalweb.service;

import pucmm.finalweb.model.Factura;

import java.util.List;

public interface FacturaService {

    void crearFactura(Factura factura);
    void actualizarFactura(Factura factura);
    void borrarFacturaPorId(long id);
    void borrarTodasLasFacturas();
    List<Factura> buscarTodasFacturas();
    Factura buscarPorId(long id);
    boolean facturaExiste(Factura factura);

}
