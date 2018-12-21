package ce.pucmm.finalWeb.Modelo;

import java.io.Serializable;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

@Entity(name = "Rol")
@Table(name = "rol")
@Where(clause = "deleted = 0")
public class Rol implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, unique = true, updatable = false)
    private int id;

    @Column(name = "nombreRol")
    private String nombreRol;

    @OneToMany(  mappedBy = "rol", cascade = CascadeType.ALL, orphanRemoval = true)
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Usuario> usuarios = new ArrayList<>();


    private boolean deleted = false;


    public Rol(){

    }

    public Rol(String nombreRol, List<Usuario> usuarios) {
        this.nombreRol = nombreRol;
        this.usuarios = usuarios;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreRol() {
        return nombreRol;
    }

    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }

    public List<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(List<Usuario> usuarios) {
        this.usuarios = usuarios;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
