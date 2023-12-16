//TODA LA LOGICA DE NEGOCIO VA EN ESTA CLASE
package misClases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;


public class TicketDAO 
{
	Connection conexion=null;
	
	public TicketDAO () throws ClassNotFoundException 
	{
		Conexion con=new Conexion();
		conexion=con.getConnection();
	}
	
	//LISTAR
	public List<Ticket> listarTickets()
	{
		PreparedStatement ps;
		ResultSet rs;
		List<Ticket> lista= new ArrayList<>();
		
		try 
		{
			ps=conexion.prepareStatement("SELECT * FROM Tickets");
			rs= ps.executeQuery();
			
			while(rs.next()) 
			{
				int id=rs.getInt("id");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				String mail = rs.getString("mail");
				int cant=rs.getInt("cant");
				int tipo_ticket=rs.getInt("tipo_ticket");
				float total_facturado=rs.getFloat("total_facturado");
				
				Ticket ticket=new Ticket(id,nombre,apellido,mail,cant,tipo_ticket,total_facturado);
				lista.add(ticket);
				
			}
			
			return lista;
		} 
		catch (SQLException e)
		{
			System.out.println(e);
			return null;
			
		}
		
		
		
	}
	
	//INSERTAR
	
	//ELIMINAR
	

}
