package pucmm.finalweb.model;


import org.hibernate.annotations.Where;

import java.io.Serializable;
import javax.persistence.*;

@Entity(name = "FacturaProducto")
@Table(name = "detalles_factura")
@Where(clause = "deleted = 0")
public class FacturaProducto implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "detalles_factura_id", nullable = false, unique = true, updatable = false)
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "factura_id")
    private Factura factura;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "producto_id")
    private Producto producto;

    @Column(name = "cantidad")
    private int cantidad;

    @Column(name = "subtotal")
    private double subtotal;

    private boolean deleted = false;


    public FacturaProducto(){

    }

    public FacturaProducto(Factura factura, Producto producto, int cantidad, double subtotal) {
        this.factura = factura;
        this.producto = producto;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
