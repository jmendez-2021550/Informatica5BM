<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CasaHogar - Bienvenido</title>
        <link rel="stylesheet" type="text/css" href="Styles/index.css">
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;600;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar">
            <div class="nav-content">
                <div class="logo">Casa<span>Hogar</span></div>
                <ul class="menu">
                    </ul>
            </div>
        </nav>

        <div class="container">
            <div class="carousel-container">
                <div id="inmueblesCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
                    <ol class="carousel-indicators">
                        <li data-target="#inmueblesCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#inmueblesCarousel" data-slide-to="1"></li>
                        <li data-target="#inmueblesCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/img/casa2.jpg" alt="Casa de lujo">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Encuentra el hogar perfecto</h5>
                                <p>Descubre nuestra amplia selección de casas y apartamentos.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/img/apartamento.jpg" alt="Apartamento moderno">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Apartamentos modernos</h5>
                                <p>Vive en el corazón de la ciudad con todas las comodidades.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/img/casita.jpg" alt="Villa con piscina">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Villas con vistas increíbles</h5>
                                <p>Relájate y disfruta del paisaje en tu nueva villa.</p>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#inmueblesCarousel" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Anterior</span>
                    </a>
                    <a class="carousel-control-next" href="#inmueblesCarousel" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Siguiente</span>
                    </a>
                </div>
            </div>

            <div class="card-section">
                <div class="card-grid">
                    <div class="main-card">
                        <span class="card-icon">
                            <i class="fa-solid fa-house"></i>
                        </span>
                        <h3 class="card-title">Tipos de Inmuebles</h3>
                        <p class="card-description">Gestión de tipos de inmuebles (casas, apartamentos, etc.).</p>
                        <a href="Controlador?menu=TipoInmueble&accion=Listar" class="btn-primary">Gestionar Tipos</a>
                    </div>

                    <div class="main-card">
                        <span class="card-icon">
                            <i class="fa-solid fa-user"></i>
                        </span>
                        <h3 class="card-title">Propietarios</h3>
                        <p class="card-description">Gestión de la información de los propietarios de inmuebles.</p>
                        <a href="Controlador?menu=Propietarios&accion=Listar" class="btn-primary">Gestionar Propietarios</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>&copy; 2025 CasaHogar - Sistema de Gestión de Inmuebles. Encuentra la casa que se sienta hogar</p>
        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>