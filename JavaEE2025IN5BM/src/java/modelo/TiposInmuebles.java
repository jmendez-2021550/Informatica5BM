package modelo;

/**
 *
 * @author jerem
 */
public class TiposInmuebles {
    private int codigoTipoInmueble;
    private String nombreTipoInmueble;
    private String descripcion;

    // Constructor vacío
    public TiposInmuebles() {
    }

    // Constructor con parámetros
    public TiposInmuebles(int codigoTipoInmueble, String nombreTipoInmueble, String descripcion) {
        this.codigoTipoInmueble = codigoTipoInmueble;
        this.nombreTipoInmueble = nombreTipoInmueble;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getCodigoTipoInmueble() {
        return codigoTipoInmueble;
    }

    public void setCodigoTipoInmueble(int codigoTipoInmueble) {
        this.codigoTipoInmueble = codigoTipoInmueble;
    }

    public String getNombreTipoInmueble() {
        return nombreTipoInmueble;
    }

    public void setNombreTipoInmueble(String nombreTipoInmueble) {
        this.nombreTipoInmueble = nombreTipoInmueble;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    // Método toString()
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("TiposInmuebles{");
        sb.append("codigoTipoInmueble=").append(codigoTipoInmueble);
        sb.append(", nombreTipoInmueble=").append(nombreTipoInmueble);
        sb.append(", descripcion=").append(descripcion);
        sb.append('}');
        return sb.toString();
    }
}
