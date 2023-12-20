<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bangers&display=swap">
     <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> 
    <title>Adriano Caloni</title>
</head>
<body>

<main>
     <!-- Cabecera -->
     <header>
        <div class="container text-center">
            <div class="row">
              <div class="col-4">
                <div class="row">
                  <div class="col">
                    <h4 id="tituloMenu">Conf Bs As - Vengadores </h4>
                  </div>
                </div>
              </div>
            <div class="col-8" id="titulosMenu">
                <nav >
                  <ul class="menu">
                    <li><a href="#" class="opcMenu" >La conferencia</a></li>
                    <li><a href="#" class="opcMenu" >Los vengadores</a></li>
                    <li><a href="#" class="opcMenu" >El lugar y la fecha</a></li>
                    <li><a href="#" class="opcMenu" >Conviértete en un vengador</a></li>
                    <li><a class="opcMenu comprarTickets" href="FrontController?accion=volver" >Inicio</a></li>
                  </ul>
                </nav>
            </div>
          </div>
        </div>
    </header>

    <div class="containerTicket">
    <section> 
        <div class="container text-center comprarTicket">
            <div class="row">
              <div class="col">
                <div class="card" style="width: 18rem;">
                    <div class="card-body estudiante">
                      <h5 class="card-title">Vengadores Originales</h5>
                      <p class="card-text">Tienen un descuento</p>
                      <p class="card-text">80%</p>
                      <p class="card-text">* presentar documentación</p>
                    </div>
                  </div>
              </div>
              <div class="col">
                <div class="card" style="width: 18rem;">
                    <div class="card-body trainee">
                      <h5 class="card-title">Nuevos Vengadores</h5>
                      <p class="card-text">Tienen un descuento</p>
                      <p class="card-text">50%</p>
                      <p class="card-text">* presentar documentación</p>
                    </div>
                  </div>
              </div>
              <div class="col">
                <div class="card" style="width: 18rem;">
                    <div class="card-body junior">
                      <h5 class="card-title">Vengadores Oscuros</h5>
                      <p class="card-text">Tienen un descuento</p>
                      <p class="card-text">15%</p>
                      <p class="card-text">* presentar documentación</p>
                    </div>
                  </div>
              </div>
            </div>
          </div>
    </section><br>

    <section>
        <div id="tituloDelContenido">
            <h5 id="tipoLetraVengadores" >VENTA</h5>
            <h2 id="tipoLetraVengadores" >VALOR DE TICKET $200</h2> 
        </div>
            <form class="containerForm" id="formularioCompraTickets" action="FrontController?accion=insert" method="post">
                <div class="text-center">
                    <div class="row">
                      <div class="col">
                        <input type="nombre" class="form-control" id="nombre" placeholder="Nombre" name="nombre">
                      </div>
                      <div class="col">
                        <input type="apellido" class="form-control" id="apellido" placeholder="Apellido" name="apellido">
                      </div>
                    </div>
                </div>
                  <div class="textarea mb-3">
                    <input type="apellido" class="form-control" id="email" placeholder="Correo" name="mail">
                  </div>
                  <div class="text">
                    <div class="row">
                      <div class="col">
                        <p>Cantidad</p>
                        <input type="number" class="form-control" id="cantidadNumero" placeholder="cantidad" name="cant">
                      </div>
                      <div class="col">
                        <p>Categoría</p>
                        <select class="form-select" aria-label="Default select example" id="categoria" name="categoria">
                            <option selected>-</option>
                            <option value="1">Vengadores Originales</option>
                            <option value="2">Nuevos Vengadores</option>
                            <option value="3">Vengadores Oscuros</option>
                          </select>                      
                        </div>
                    </div>
                </div> <br>
                <div class="text">
                  
                </div>
                <div class="d-grid gap-2">
                    <div class="row">
                      <div class="col d-grid gap-2">
                      		<a class="btn btn-outline-dark btn-lg" href="FrontController?accion=volver">Volver</a>
                       </div>      
                      
                      <div class="col d-grid gap-2">       	
							<button type="button" id="botonComprar" class="btn btn-outline-dark btn-lg" data-bs-toggle="modal" data-bs-target="#miModal"  disabled>Comprar</button>
                      </div>

                    </div>
                  </div>
     																		             
<!-- Comprar Tickets -->
<div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="miModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="tipoLetraVengadores">Conf Bs.As - Los Vengadores</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
      </div>
       <div class="modal-body">
    		<p id="estasSeguro">¿Estás seguro de querer comprar este ticket? </p>		
    		<strong>Total a pagar: <span id="totalAPagar"></span></strong>
    		<br><br>
    		<span id="mensajeCompra" style="display:none;">Compra Exitosa</span>
    		<span id="contador"></span>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" onclick="borrarValor()" >Cancelar</button>
        <button type="submit" class="btn btn-outline-success">Aceptar</button>
      </div>
    </div>
  </div>
</div>
    
            </form>
    </section>
</div>



</main>
        <!-- Pie de pagina -->
        <footer>
            <div class="container text-center">
              <div class="row">
                <div class="col-12 piePaginaTextUno">
                  <nav >
                    <ul class="piePagina">
                      <li><a href="#" class="opcFooter">Preguntas frecuentes</a></li>
                      <li><a href="#" class="opcFooter">Contáctanos</a></li>
                      <li><a href="#" class="opcFooter">Prensa</a></li>
                      <li><a href="#" class="opcFooter">Conferencias</a></li>
                      <li><a href="#" class="opcFooter">Términos y condiciones</a></li>
                      <li><a href="#" class="opcFooter">Privacidad</a></li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </footer>
<script src="JS/javascript.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>