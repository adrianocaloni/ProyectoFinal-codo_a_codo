<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="misClases.Ticket" %>
<%@ page import="misClases.TicketDAO" %>
<%@ page import="misClases.Orador" %>
<%@ page import="misClases.OradorDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" type="text/css" href="CSS/style.css">
     <script src="https://kit.fontawesome.com/286976b3d3.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> 
    <title>Back Ofiice</title>
</head>
<body>


<div class="container">

	<h1 class="text-primary">Panel</h1><br><br>
	<div class="row">
	
	<h2 class="text-primary">Tickets</h2>
	
			<table class="table table-striped">
				<thead>
					<th>Id Venta</th>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Mail</th>
					<th>Cantidad</th>
					<th>Tipo</th>
					<th>Total</th>
					<th>Eliminar</th>
				</thead>
				
				
				<%
				List<Ticket> resultado = null;
				TicketDAO ticket= new TicketDAO();
				resultado=ticket.listarTickets();
				int totalFacturado=0;
				
				
				for(int x=0;x<resultado.size();x++)
				{
					String rutaE="FrontController?accion=eliminar&id="+resultado.get(x).getId();
					
					String tipoTicket;
					
					if(resultado.get(x).getTipo_ticket()==1)
					{
						tipoTicket="Estudiante";
					}
					else if(resultado.get(x).getTipo_ticket()==2)
					{
						tipoTicket="Trainee";
					}
					else
					{
						tipoTicket="Junior";
					}	
					
				%>
				
				<tr>
					<td><%=resultado.get(x).getId()%></td>
					<td><%=resultado.get(x).getNombre()%></td>
					<td><%=resultado.get(x).getApellido()%></td>
					<td><%=resultado.get(x).getMail()%></td>
					<td><%=resultado.get(x).getCant()%></td>
					<td><%=tipoTicket%></td>
					<td><%=resultado.get(x).getTotal_facturado()%></td>
					<td class="text-center"><a href= <%=rutaE%>> <i class="fa-solid fa-rectangle-xmark"></i></a></td>
				</tr>
				<%
				totalFacturado+= resultado.get(x).getTotal_facturado();
				}			
				%>
				
				<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td class="text-success">Total: $<%=totalFacturado%></td>
				<td></td>
				</tr>
							
			</table>
			
	</div>

</div><br>

<div class="container">

	<div class="row">
	<h2 class="text-primary">Oradores</h2>
			<table class="table table-striped">
				<thead>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Tematica</th>
					<th>Baja</th>
				</thead>
				
				
				<%
				List<Orador> resultadoOradores = null;
				OradorDAO orador= new OradorDAO();
				resultadoOradores=orador.listarOradores();
				
				
				for(int x=0;x<resultadoOradores.size();x++)
				{
					String rutaE="FrontController?accion=eliminarOrador&id="+resultadoOradores.get(x).getId();
		
				%>
				
				<tr>
					<td><%=resultadoOradores.get(x).getNombre()%></td>
					<td><%=resultadoOradores.get(x).getApellido()%></td>
					<td><%=resultadoOradores.get(x).getTematica()%></td>
					<td class="text-center"><a href= <%=rutaE%>> <i class="fa-solid fa-rectangle-xmark"></i></a></td>
				</tr>
				<%
				
				}			
				%>
						
			</table>
			
			<a class="btn btn-success col-2 m-2" href="FrontController?accion=volver">Volver</a>
			
	</div>

</div>

</body>
</html>