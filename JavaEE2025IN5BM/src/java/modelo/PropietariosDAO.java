package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Propietarios;

public class PropietariosDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // Método para listar todos los propietarios
    public List<Propietarios> listar() {
        List<Propietarios> lista = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = cn.Conexion(); // <-- revisa que esto no sea null
            if (con == null) {
                System.out.println("Error: conexión es null");
                return lista;
            }
            ps = con.prepareStatement("SELECT * FROM propietarios");
            rs = ps.executeQuery();
            while (rs.next()) {
                Propietarios propietario = new Propietarios();
                propietario.setCodigoPropietario(rs.getInt("codigoPropietario"));
                propietario.setNombrePropietario(rs.getString("nombrePropietario"));
                propietario.setTelefonoPropietario(rs.getString("telefonoPropietario"));
                propietario.setCorreoPropietario(rs.getString("correoPropietario"));
                propietario.setDireccionPropietario(rs.getString("direccionPropietario"));
                lista.add(propietario);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    // Método para agregar un propietario
    public int agregar(Propietarios propietario) {
        String sql = "call sp_AgregarPropietario(?, ?, ?, ?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, propietario.getNombrePropietario());
            ps.setString(2, propietario.getTelefonoPropietario());
            ps.setString(3, propietario.getCorreoPropietario());
            ps.setString(4, propietario.getDireccionPropietario());
            resp = ps.executeUpdate();
            System.out.println("Propietario agregado. Filas afectadas: " + resp);
        } catch (Exception e) {
            System.out.println("Error al agregar propietario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resp;
    }

    // Método para eliminar un propietario
    public int eliminar(int codigoPropietario) {
        String sql = "call sp_EliminarPropietario(?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoPropietario);
            resp = ps.executeUpdate();
            System.out.println("Propietario eliminado. Filas afectadas: " + resp);
        } catch (Exception e) {
            System.out.println("Error al eliminar propietario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resp;
    }

    // Método para buscar un propietario por su código
    public Propietarios buscar(int codigoPropietario) {
        String sql = "call sp_BuscarPropietario(?);";
        Propietarios propietario = null;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoPropietario);
            rs = ps.executeQuery();
            if (rs.next()) {
                propietario = new Propietarios();
                propietario.setCodigoPropietario(rs.getInt("codigoPropietario"));
                propietario.setNombrePropietario(rs.getString("nombrePropietario"));
                propietario.setTelefonoPropietario(rs.getString("telefonoPropietario"));
                propietario.setCorreoPropietario(rs.getString("correoPropietario"));
                propietario.setDireccionPropietario(rs.getString("direccionPropietario"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar propietario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return propietario;
    }

    // Método para actualizar un propietario
    public int actualizar(Propietarios propietario) {
        String sql = "call sp_EditarPropietario(?, ?, ?, ?, ?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, propietario.getCodigoPropietario());
            ps.setString(2, propietario.getNombrePropietario());
            ps.setString(3, propietario.getTelefonoPropietario());
            ps.setString(4, propietario.getCorreoPropietario());
            ps.setString(5, propietario.getDireccionPropietario());
            resp = ps.executeUpdate();
            System.out.println("Propietario actualizado. Filas afectadas: " + resp);
        } catch (Exception e) {
            System.out.println("Error al actualizar propietario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return resp;
    }
}
