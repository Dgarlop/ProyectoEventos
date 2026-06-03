package dam.primero.daos.institucionales;

import dam.primero.config.MySqlConector;
import dam.primero.exception.MyException;
import dam.primero.modelos.institucionales.Cliente;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DaoCliente {
    private MySqlConector conexion;

    public DaoCliente() throws MyException {
        this.conexion = new MySqlConector();
    }

    public List<Cliente> getAllClientes(){
        List<Cliente> clientes = new ArrayList<Cliente>();
        String query = "SELECT * FROM cliente;";
        try {
            Statement statement = this.conexion.getConnect().createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()){
                int idCliente = rs.getInt("idCliente");
                String nombre = rs.getString("nombre");
                String apellidos = rs.getString("apellidos");

                Cliente c1 = new Cliente(idCliente,nombre, apellidos);
                clientes.add(c1);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return clientes;
    }
}
