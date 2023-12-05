<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.ConexionDB"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conf BsAs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/index.css">
</head>

<body>
	<% 
	String id=request.getParameter("id");
	String foto=new String();
	if(id!=null){
		ConexionDB con=new ConexionDB();
		Statement st=con.conectar();
		ResultSet rs=st.executeQuery("SELECT * FROM usuarios WHERE id="+id);
		rs.next();
		foto=rs.getString("fotoPerfil");		
		//con.destruir();
	}
	%>

    <!--- Navbar---->
    <nav class="navbar navbar-expand-lg bg-body-tertiary " data-bs-theme="dark">
        <div class="container-fluid" style="--bs-gutter-x: 8.5rem">
            <a class="navbar-brand" href="inicio.jsp"><img src="../img/codoacodo.png" class="logo-nav" alt="codo a codo" >
            Conf BS AS
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
                </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav container-fluid justify-content-end aling-items-center  m-0 p-0">
                <li class="nav-item">
                    <img alt="" src="<%out.print(foto);%>" class="img-fluid rounded-4" width="40px">
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#">La conferencia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#oradores_Section">Los oradores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#lugar_y_fecha">El lugar y la fecha</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#formulario">Conviértete en orador</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-success boton_ticket" href="pages/buyTickets.html">Comprar tickets</a>
                </li>
            </ul>
        </div>
        </div>
    </nav>
    
	    <!---Carrusel---->
    <header id="confBsAs">
        <div id="carouselExampleFade" class="carousel carousel-fade slide" data-bs-ride="carousel">
            <div class="carousel-inner z-0">
                <div class="carousel-item active" data-bs-interval="7000">
                    <img src="../img/hawaii.jpg" class="img_carrusel d-block w-100 h-75" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="7000">
                    <img src="../img/hawaii2.jpg" class="img_carrusel d-block w-100 h-75" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="7000">
                    <img src="../img/hawaii3.jpg" class="img_carrusel d-block w-100 h-75" alt="...">
                </div>
                <div class="carousel-caption d-none d-md-block z-2 text-end w-50 ms-auto carrusel_texto">
                    <h1 class="fw-semibold carrusel_h1">Conf Bs As</h1>
                    <p class="fs-4 carrusel_p">Bs As llega por primera vez a Argentina. Un evento para compartir con nuestra comunidad el
                        conocimiento y experiencia de los expertos que estan creando el futuro de Internet. Ven a
                        conocer a miembros del evento, a otros estudiantes de Codo a Codo y los oradores de primer nivel
                        que tenemos para ti. Te esperamos!</p>
                    <button class="btn btn-outline-light fs-4 carrusel_boton">Quiero ser orador</button>
                    <button id="btnbuyTickets" class="btn bg-success text-light fs-4 boton_ticket" onclick="goBuyTickets()">Comprar tickets</button>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </a>

        </div>
    </header>
    <!----Cards---->
    <section id="oradores_Section">
        <div class="titulo-cards d-flex justify-content-center align-items-center flex-column text-uppercase">
            <p class="mini_titulo">conoce a los</p>
            <h2 class="fw-semibold">oradores</h2>
        </div>
    </section>
    <section class="oradores">
        <div class="container">
            <div class="row   justify-content-center ">
                <div class="d-flex justify-content-center flex-wrap">
						<%
			    		ConexionDB con=new ConexionDB();
			    		Statement st=con.conectar();
			    		ResultSet rs=st.executeQuery("SELECT * FROM oradores");
			    		while(rs.next()) {
			    			out.println("<div class='card'>");
			    			out.println("<img src='"+rs.getString("fotoPerfil")+"' class='img_cards card-img-top' alt='"+rs.getString("nombre")+"'>");
			    			out.println("<div class='card-body'>");
			    			out.println("<div >");
			    			out.println("<span class='badge text-bg-success'>'"+rs.getString("profesion")+"'</span>");
			    			out.println("</div>");
			    			out.println("<h5 class='card-title fw-semibold'>"+rs.getString("nombre") + " " +rs.getString("apellido") +"</h5>");
			    			out.println("<p class='card-text'>"+rs.getString("tema")+"</p>");
			    			out.println("</div>");
			    			out.println("</div>");
			    		}		
										
						%>
		                     

                    </div> 
                </div>
            </div>

    </section>
    <!----Lugar y fecha-->
    <section id="lugar_y_fecha">
        <div class="card">
            <div class="row g-1 w-100">
                <div class="col-md-6">
                    <img src="../img/honolulu.jpg" class="img-fluid" alt="Imagen">
                </div>
                <div class="col-md-6 bg-dark">
                    <div class="card-body">
                        <h5 class="card-title text-light fs-3 fw-semibold">Bs As - Octubre</h5>
                        <p class="card-text text-light">Buenos Aires es la provincia y localidad mas grande del estado
                            de
                            Argentina, en los Estados
                            Unidos. Honolulu es la mas sureña de entre las principales ciudades estadounidenses. Aunque
                            el
                            nombre de Honolulu se refiere al area urbana en la costa sureste de la isla de Oahu, la
                            ciudad y
                            el condado de Honolulu han formado una ciudad-condado consolidada que cubre toda la ciudad
                            (aproximadamente 600km² de superficie).
                        </p>
                        <button class="btn btn-outline-light">Conocé más</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!---Formulario-->
    <section id="formulario">
        <div class="titulo-cards d-flex justify-content-center align-items-center flex-column">
            <p class="mini_titulo text-uppercase">conviertete en un</p>
            <h2 class="fw-semibold text-uppercase">orador</h2>
            <p class="texto_formulario fs-6">Anótate como orador para dar una <span>charla ignite</span>. Cuéntanos de
                qué quieres hablar!</p>
        </div>
    </section>
    <section>
        <div class="container mb-3">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <form>
                        <div class="row mb-3">
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Nombre">
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" placeholder="Apellido">
                            </div>
                        </div>
                        <div class="mb-3">
                            <textarea class="form-control fs-4" id="texto"
                                placeholder="Sobre que quieres hablar?"></textarea>
                            <label for="texto" class="form-label fs-6">Recuerda incluir un título para tu charla</label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-success p-2" type="submit">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

<!--- Footer-->
    <footer class="container-fluid p-4">
        <div class="container">
            <div class="row g-0">
                <div class="col-md-12  text-center">
                    <ul class="list-unstyled d-flex justify-content-around align-content-center flex-wrap flex-sm-wrap flex-md-wrap flex-xl-nowrap py-2">
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Preguntas
                                frecuentes</a></li>
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Contáctanos</a></li>
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Prensa</a></li>
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Conferencias</a></li>
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Términos y
                                condiciones</a></li>
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Privacidad</a></li>
                        <li class="nav-item"><a href="#"
                                class="footer_link nav-link text-decoration-none text-wrap">Estudiantes</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="../js/tickets.js"></script>
</body>

</html>