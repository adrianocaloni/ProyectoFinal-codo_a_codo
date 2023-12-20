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
	public boolean insertarTicket(Ticket ticket)
	{
		PreparedStatement ps;
		//double total;
		
		try
		{
			ps=conexion.prepareStatement("insert into tickets(nombre,apellido,mail,cant,tipo_ticket,total_facturado)" 
											+ "values(?,?,?,?,?,?)");	
			ps.setString(1, ticket.getNombre());
			ps.setString(2, ticket.getApellido());
			ps.setString(3, ticket.getMail());
			ps.setInt(4, ticket.getCant());
			ps.setInt(5, ticket.getTipo_ticket());
			ps.setFloat(6, ticket.getTotal_facturado());
			
			ps.execute();
			
			return true;

		} 
		
		catch (SQLException e)
		{
			System.out.println(e);
			return false;
			
		}		

	}
	
	//ELIMINAR
	public boolean eliminarTicket (int _id) 
	{
		PreparedStatement ps;
		try 
		{
			ps=conexion.prepareStatement("delete from tickets where id=?");
			ps.setInt(1, _id);
			ps.execute();
			return true;
			
		}
		catch (SQLException e)
		{
			System.out.println(e);
			return false;
		}	
		
	}
	
	
	//ACTUALIZAR

	public void actualizarTicket(int id, String mail) 
	{
	    PreparedStatement ps;
	    
	    try 
	    {
	        ps = conexion.prepareStatement("UPDATE tickets SET  mail=?  WHERE id=?");    
	        ps.setString(1, mail);  // Primero establece el valor para el parámetro mail
	        ps.setInt(2, id);       // Luego establece el valor para el parámetro id
	        ps.executeUpdate();
	        

	    } 
	    catch (SQLException e) 
	    {
	        System.out.println(e);
	
	    }
	}

		
	

}
