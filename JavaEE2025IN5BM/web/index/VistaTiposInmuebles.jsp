<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CRUD_TiposInmuebles</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/Images/logo.jpg">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/TiposInmuebles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    </head>

    <body>
        <nav class="navbar">
            <div class="nav-content">
                <ul class="menu">
                </ul>
            </div>
        </nav>

        <section>
            <div class="container">
                <!-- Botón para regresar al menú -->
                <button type="button" class="btn_regresar" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'">
                    <span class="bnt_texto">Regresar al Menú</span>
                    <span class="btn_icono">
                        <i class="fa-solid fa-arrow-left"></i>
                    </span>
                </button>

                <h1>Bienvenido al CRUD de la entidad <b>Tipos de Inmuebles</b></h1>

                <div class="section">
                    <h2>Agregar o actualizar tipo de inmueble</h2>
                    <form action="Controlador?menu=TipoInmueble" method="POST">
                        <input type="hidden" name="txtCodigoTipoInmueble" value="${tipoInmueble.getCodigoTipoInmueble()}">
                        <div class="form-row">
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtNombreTipoInmueble" value="${tipoInmueble.getNombreTipoInmueble()}" required>
                                <label class="label-input">Nombre Tipo Inmueble</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtDescripcion" value="${tipoInmueble.getDescripcion()}" required>
                                <label class="label-input">Descripción</label>
                            </div>
                        </div>
                        <div class="form-row">
                            <button type="submit" class="btn_actualizar" value="Agregar" name="accion">
                                <span class="bnt_texto">Crear Tipo Inmueble</span>
                                <span class="btn_icono">
                                    <i class="fa-solid fa-plus"></i>
                                </span>
                            </button>
                            <button type="submit" class="btn_actualizar" name="accion" value="Actualizar">
                                <span class="bnt_texto">Actualizar</span>
                                <span class="btn_icono">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </span>
                            </button>
                        </div>
                    </form>
                </div>

                <div class="section">
                    <h2>Lista y Buscar Tipos de Inmuebles</h2>
                    <form action="Controlador?menu=TipoInmueble" method="POST" class="search-section">
                        <div class="form-group search-group">
                            <input type="text" class="entrada_texto search-input" name="txtBuscarId" placeholder="">
                            <label class="label-input">Buscar Tipo de Inmueble por ID.</label>
                            <div class="search-icon">
                                <i class="fa-solid fa-search"></i>
                            </div>
                        </div>
                        <button type="submit" name="accion" value="Buscar" style="display:none;"></button>
                        <button type="button" class="btn_eliminar"
                                onclick="window.location.href = 'Controlador?menu=TipoInmueble&accion=Listar'">
                            <span class="bnt_texto">Cancelar</span>
                            <span class="btn_icono">
                                <i class="fa fa-solid fa-x"></i>
                            </span>
                        </button>
                    </form>

                    <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th scope="col">Código Tipo Inmueble</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Descripción</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="tiposInmuebles" items="${tiposInmuebles}">
                                    <tr>
                                        <td>${tiposInmuebles.getCodigoTipoInmueble()}</td>
                                        <td>${tiposInmuebles.getNombreTipoInmueble()}</td>
                                        <td>${tiposInmuebles.getDescripcion()}</td>
                                        <td>
                                            <button 
                                                type="button" 
                                                class="btn_editar" 
                                                onclick="window.location.href = 'Controlador?menu=TipoInmueble&accion=Editar&id=${tiposInmuebles.getCodigoTipoInmueble()}'">
                                                <span class="bnt_texto">Editar</span>
                                                <span class="btn_icono">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </span>
                                            </button>
                                            <button 
                                                type="button" 
                                                class="btn_eliminar" 
                                                onclick="window.location.href = 'Controlador?menu=TipoInmueble&accion=Eliminar&id=${tiposInmuebles.getCodigoTipoInmueble()}'">
                                                <span class="bnt_texto">Eliminar</span>
                                                <span class="btn_icono">
                                                    <i class="fa fa-trash"></i>
                                                </span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>