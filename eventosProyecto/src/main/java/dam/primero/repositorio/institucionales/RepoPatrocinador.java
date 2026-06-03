package dam.primero.repositorio.institucionales;

import dam.primero.config.MySqlConector;
import dam.primero.exception.MyException;
import dam.primero.modelos.institucionales.patrocinador;
import dam.primero.modelos.ventas.Cliente;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RepoPatrocinador {
    //Atributos
    private MySqlConector conector;

    //Constructor
    public RepoPatrocinador() {
        try {
            this.conector = new MySqlConector();
        } catch (MyException e) {
            System.out.println("Error al conectar con la base de datos: " + e.getMessage());
        }
    }

    //Metodos
    public List<patrocinador> listarPatrocinadores() {
        List<patrocinador> patrocinadores = new ArrayList<patrocinador>();
        String query = "select * from Patrocinio;";
        Statement stmt = null;
        ResultSet rs = null;
        try{
            stmt = this.conector.getConnect().createStatement();
            rs = stmt.executeQuery(query);
            while(rs.next()){
                int idpatrocinador = rs.getInt("idpatrocinador");
                String nombre = rs.getString("nombrePatrocinador");

                patrocinador patro1 = new patrocinador(2,"Monster");
                patrocinadores.add(patro1);
            }
        } catch (SQLException e){
            System.out.println("No hay Clientes disponibles");
        }
        return patrocinadores;
    }

    public void darAltaCliente(String nombre, String correo, String telefono) throws SQLException {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try{
            String query = "INSERT INTO patrocinadores (nombre) VALUES (?, ?, ?)";
            stmt = this.conector.getConnect().prepareStatement(query);
            stmt.setString(1, nombre);
            stmt.executeUpdate();
        } catch (SQLException e){
            System.out.println("No se puede añadir este cliente");
        }
    }
}