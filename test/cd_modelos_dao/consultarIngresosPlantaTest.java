package cd_modelos_dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import cl_modelos_pojos.VentasPlanta;

class consultarIngresosPlantaTest {

	private PlantasDAO plantas;
	private int id;

	public consultarIngresosPlantaTest() {
		plantas = new PlantasDAO();
	}

	@BeforeEach
	void idPredeterminado() {
		id = -1;
	}

	/*
	 * Prueba de funcionamiento normal
	 */
	@Test
	void normalTest() {
		id = 1;
		VentasPlanta resultado = plantas.consultarIngresosPlanta(id);
		assertNotNull(resultado);
		int numRegistros = resultado.getPlantasVentas().size();
		assertEquals(numRegistros, 1);
	}
	
	/*
	 * Prueba con una planta que no tiene ventas 
	 */
	@Test
	void idEquivocadoTest() {
		id = 6;
		VentasPlanta resultado = plantas.consultarIngresosPlanta(id);
		assertNotNull(resultado);
		int numRegistros = resultado.getPlantasVentas().size();
		assertEquals(numRegistros, 0);
	}
	
	/*
	 * Prueba con un ID negativo
	 */
	@Test
	void idNegativoTest() {
		id = -1;
		assertThrows(Exception.class, () -> plantas.consultarIngresosPlanta(id));
	}
	
	/*
	 * Prueba con el ID de una planta que no existe en la base de datos
	 */
	@Test
	void idPlantaNoExistenteTest() {
		id = 50;
		assertThrows(Exception.class, () -> plantas.consultarIngresosPlanta(id));
	}
}
