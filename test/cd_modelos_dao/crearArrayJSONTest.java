package cd_modelos_dao;

import static org.junit.jupiter.api.Assertions.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import org.junit.jupiter.api.Test;

import cl_modelos_pojos.ComprasPlanta;

class crearArrayJSONTest {
	String filtro;
	String data;
	ComprasPlanta compra;
	boolean buscarID;
	ComprasDAO compraDao;

	public crearArrayJSONTest() {
		compraDao = new ComprasDAO();
		compra = new ComprasPlanta();
		filtro = "lineas";
		buscarID = false;
	}
	

	/*
	 * Se prueba el funcionamiento normal del método
	 */
	@Test
	void funcionamientoNormaltest() {
		data = "{\"proveedor\":\"Antonio (1111111)\",\"fecha\":\"2015/12/4\",\"factura\":\"100\",\"lineas\":[{\"planta\":\"acacia (2)\",\"etapa\":\"Germinaci?n (1)\",\"cantidad\":\"2\",\"descuento\":\"3000\"}]}";
		ComprasPlanta compraAct = compraDao.crearCompra(data, false);
		compraDao.crearArrayJSON(compraAct, filtro, data, false);
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		String fechaActual = df.format(compraAct.getFecha());

		assertEquals(1, compraAct.getPlantasCompras().size());// Número de lineas de compras registradas
		assertEquals("2015/12/04", fechaActual);// Fecha de la compra guardada
		assertEquals(100, compraAct.getNroFactura());// Número de factura guardado
		assertEquals(1111111, compraAct.getProveedores().getCedula());// Cedula del proveedor guardada
		assertEquals(7, compraAct.getId());// Id generado esperado
	}
	
	/*
	 * Se prueba que exista la posibilidad de no registrar ninguna linea de compra 
	 */
	@Test
	void compraSinLineastest() {
		filtro = "lineas";
		data = "{\"proveedor\":\"Antonio (1111111)\",\"fecha\":\"2015/12/4\",\"factura\":\"100\",\"lineas\":[]}";
		ComprasPlanta compraAct = compraDao.crearCompra(data, false);
		compraDao.crearArrayJSON(compraAct, filtro, data, false);

		assertEquals(0, compraAct.getPlantasCompras().size());
	}

	/*
	 * Se prueba que se lance un excepción si data no es un JSON
	 */
	@Test
	void DistintoJSONTest() {
		data = "esto es distinto a un JSON";
		assertThrows(Exception.class, () -> compraDao.crearArrayJSON(compra, filtro, data, buscarID));
	}
	
	/*
	 * Se prueba que se lance un excepción si el filtro es inválido
	 */
	@Test
	void filtroEquivocadoTest() {
		String filtroEquivocado = "otro";
		data = "{\"proveedor\":\"Antonio (1111111)\",\"fecha\":\"2015/12/4\",\"factura\":\"100\",\"lineas\":[{\"planta\":\"acacia (2)\",\"etapa\":\"Germinaci?n (1)\",\"cantidad\":\"2\",\"descuento\":\"3000\"}]}";
		assertThrows(Exception.class, () -> compraDao.crearArrayJSON(compra, filtroEquivocado, data, buscarID));
	}
	
	/*
	 * Se prueba que se lance un excepción si no encuentra el ID en el JSON data.
	 */
	@Test
	void buscarIDTest() {
		boolean siBuscarID = true;
		data = "{\"proveedor\":\"Antonio (1111111)\",\"fecha\":\"2015/12/4\",\"factura\":\"100\",\"lineas\":[{\"planta\":\"acacia (2)\",\"etapa\":\"Germinaci?n (1)\",\"cantidad\":\"2\",\"descuento\":\"3000\"}]}";
		assertThrows(Exception.class, () -> compraDao.crearArrayJSON(compra, filtro, data, siBuscarID));
	}
}
