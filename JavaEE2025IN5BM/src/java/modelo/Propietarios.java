package modelo;

public class Propietarios {
    private int codigoPropietario;
    private String nombrePropietario;
    private String telefonoPropietario;
    private String correoPropietario;
    private String direccionPropietario;

    // Constructor vacío
    public Propietarios() {
    }

    // Constructor con parámetros
    public Propietarios(int codigoPropietario, String nombrePropietario, String telefonoPropietario, String correoPropietario, String direccionPropietario) {
        this.codigoPropietario = codigoPropietario;
        this.nombrePropietario = nombrePropietario;
        this.telefonoPropietario = telefonoPropietario;
        this.correoPropietario = correoPropietario;
        this.direccionPropietario = direccionPropietario;
    }

    // Getters y Setters
    public int getCodigoPropietario() {
        return codigoPropietario;
    }

    public void setCodigoPropietario(int codigoPropietario) {
        this.codigoPropietario = codigoPropietario;
    }

    public String getNombrePropietario() {
        return nombrePropietario;
    }

    public void setNombrePropietario(String nombrePropietario) {
        this.nombrePropietario = nombrePropietario;
    }

    public String getTelefonoPropietario() {
        return telefonoPropietario;
    }

    public void setTelefonoPropietario(String telefonoPropietario) {
        this.telefonoPropietario = telefonoPropietario;
    }

    public String getCorreoPropietario() {
        return correoPropietario;
    }

    public void setCorreoPropietario(String correoPropietario) {
        this.correoPropietario = correoPropietario;
    }

    public String getDireccionPropietario() {
        return direccionPropietario;
    }

    public void setDireccionPropietario(String direccionPropietario) {
        this.direccionPropietario = direccionPropietario;
    }

    // Método toString()
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Propietarios{");
        sb.append("codigoPropietario=").append(codigoPropietario);
        sb.append(", nombrePropietario=").append(nombrePropietario);
        sb.append(", telefonoPropietario=").append(telefonoPropietario);
        sb.append(", correoPropietario=").append(correoPropietario);
        sb.append(", direccionPropietario=").append(direccionPropietario);
        sb.append('}');
        return sb.toString();
    }
}
