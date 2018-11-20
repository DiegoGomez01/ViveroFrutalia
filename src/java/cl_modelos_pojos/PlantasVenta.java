package cl_modelos_pojos;
// Generated 21/04/2017 04:49:38 AM by Hibernate Tools 4.3.1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PlantasVenta generated by hbm2java
 */
@Entity
@Table(name = "planta_ventas",
        schema = "public"
)
public class PlantasVenta implements java.io.Serializable {

    private int id;
    private EtapasPlanta etapasPlanta;
    private VentasPlanta ventasPlanta;
    private int cantidad;
    private Integer descuento;

    public PlantasVenta() {
    }

    public PlantasVenta(int id, EtapasPlanta etapasPlanta, VentasPlanta ventasPlanta, int cantidad) {
        this.id = id;
        this.etapasPlanta = etapasPlanta;
        this.ventasPlanta = ventasPlanta;
        this.cantidad = cantidad;
    }

    public PlantasVenta(int id, EtapasPlanta etapasPlanta, VentasPlanta ventasPlanta, int cantidad, Integer descuento) {
        this.id = id;
        this.etapasPlanta = etapasPlanta;
        this.ventasPlanta = ventasPlanta;
        this.cantidad = cantidad;
        this.descuento = descuento;
    }

    @Id
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
        @JoinColumn(name = "plantas_id", referencedColumnName = "plantas_id", nullable = false)
        , @JoinColumn(name = "etapas_id", referencedColumnName = "etapas_id", nullable = false)})
    public EtapasPlanta getEtapasPlanta() {
        return this.etapasPlanta;
    }

    public void setEtapasPlanta(EtapasPlanta etapasPlanta) {
        this.etapasPlanta = etapasPlanta;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_ventas_planta", nullable = false)
    public VentasPlanta getVentasPlanta() {
        return this.ventasPlanta;
    }

    public void setVentasPlanta(VentasPlanta ventasPlanta) {
        this.ventasPlanta = ventasPlanta;
    }

    @Column(name = "cantidad", nullable = false)
    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    @Column(name = "descuento")
    public Integer getDescuento() {
        return this.descuento;
    }

    public void setDescuento(Integer descuento) {
        this.descuento = descuento;
    }

    @Override
    public String toString() {
        return "Id: '" + getId() + "', cantidad: '" + getCantidad() + "'";
    }

}