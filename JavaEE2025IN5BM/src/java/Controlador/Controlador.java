package Controlador;

import modelo.Propietarios;
import modelo.PropietariosDAO;
import modelo.TiposInmuebles;
import modelo.TiposInmueblesDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Controlador para gestionar Propietarios y TiposInmuebles
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        PropietariosDAO propietariosDAO = new PropietariosDAO();
        Propietarios propietario = new Propietarios(); // Variable para un solo propietario
        TiposInmueblesDAO tiposInmueblesDAO = new TiposInmueblesDAO();
        TiposInmuebles tipoInmueble = new TiposInmuebles(); // Variable para un solo tipo de inmueble

        if (menu != null) {
            switch (menu) {
                case "Propietarios":
                    if (accion == null || accion.isEmpty()) {
                        accion = "Listar";
                    }
                    switch (accion) {
                        case "Listar":
                            List<Propietarios> listaPropietarios = propietariosDAO.listar();
                            System.out.println("Propietarios encontrados: " + listaPropietarios.size());
                            for (Propietarios p : listaPropietarios) {
                                System.out.println("ID: " + p.getCodigoPropietario() + ", Nombre: " + p.getNombrePropietario());
                            }
                            request.setAttribute("propietarios", listaPropietarios);
                            break;
                        case "Buscar":
                            String codigoProp = request.getParameter("txtBuscarId");
                            List<Propietarios> listaPropietariosB = new ArrayList<>();
                            if (codigoProp != null && !codigoProp.trim().isEmpty()) {
                                try {
                                    int codigoP = Integer.parseInt(codigoProp);
                                    Propietarios propietarioEncontrado = propietariosDAO.buscar(codigoP);
                                    if (propietarioEncontrado != null) {
                                        listaPropietariosB.add(propietarioEncontrado);
                                    } else {
                                        request.setAttribute("error", "Propietario no encontrado");
                                    }
                                } catch (NumberFormatException e) {
                                    request.setAttribute("error", "ID de Propietario inválido");
                                }
                            } else {
                                listaPropietariosB = propietariosDAO.listar();
                            }
                            request.setAttribute("propietarios", listaPropietariosB);
                            break;
                        case "Agregar":
                            String nombrePropietario = request.getParameter("txtNombrePropietario");
                            String telefonoPropietario = request.getParameter("txtTelefonoPropietario");
                            String correoPropietario = request.getParameter("txtCorreoPropietario");
                            String direccionPropietario = request.getParameter("txtDireccionPropietario");
                            propietario.setNombrePropietario(nombrePropietario);
                            propietario.setTelefonoPropietario(telefonoPropietario);
                            propietario.setCorreoPropietario(correoPropietario);
                            propietario.setDireccionPropietario(direccionPropietario);
                            propietariosDAO.agregar(propietario);
                            // Se redirige para evitar el doble envío del formulario
                            response.sendRedirect("Controlador?menu=Propietarios&accion=Listar");
                            return;
                        case "Editar":
                            int idEditarP = Integer.parseInt(request.getParameter("id"));
                            Propietarios propietarioEditar = propietariosDAO.buscar(idEditarP);
                            request.setAttribute("propietario", propietarioEditar);
                            List<Propietarios> listaPropietariosE = propietariosDAO.listar();
                            request.setAttribute("propietarios", listaPropietariosE);
                            break;
                        case "Actualizar":
                            int codigoPropietario = Integer.parseInt(request.getParameter("txtCodigoPropietario"));
                            String nuevoNombrePropietario = request.getParameter("txtNombrePropietario");
                            String nuevoTelefonoPropietario = request.getParameter("txtTelefonoPropietario");
                            String nuevoCorreoPropietario = request.getParameter("txtCorreoPropietario");
                            String nuevoDireccionPropietario = request.getParameter("txtDireccionPropietario");
                            propietario.setCodigoPropietario(codigoPropietario);
                            propietario.setNombrePropietario(nuevoNombrePropietario);
                            propietario.setTelefonoPropietario(nuevoTelefonoPropietario);
                            propietario.setCorreoPropietario(nuevoCorreoPropietario);
                            propietario.setDireccionPropietario(nuevoDireccionPropietario);
                            propietariosDAO.actualizar(propietario);
                            // Se redirige para reflejar los cambios en la lista
                            response.sendRedirect("Controlador?menu=Propietarios&accion=Listar");
                            return;
                        case "Eliminar":
                            String idEliminarP = request.getParameter("id");
                            if (idEliminarP != null && !idEliminarP.trim().isEmpty()) {
                                try {
                                    int codigo = Integer.parseInt(idEliminarP);
                                    propietariosDAO.eliminar(codigo);
                                } catch (NumberFormatException e) {
                                    request.setAttribute("error", "ID de Propietario inválido");
                                }
                            }
                            // Redirección para recargar la página y evitar re-envío
                            response.sendRedirect("Controlador?menu=Propietarios&accion=Listar");
                            return;
                        default:
                            System.out.println("No se encontró acción para Propietarios");
                            break;
                    }
                    request.getRequestDispatcher("index/VistaPropietarios.jsp").forward(request, response);
                    break;
                case "TipoInmueble":
                    if (accion == null || accion.isEmpty()) {
                        accion = "Listar";
                    }
                    switch (accion) {
                        case "Listar":
                            List<TiposInmuebles> listaTiposInmuebles = tiposInmueblesDAO.listar();
                            request.setAttribute("tiposInmuebles", listaTiposInmuebles);
                            break;
                        case "Buscar":
                            String codigoTipo = request.getParameter("txtBuscarId");
                            List<TiposInmuebles> listaTiposInmueblesB = new ArrayList<>();
                            if (codigoTipo != null && !codigoTipo.trim().isEmpty()) {
                                try {
                                    int codigoT = Integer.parseInt(codigoTipo);
                                    TiposInmuebles tipoEncontrado = tiposInmueblesDAO.buscar(codigoT);
                                    if (tipoEncontrado != null) {
                                        listaTiposInmueblesB.add(tipoEncontrado);
                                    } else {
                                        request.setAttribute("error", "Tipo de Inmueble no encontrado");
                                    }
                                } catch (NumberFormatException e) {
                                    request.setAttribute("error", "ID de Tipo de Inmueble inválido");
                                }
                            } else {
                                listaTiposInmueblesB = tiposInmueblesDAO.listar();
                            }
                            request.setAttribute("tiposInmuebles", listaTiposInmueblesB);
                            break;
                        case "Agregar":
                            String nombreTipoInmueble = request.getParameter("txtNombreTipoInmueble");
                            String descripcion = request.getParameter("txtDescripcion");
                            tipoInmueble.setNombreTipoInmueble(nombreTipoInmueble);
                            tipoInmueble.setDescripcion(descripcion);
                            tiposInmueblesDAO.agregar(tipoInmueble);
                            // Redirección para evitar el doble envío del formulario
                            response.sendRedirect("Controlador?menu=TipoInmueble&accion=Listar");
                            return;
                        case "Editar":
                            int idEditarT = Integer.parseInt(request.getParameter("id"));
                            TiposInmuebles tipoEditar = tiposInmueblesDAO.buscar(idEditarT);
                            request.setAttribute("tipoInmueble", tipoEditar);
                            List<TiposInmuebles> listaTiposInmueblesE = tiposInmueblesDAO.listar();
                            request.setAttribute("tiposInmuebles", listaTiposInmueblesE);
                            break;
                        case "Actualizar":
                            int codigoTipoInmueble = Integer.parseInt(request.getParameter("txtCodigoTipoInmueble"));
                            String nuevoNombreTipoInmueble = request.getParameter("txtNombreTipoInmueble");
                            String nuevaDescripcion = request.getParameter("txtDescripcion");
                            tipoInmueble.setCodigoTipoInmueble(codigoTipoInmueble);
                            tipoInmueble.setNombreTipoInmueble(nuevoNombreTipoInmueble);
                            tipoInmueble.setDescripcion(nuevaDescripcion);
                            tiposInmueblesDAO.actualizar(tipoInmueble);
                            // Redirección para reflejar los cambios en la lista
                            response.sendRedirect("Controlador?menu=TipoInmueble&accion=Listar");
                            return;
                        case "Eliminar":
                            String idEliminarT = request.getParameter("id");
                            if (idEliminarT != null && !idEliminarT.trim().isEmpty()) {
                                try {
                                    int codigo = Integer.parseInt(idEliminarT);
                                    tiposInmueblesDAO.eliminar(codigo);
                                } catch (NumberFormatException e) {
                                    request.setAttribute("error", "ID de Tipo de Inmueble inválido");
                                }
                            }
                            // Redirección para recargar la página y evitar re-envío
                            response.sendRedirect("Controlador?menu=TipoInmueble&accion=Listar");
                            return;
                        default:
                            System.out.println("No se encontró acción para TipoInmueble");
                            break;
                    }
                    request.getRequestDispatcher("index/VistaTiposInmuebles.jsp").forward(request, response);
                    break;
                case "VistaAdmin":
                    request.getRequestDispatcher("index/vistaadmin.jsp").forward(request, response);
                    break;
                case "Index":
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                default:
                    System.out.println("Opción de menú no válida");
                    break;
            }
        } else {
            // Manejar caso en que 'menu' es nulo
            response.sendRedirect("index.jsp"); // Redirigir a la página de inicio
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para gestionar Propietarios y TiposInmuebles";
    }
}