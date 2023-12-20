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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bangers&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> 
    <title>Back Ofiice</title>
</head>
<body>


<div class="container">
    <!-- Banner for PANEL -->
    <div class="dark-banner">
        <h1 class="text">PANEL</h1>
    </div><br><br>
    
        <style>

    </style>
    
    	
	 <div class="dark-banner-dos">
        <h2 class="text"> Tickets</h2>
    </div>
    
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
                    <th>Editar Mail</th>
                </thead>
                
                
                <%
                List<Ticket> resultado = null;
                TicketDAO ticket= new TicketDAO();
                resultado=ticket.listarTickets();
                int totalFacturado=0;
                
                
                for(int x=0;x<resultado.size();x++)
                {
                    String rutaE="FrontController?accion=eliminar&id="+resultado.get(x).getId();
                    String rutaEdit="FrontController?accion=editar&id="+resultado.get(x).getId();
                    String tipoTicket;
                    
                    if(resultado.get(x).getTipo_ticket()==1)
                    {
                        tipoTicket="Vengador Original";
                    }
                    else if(resultado.get(x).getTipo_ticket()==2)
                    {
                        tipoTicket="Nuevo Vengador";
                    }
                    else
                    {
                        tipoTicket="Vengadore Oscuro";
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
                    <td class="text-center">
                        <a type="button" onclick="setRecordId('<%=resultado.get(x).getId()%>')" data-toggle="modal" data-target="#confirmModal">
                            <i class="fa-solid fa-rectangle-xmark"></i>
                        </a>
                    </td>
                    
                    <td class="text-center">
                        <a type="button" onclick="setRecordEditId('<%=resultado.get(x).getId()%>','<%=resultado.get(x).getNombre()%>','<%=resultado.get(x).getApellido()%>','<%=resultado.get(x).getTipo_ticket()%>','<%=resultado.get(x).getMail()%>')" data-toggle="modal" data-target="#editarModal">      
                            <i class="fa-solid fa-pen-to-square"></i>
                        </a>
                    </td>
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
                <td></td>
                </tr>
                            
            </table>
    
				<!-- Modal de Confirmación -->
				<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="confirmModalLabel">Confirmar eliminación</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								¿Estás seguro de que quieres eliminar este registro?
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
								<form id="deleteForm" action="FrontController" method="get">
									<input type="hidden" name="accion" value="eliminar">
									<input type="hidden" name="id" id="recordId" value="">
									<button type="submit" class="btn btn-danger">Eliminar</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Modal de Confirmación -->
				<div class="modal fade" id="editarModal" tabindex="-1" role="dialog" aria-labelledby="editarModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="confirmModalLabel">Editar Información</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						<div class="modal-body">	
								
						<form id="editForm" action="FrontController" method="get">
							<input type="hidden" name="accion" value="actualizar">
							<input type="hidden" name="id" id="recordIdEdit" value="">
							<div class="form-group">
								<label for="nombre">Nombre:</label>
								<input type="text" class="form-control gray-background" id="nombre" readonly>
							</div>
							<div class="form-group">
								<label for="apellido">Apellido:</label>
								<input type="text" class="form-control gray-background" id="apellido" readonly>
							</div>
							
							<div class="form-group">
								<label for="apellido">Tipo Vengador:</label>
								<input type="text" class="form-control gray-background" id="tipoVengador" readonly>
							</div>
                            <div class="form-group">
                            	<label for="apellido">Email:</label>
                    			<input class="form-control" id="mail" placeholder="Correo" name="mail">
                  			</div>
			
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
							 	<button type="submit" class="btn btn-primary">Guardar cambios</button>
													
							</div>
						</form>
							
						</div>
					</div>
				</div>
          
    </div>
</div><br>


<div class="container">

	<div class="row">
	 <div class="dark-banner-dos">
        <h2 class="text">Vengadores</h2>
    </div>
			<table class="table table-striped">
				<thead>
					<th>Nom. y Ap.</th>
					<th>Superhéroe</th>
					<th>Poderes</th>
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
					 <td class="text-center">
    					<a href="#" onclick="setRecordIdOrador('<%=resultadoOradores.get(x).getId()%>')" data-toggle="modal" data-target="#confirmModalOrador">
    				    	<i class="fa-solid fa-rectangle-xmark"></i>
    					</a>
					</td>				 
				</tr>
				<%
				
				}			
				%>
						
			</table>
			<!-- Modal de Confirmación -->
			<div class="modal fade" id="confirmModalOrador" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabelOrador" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="confirmModalLabelOrador">Confirmar eliminación</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							¿Estás seguro de que quieres eliminar este vengador?
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
							<form id="deleteFormOrador" action="FrontController" method="get">
								<input type="hidden" name="accion" value="eliminarOrador">
								<input type="hidden" name="id" id="recordIdOrador" value="">
								<button type="submit" class="btn btn-danger">Eliminar</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<a class="btn btn-success col-2 m-2" href="FrontController?accion=volver">Volver</a>
			
	</div>

</div>
	<script src="JS/javascript.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>