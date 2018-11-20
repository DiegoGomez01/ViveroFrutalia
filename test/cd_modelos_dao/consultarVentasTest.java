package cd_modelos_dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import Modelos.Venta;
import Modelos.VentasProveedores;

class consultarVentasTest {
	private ReportesDeVentasDAO reporte;
	private boolean consultarPlantasFlag;
	private boolean consultarSuministrosFlag;
	private String queryPlanta;
	private String querySuministro;
	private String fechaInicio;
	private String fechaFin;

	/*
	 * Se inicializan algunas variables para todas las pruebas.
	 */
	public consultarVentasTest() {
		reporte = new ReportesDeVentasDAO();
		queryPlanta = "from VentasPlanta";
		querySuministro = "from VentaSuministros";
	}

	/*
	 * Se le asigna un valor predeterminado a las variables que lo requieren.
	 */
	@BeforeEach
	void limpiarVariables() {
		consultarPlantasFlag = false;
		consultarSuministrosFlag = false;
		fechaInicio = "";
		fechaFin = "";
	}

	/**
	 * Se prueba el funcionamiento normal del método, utilizando todos los
	 * parámetros.
	 */
	@Test
	void funcionamientoNormalTest() {
		consultarPlantasFlag = true;
		consultarSuministrosFlag = true;
		fechaInicio = "01-03-2017";
		fechaFin = "14-09-2018";
		VentasProveedores ventas = reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag, queryPlanta,
				querySuministro, fechaInicio, fechaFin);
		int resultado = ventas.getVentas().size();
		int esperado = 8; // Total de ventas entre suministros y plantas
							// entre el 01/Marzo/2017 al 14/Septiembre/2018.
		assertEquals(esperado, resultado);
	}

	/**
	 * Se prueba que al ingresar una fecha como null se genere una excepción
	 */
	@Test
	void fechaNullTest() {
		consultarPlantasFlag = true;
		fechaInicio = null;
		fechaFin = "";
		assertThrows(Exception.class, () -> reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag,
				queryPlanta, querySuministro, fechaInicio, fechaFin));
	}

	/**
	 * Se prueba que solo haya una lista de ventas de plantas
	 */
	@Test
	void soloPlantasTest() {
		consultarPlantasFlag = true;
		consultarSuministrosFlag = false;
		fechaInicio = "01-03-2017";
		fechaFin = "14-09-2018";
		VentasProveedores ventas = reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag, queryPlanta,
				querySuministro, fechaInicio, fechaFin);
		List<Venta> listaVentas = ventas.getVentas();
		int resultado = listaVentas.size();
		boolean sonPlanta = true;
		for (Venta venta : listaVentas) {
			if (venta.getDetalle() != "PLANTA") {
				sonPlanta = false;
				break;
			}
		}
		int esperado = 5; // Total de ventas de plantas entre el 01/Marzo/2017 al 14/Septiembre/2018.
		assertEquals(esperado, resultado);
		assertTrue(sonPlanta);
	}

	/**
	 * Se prueba que solo haya una lista de ventas de suministros
	 */
	@Test
	void soloSuministrosTest() {
		consultarPlantasFlag = false;
		consultarSuministrosFlag = true;
		fechaInicio = "01-03-2017";
		fechaFin = "14-09-2018";
		VentasProveedores ventas = reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag, queryPlanta,
				querySuministro, fechaInicio, fechaFin);
		List<Venta> listaVentas = ventas.getVentas();
		int resultado = listaVentas.size();
		boolean sonSuministros = true;
		for (Venta venta : listaVentas) {
			if (venta.getDetalle() != "SUMINISTRO") {
				sonSuministros = false;
				break;
			}
		}
		int esperado = 3; // Total de suministros entre el 01/Marzo/2017 al 14/Septiembre/2018.
		assertEquals(esperado, resultado);
		assertTrue(sonSuministros);
	}

	/**
	 * Probar Fechas vacias para no tener intervalo de tiempo
	 */
	@Test
	void fechasVaciasTest() {
		consultarPlantasFlag = true;
		consultarSuministrosFlag = true;
		VentasProveedores ventas = reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag, queryPlanta,
				querySuministro, fechaInicio, fechaFin);
		List<Venta> listaVentas = ventas.getVentas();
		int resultado = listaVentas.size();
		int esperado = 8; // Total de ventas de plantas y suministros sin importar el intervalo de tiempo.
		assertEquals(esperado, resultado);
	}

	/**
	 * Se prueba que no se consulte nada
	 */
	@Test
	void niPlantasNiSuministrosTest() {
		consultarPlantasFlag = false;
		consultarSuministrosFlag = false;
		VentasProveedores ventas = reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag, queryPlanta,
				querySuministro, fechaInicio, fechaFin);
		List<Venta> listaVentas = ventas.getVentas();
		int resultado = listaVentas.size();
		int esperado = 0;
		assertEquals(esperado, resultado);
	}

	/**
	 * Query inválida
	 */
	@Test
	void queryInvalidaTest() {
		consultarPlantasFlag = true;
		consultarSuministrosFlag = false;
		fechaInicio = "01-03-2017";
		fechaFin = "14-09-2018";
		String queryAux = "Cualquier cosa";
		assertThrows(Exception.class, () -> reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag,
				queryAux, querySuministro, fechaInicio, fechaFin));
	}

	/**
	 * probar Query null
	 */
	@Test
	void queryNullTest() {
		consultarPlantasFlag = true;
		consultarSuministrosFlag = false;
		fechaInicio = "01-03-2017";
		fechaFin = "14-09-2018";
		String queryAux = null;
		assertThrows(Exception.class, () -> reporte.consultarVentas(consultarPlantasFlag, consultarSuministrosFlag,
				queryAux, querySuministro, fechaInicio, fechaFin));
	}
}
