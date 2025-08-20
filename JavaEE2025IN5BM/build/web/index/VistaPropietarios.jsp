<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CRUD_Propietarios</title>
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/Images/logo.jpg">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Styles/Propietarios.css">
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

                <h1>Bienvenido al CRUD de la entidad <b>Propietarios</b></h1>
                
                <div class="section">
                    <h2>Agregar o actualizar propietario</h2>
                    <form action="Controlador?menu=Propietarios" method="POST">
                        <input type="hidden" name="txtCodigoPropietario" value="${propietario.getCodigoPropietario()}">
                        <div class="form-row">
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtNombrePropietario" value="${propietario.getNombrePropietario()}" required>
                                <label class="label-input">Nombre Propietario</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtTelefonoPropietario" value="${propietario.getTelefonoPropietario()}" required>
                                <label class="label-input">Teléfono Propietario</label>
                            </div>
                            <div class="form-group">
                                <input type="email" class="entrada_texto" name="txtCorreoPropietario" value="${propietario.getCorreoPropietario()}" required>
                                <label class="label-input">Correo Propietario</label>
                            </div>
                            <div class="form-group">
                                <input type="text" class="entrada_texto" name="txtDireccionPropietario" value="${propietario.getDireccionPropietario()}" required>
                                <label class="label-input">Dirección Propietario</label>
                            </div>
                        </div>
                        <div class="form-row">
                            <button type="submit" class="btn_actualizar" value="Agregar" name="accion">
                                <span class="bnt_texto">Crear Propietario</span>
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
                    <h2>Lista y Buscar Propietarios</h2>
                    <form action="Controlador?menu=Propietarios" method="POST" class="search-section">
                        <div class="form-group search-group">
                            <input type="text" class="entrada_texto search-input" name="txtBuscarId" placeholder="">
                            <label class="label-input">Buscar Propietario por ID.</label>
                            <div class="search-icon">
                                <i class="fa-solid fa-search"></i>
                            </div>
                        </div>
                        <button type="submit" name="accion" value="Buscar" style="display:none;"></button>
                        <button type="button" class="btn_eliminar"
                                onclick="window.location.href = 'Controlador?menu=Propietarios&accion=Listar'">
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
                                    <th scope="col">Código Propietario</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Teléfono</th>
                                    <th scope="col">Correo</th>
                                    <th scope="col">Dirección</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="propietarios" items="${propietarios}">
                                    <tr>
                                        <td>${propietarios.getCodigoPropietario()}</td>
                                        <td>${propietarios.getNombrePropietario()}</td>
                                        <td>${propietarios.getTelefonoPropietario()}</td>
                                        <td>${propietarios.getCorreoPropietario()}</td>
                                        <td>${propietarios.getDireccionPropietario()}</td>
                                        <td>
                                            <button 
                                                type="button" 
                                                class="btn_editar" 
                                                onclick="window.location.href = 'Controlador?menu=Propietarios&accion=Editar&id=${propietarios.getCodigoPropietario()}'">
                                                <span class="bnt_texto">Editar</span>
                                                <span class="btn_icono">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </span>
                                            </button>
                                            <button 
                                                type="button" 
                                                class="btn_eliminar" 
                                                onclick="window.location.href = 'Controlador?menu=Propietarios&accion=Eliminar&id=${propietarios.getCodigoPropietario()}'">
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
request.getRequestDispatcher("index/VistaPropietarios.jsp").forward(request, response);