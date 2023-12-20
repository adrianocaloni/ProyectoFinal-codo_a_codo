<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bangers&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <title>Adriano Caloni</title>
</head>
<body>

  <!-- Cabecera -->
 <header>

    <nav class="navbar navbar-dark bg-dark fixed-top navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <img id="imgCodoACodo" src="IMG/img/codoacodo.png"  alt="codoAcodo" style="width:100%">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">La conferencia</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#losOradores">Los vengadores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">El lugar y la fecha</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#convierteteEnOrador">Conviértete en un vengador</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn-compra-tickets text-success" href="FrontController?accion=registrar">Comprar tickets</a>
                    </li>
                    
                    <li class="nav-item">
                    	<a class="nav-link text-warning" href="FrontController?accion=backoffice">Back Office</a>
                    </li>        
                </ul>
            </div>
        </div>
    </nav>
</header>


<main>

<div id="carouselSlidesOnly" class="carousel slide position-relative d-flex align-items-center justify-content-end" data-bs-ride="carousel" data-bs-interval="13000">
  
  <!-- Videos del carrusel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <video width="100%" autoplay loop muted>
        <source src="IMG/img/intro1.mp4" class="d-block w-100 opacidad" type="video/mp4">
      </video>
    </div>
    <div class="carousel-item">
      <video width="100%" autoplay loop muted>
        <source src="IMG/img/intro3.mp4" class="d-block w-100 opacidad" type="video/mp4">
      </video>            
    </div>
  </div>

  <!-- Contenido adicional del carrusel -->
  <div class="position-absolute text-end col-md-6 col-12 text-light px-5">
    <!-- Contenido para pantallas grandes -->
    <div class="d-none d-md-block pt-5 mt-5">
      <h1 id="tipoLetraVengadores" >Conf Bs. As. Los Vengadores</h1>
      <p>Los Vengadores llegan por primera vez a Argentina. Un evento épico para reunir a nuestra comunidad y celebrar el poder y la pasión de los héroes más poderosos de la Tierra. Ven a conocer a miembros del equipo de los Vengadores, a otros aficionados del universo Marvel y a los icónicos superhéroes que tenemos para ti. ¡Te esperamos en esta aventura inolvidable!</p>
    </div>

    <!-- Contenido para pantallas medianas -->
    <div class="d-none d-sm-block d-md-none text-center mt-5 textoctubreBuenosAires">
      <h1 id="tipoLetraVengadores" >Los Vengadores</h1>
      <p>Los Vengadores llegan por primera vez a Argentina. Un evento épico para reunir a nuestra comunidad y celebrar el poder y la pasión de los héroes más poderosos de la Tierra. ¡Te esperamos!</p>
    </div>

    <!-- Contenido para pantallas pequeñas -->
    <div class="d-block d-sm-none text-center mb-0 pb-0 mt-5">
      <p class="mb-0 pt-3">Conoce los miembros del evento. ¡Te esperamos!</p>
    </div>

    <!-- Botones de acción -->
    <div class="pt-1 d-grid gap-2 d-md-block">
      <a type="button" class="btn btn-outline-light"  href="#convierteteEnOrador">Quiero ser vengador</a>
      <a class="btn btn-success" href="FrontController?accion=registrar">Comprar tickets</a>
    </div>
  </div>
</div>

    <section class="container mb-4" id="losOradores">
        <div id="tituloDelContenido">
            <h5 id="tipoLetraVengadores">CONOCE A LOS</h5>
            <h2 id="tipoLetraVengadores">VENGADORES</h2> 
        </div>  

        <div class="row justify-content-center">
            <div class="col-md-11">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card h-100">
                            <img src="IMG/img/iron.webp" class="card-img-top" alt="...">
                            <div class="card-body">
                                <div class="mb-2">
                                    <span class="badge bg-secondary">Vuelo supersónico</span>
                                    <span class="badge bg-danger">Filántropo</span>
                                </div>
                                <h5 class="card-title">Iron Man</h5>
                                <p class="card-text">
                                Tony Stark es un genio inventor, ingeniero y empresario multimillonario. Es conocido mundialmente por ser el CEO de Stark Industries, una compañía líder en tecnología armamentística. Después de ser secuestrado y herido por una de sus propias armas, Stark desarrolla un traje blindado avanzado que le proporciona superpoderes y lo protege de futuras amenazas. A medida que avanza la historia, Stark evoluciona, convirtiéndose en un filántropo comprometido y en uno de los principales defensores de la Tierra como el superhéroe Iron Man. 
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <img src="IMG/img/cap.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <div class="mb-2">
                                    <span class="badge bg-warning text-dark">Podría estar haciendo esto todo el día</span>
                                    <span class="badge bg-danger">Velocidad y fuerza sobrehumanas</span>
                                </div>
                                <h5 class="card-title">Capitán América</h5>
                                <p class="card-text">
									El Capitán América, cuyo nombre real es Steve Rogers, es un superhéroe legendario conocido por su lealtad inquebrantable, valentía y sentido de justicia. Originalmente un joven frágil y enfermizo durante la Segunda Guerra Mundial, Rogers se sometió al experimento del Suero del Super Soldado, que lo transformó en un físico perfecto y le otorgó habilidades sobrehumanas. Armado con un escudo indestructible hecho de un vibranium especial, el Capitán América lucha por la libertad y la justicia, defendiendo los ideales de los Estados Unidos y del mundo libre.
								</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <img src="IMG/img/thor.webp" class="card-img-top" alt="...">
                            <div class="card-body">
                                <div class="mb-2">
                                    <span class="badge bg-warning text-dark" >Protector de la tierra</span>
                                    <span class="badge bg-info">Dios del trueno</span>
                                </div>
                                <h5 class="card-title">Thor</h5>
                                <p class="card-text">
									Thor es un poderoso dios asgardiano, príncipe de Asgard y uno de los principales defensores del universo en el universo Marvel. Conocido por su imponente fuerza y destreza en combate, Thor empuña el martillo encantado Mjolnir, que le otorga la capacidad de controlar los elementos y poseer una fuerza sobrehumana. Aunque es arrogante y combativo en sus primeras apariciones, a lo largo de su historia, Thor muestra un profundo sentido del honor, sacrificio y deber. Además de sus hazañas en Asgard, Thor ha sido un miembro clave de los Vengadores, trabajando junto a otros superhéroes para defender la Tierra de amenazas tanto terrestres como cósmicas.                                 </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section>
      <div class="containerHonolulu">
        <div class="row octubreBuenosAires ">
          <div class="col">
              <img src="IMG/img/vengadores.webp" alt="imgPlaya" style="width:100%" > 
          </div>
          <div class="col textoctubreBuenosAires">
                <h3 id="tipoLetraVengadores">Bs As - Los Vengadores</h3>
                <p>                
					Los Vengadores de Marvel son un equipo de superhéroes que se unen para proteger el mundo de amenazas demasiado grandes para enfrentarlas solos. Fundados originalmente por figuras icónicas como Iron Man, Thor, Hulk, Ant-Man y la Avispa, este grupo ha sido una piedra angular en el universo de Marvel Comics. Con el tiempo, el equipo ha evolucionado, incorporando a numerosos héroes de diferentes orígenes y poderes. Su misión principal es defender la Tierra de todo tipo de peligros, desde amenazas terrestres hasta desafíos cósmicos, y su lema, "Unidos luchamos, divididos caemos", refleja la importancia de la colaboración y el trabajo en equipo en su lucha contra el mal. Los Vengadores no solo son conocidos por sus heroicas acciones, sino también por las complejas relaciones entre sus miembros y las profundas historias que han surgido de su colaboración y conflicto.
                </p>
                <button type="button" class="btn btn-outline-danger">Conocé más</button>
          </div>
        </div>
      </div>
    </section>
    
    <section class="convierteteEnOrador"  id="convierteteEnOrador">
        <div id="tituloDelContenido">
            <h5 id="tipoLetraVengadores">CONVIÉRTETE EN UN</h5>
            <h2 id="tipoLetraVengadores" >VENGADOR</h2> 
            <p>Anótate como vengador para dar una <u>charla ignite.</u> Cuéntanos sobre tus habilidades!</p>
        </div>
        <form class="containerForm" action="FrontController?accion=insertOrador" method="post">
            <div class="text-center">
                <div class="row">
                  <div class="col">
                    <input type="text" class="form-control" id="nombreVengador" placeholder="Nombre y Apellido" name="nombre">
                  </div>
                  <div class="col">
                    <input type="text" class="form-control" id="apellidoVengador" placeholder="Nombre de superhéroe" name="apellido">
                  </div>
                </div>
            </div>
              <div class="textarea mb-3">
                <textarea class="form-control" id="tematicaVengador" rows="3" placeholder="Cuales son tus poderes?" name="tematica"></textarea>
                <label for="tematicaVengador" class="form-label">Recuerda incluir tus super poderes</label>
              </div>
              <div class="d-grid gap-2">
                <button class="btn btn-success" type="submit">Enviar</button>
              </div>
        </form>
    </section>
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
                <li><a href="#" class="opcFooter">Estudiantes</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </footer>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>