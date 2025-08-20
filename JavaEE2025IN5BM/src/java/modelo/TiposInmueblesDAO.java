package modelo;

/**
 *
 * @author jerem
 */
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TiposInmueblesDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    // Método para listar todos los tipos de inmuebles
    public List<TiposInmuebles> listar() {
        String sql = "call sp_ListarTiposInmuebles();";
        List<TiposInmuebles> listaTiposInmuebles = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TiposInmuebles tipoInmueble = new TiposInmuebles();
                tipoInmueble.setCodigoTipoInmueble(rs.getInt("codigoTipoInmueble"));
                tipoInmueble.setNombreTipoInmueble(rs.getString("nombreTipoInmueble"));
                tipoInmueble.setDescripcion(rs.getString("descripcion"));
                listaTiposInmuebles.add(tipoInmueble);
            }
        } catch (Exception e) {
            System.out.println("Error al listar tipos de inmuebles: " + e.getMessage());
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
        return listaTiposInmuebles;
    }

    // Método para agregar un tipo de inmueble
    public int agregar(TiposInmuebles tipoInmueble) {
        String sql = "call sp_AgregarTipoInmueble(?, ?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, tipoInmueble.getNombreTipoInmueble());
            ps.setString(2, tipoInmueble.getDescripcion());
            resp = ps.executeUpdate();
            System.out.println("Tipo de inmueble agregado. Filas afectadas: " + resp);
        } catch (Exception e) {
            System.out.println("Error al agregar tipo de inmueble: " + e.getMessage());
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

    // Método para eliminar un tipo de inmueble
    public int eliminar(int codigoTipoInmueble) {
        String sql = "call sp_EliminarTipoInmueble(?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoTipoInmueble);
            resp = ps.executeUpdate();
            System.out.println("Tipo de inmueble eliminado. Filas afectadas: " + resp);
        } catch (Exception e) {
            System.out.println("Error al eliminar tipo de inmueble: " + e.getMessage());
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

    // Método para buscar un tipo de inmueble por su código
    public TiposInmuebles buscar(int codigoTipoInmueble) {
        String sql = "call sp_BuscarTipoInmueble(?);";
        TiposInmuebles tipoInmueble = null;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigoTipoInmueble);
            rs = ps.executeQuery();
            if (rs.next()) {
                tipoInmueble = new TiposInmuebles();
                tipoInmueble.setCodigoTipoInmueble(rs.getInt("codigoTipoInmueble"));
                tipoInmueble.setNombreTipoInmueble(rs.getString("nombreTipoInmueble"));
                tipoInmueble.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar tipo de inmueble: " + e.getMessage());
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
        return tipoInmueble;
    }

    // Método para actualizar un tipo de inmueble
    public int actualizar(TiposInmuebles tipoInmueble) {
        String sql = "call sp_EditarTipoInmueble(?, ?, ?);";
        resp = 0;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, tipoInmueble.getCodigoTipoInmueble());
            ps.setString(2, tipoInmueble.getNombreTipoInmueble());
            ps.setString(3, tipoInmueble.getDescripcion());
            resp = ps.executeUpdate();
            System.out.println("Tipo de inmueble actualizado. Filas afectadas: " + resp);
        } catch (Exception e) {
            System.out.println("Error al actualizar tipo de inmueble: " + e.getMessage());
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
