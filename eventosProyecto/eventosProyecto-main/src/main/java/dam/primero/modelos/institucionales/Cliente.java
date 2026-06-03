package dam.primero.modelos.institucionales;

import java.util.Objects;

public class Cliente {
    private int idCliente;
    private String nombre;
    private String apellidos;

    public Cliente(int idCliente, String nombre, String apellidos) {
        this.idCliente= idCliente;
        this.nombre = nombre;
        this.apellidos = apellidos;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Cliente cliente = (Cliente) o;
        return idCliente == cliente.idCliente;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(idCliente);
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "idCliente=" + getIdCliente() +
                ", nombre='" + getNombre() + '\'' +
                ", apellidos='" + getApellidos() + '\'' +
                '}';
    }
}

