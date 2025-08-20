<%--
    Document   : index
    Created on : 22/07/2025, 10:20:01
    Author     : jerem
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CasaHogar - Panel de Control</title>
        <link rel="stylesheet" type="text/css" href="Styles/index.css"> 
        <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;600;700;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
            <div class="hero">
                <h1>Panel de Administración de Inmuebles</h1>
                <p>Gestiona todos los aspectos de tu sistema de inmuebles desde este panel centralizado. Accede rápidamente a cada sección.</p>
            </div>
            
                <div class="admin-card">
                    <span class="card-icon">
                        <i class="fa-solid fa-house"></i>
                    </span>
                    <h3 class="card-title">Tipos de Inmuebles</h3>
                    <p class="card-description">Gestiona la información de los tipos de inmuebles (casas, apartamentos, etc.), como agregar, listar, actualizar o eliminar.</p>
                    <a href="Controlador?menu=TipoInmueble&accion=Listar" class="btn_ver_gestion">Gestionar Tipos de Inmuebles</a>
                </div>

                <div class="admin-card">
                    <span class="card-icon">
                        <i class="fa-solid fa-user"></i>
                    </span>
                    <h3 class="card-title">Propietarios</h3>
                    <p class="card-description">Gestiona la información de los propietarios, como agregar, listar, actualizar o eliminar.</p>
                    <a href="Controlador?menu=Propietarios&accion=Listar" class="btn_ver_gestion">Gestionar Propietarios</a>
                </div>
            </div>
        </div>

        <div class="footer">
            <p>&copy; 2025 CasaHogar - Sistema de Gestión de Inmuebles. Encuentra la casa que se sienta hogar</p>
        </div>
    </body>
</html>
