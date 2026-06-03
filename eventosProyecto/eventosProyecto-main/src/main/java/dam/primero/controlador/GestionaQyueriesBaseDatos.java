package dam.primero.controlador;


import dam.primero.daos.institucionales.DaoCliente;
import dam.primero.exception.MyException;

public class GestionaQyueriesBaseDatos {

	public static void main(String[] args) {
			DaoCliente daoCliente = null;
			try {
				daoCliente = new DaoCliente();
				System.out.println(daoCliente.getAllClientes());
			}
			catch (MyException e){
				throw new RuntimeException(e);
			}
		}



	}

