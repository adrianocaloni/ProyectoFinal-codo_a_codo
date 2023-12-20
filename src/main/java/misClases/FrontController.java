package misClases;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontController() 
    {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String accion=null;
		 
		 TicketDAO ticketDAO=null;
		 OradorDAO oradorDAO=null;
		 
		 try
		 {
			 ticketDAO=new TicketDAO();
			 oradorDAO=new OradorDAO();
		 }
		 catch (ClassNotFoundException e)
		 {
			 System.out.println(e);	
		 }
				 
		
		 RequestDispatcher dispatcher=null;
		
		 accion=request.getParameter("accion"); //En la variable accion guardo lo que trae el parametro accion (guardo el parametro que trae la URI).
		 
		 if(accion==null || accion.isEmpty())
		 {
			 dispatcher=request.getRequestDispatcher("VISTAS/conferencia-index.jsp");
		 }
		  
		 else if(accion.equals("registrar"))
		 {
			 dispatcher=request.getRequestDispatcher("VISTAS/compra-tickets.jsp");
		 }
		 
		  
		 else if(accion.equals("compraExitosa"))
		 {
			 dispatcher=request.getRequestDispatcher("VISTAS/compra-exitosa.jsp");
		 }
		 
	
		 
		 else if(accion.equals("backoffice"))
		 {
			 dispatcher=request.getRequestDispatcher("VISTAS/back-office.jsp");
		 }
		 
		 
		 else if (accion.equals("insert")) 
		 {
			    String nombre = request.getParameter("nombre");
			    String apellido = request.getParameter("apellido");
			    String mail = request.getParameter("mail");
			    int cant = Integer.parseInt(request.getParameter("cant"));
			    int categoria = Integer.parseInt(request.getParameter("categoria"));
			    
			    float valor_total = cant * 200;
			    float descuento = 0;
			    float valor_final;

			    // Aplicar descuento según la categoría
			    if (categoria == 1) {
			        descuento = (valor_total * 0.8f);  // 80% de descuento
			    } else if (categoria == 2) {
			        descuento = (valor_total * 0.5f);  // 50% de descuento
			    } else {
			        descuento = (valor_total * 0.15f);  // 15% de descuento
			    }

			    valor_final = valor_total - descuento;

			    // Crear objeto Ticket y realizar la inserción en la base de datos
			    Ticket ticket = new Ticket(0, nombre, apellido, mail, cant, categoria, valor_final);
			    ticketDAO.insertarTicket(ticket);

			    dispatcher = request.getRequestDispatcher("VISTAS/compra-exitosa.jsp"); 
		}
		 
		 else if(accion.equals("eliminar"))
		 {
			 int id=Integer.parseInt(request.getParameter("id"));
			 ticketDAO.eliminarTicket(id);
			 dispatcher=request.getRequestDispatcher("VISTAS/back-office.jsp"); 		 
		 }
		 
		 else if(accion.equals("actualizar"))
		 {
			 	int id=Integer.parseInt(request.getParameter("id"));		
			    String mail = request.getParameter("mail");

			    ticketDAO.actualizarTicket(id, mail);
			    dispatcher=request.getRequestDispatcher("VISTAS/back-office.jsp"); 		 
		 }
		 
		 else if(accion.equals("eliminarOrador"))
		 {
			 int id=Integer.parseInt(request.getParameter("id"));
			 oradorDAO.eliminarOrador(id);
			 dispatcher=request.getRequestDispatcher("VISTAS/back-office.jsp"); 	 
		 }
		 		 
		 else if(accion.equals("insertOrador"))
		 {
			 String nombre=request.getParameter("nombre") ;
			 String apellido=request.getParameter("apellido") ;
			 String tematica=request.getParameter("tematica") ;
			 
			 Orador orador = new Orador(0,nombre,apellido,tematica);
			 oradorDAO.insertarOrador(orador);
			 dispatcher=request.getRequestDispatcher("VISTAS/conferencia-index.jsp"); //HACER UNA VISTA CUANDO LA CARGA DEL ORADOR FUE EXITOSA
		 }
		 
		 else if(accion.equals("volver"))
		 {
			 dispatcher=request.getRequestDispatcher("VISTAS/conferencia-index.jsp");
		 }
		 
		
		 dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
