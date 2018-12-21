package ce.pucmm.finalWeb.Modelo;


import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;
import javax.persistence.*;

@Entity(name = "Cliente")
@Table(name = "cliente")
@Where(clause = "deleted = 0")

public class Cliente implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, unique = true, updatable = false)
    private int id;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "email")
    private String email;

    @OneToOne(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval =  true)
    private Usuario usuario;

    @OneToOne(mappedBy = "cliente", cascade = CascadeType.ALL, orphanRemoval =  true)
    private Factura factura;

    private boolean deleted = false;


    public Cliente(){

    }

    public Cliente(String nombre, String direccion, String email, Usuario usuario, Factura factura) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.email = email;
        this.usuario = usuario;
        this.factura = factura;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
