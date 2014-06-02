package ar.com.burudos.constants

import java.util.Date;

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Client;

class BuruConstants {
	static final MAX_FILE = 10*1024*1024 //10MB
	static final NO_VALID_FILE = "Invalid file"
	
	static final String file_altas = "ALTA";
	static final String file_cater = "CATER";
	static final String file_post = "POSTVENTA";
	static final String op_create_error = " No se puede crear Operacion ";
	static final String employee_exist_error = " No existe el empleado asociado ";
	static final String bu_exist_error = " No existe el Punto de venta asociado ";
	static final String trx_create_error = " No se puede crear Transaccion ";
	static final String emp_create_error = " No se puede crear el Empleado ";
	static final String cl_create_error = " No se puede crear el Cliente asociado ";
	static final String sum_create_error = " No se puede crear el Total ";
	
	static final String row_type="Tipo"
	static final String row_buname="Punto de Venta"
	static final String row_emp="Empleado";
	static final String row_op_code="Operacion";
	static final String row_date="Fecha";
	static final String row_sds="Sds"
	static final String row_ani="Ani"
	static final String row_imei="Imei"
	static final String row_sim="Sim"
	static final String row_folio="Folio"
	static final String row_partida="Partida"
	static final String row_cat_plan="Categoria Plan"
	static final String row_plan="Plan"
	static final String row_promo="Promo"
	static final String row_equipo="Equipo"
	static final String row_solicitud="Solicitud"
	static final String row_almacen="Almacen"
	static final String row_cliente="Cliente"
	static final String row_cliente_doc="Doc Cliente"
	static final String row_cancel="Cancel"
	static final String row_estado="Estado"
	static final String row_legajo="Legajo"
	static final String row_factura="Factura"
	static final String row_importe="Importe"
	static final String row_plan_dec="Plan desc"
	static final String row_plan_d="Plan desde"
	static final String row_plan_h="Plan hasta"
	static final String row_debaut="Debaut"
	
	static final String uploadFileEmployee="FileEmployee"
	static final String saveFileEmployee="/tmp/carga_" + uploadFileEmployee
	static final String dateFormatEmployee="MM/dd/yyyy"
	
	static final String uploadFileTransaction="FileTransaction"
	static final String saveFileTransaction="/tmp/carga_" + uploadFileTransaction
	
	static final String uploadFileParameter="FileParameters"
	static final String saveFileParameter="/tmp/carga_" + uploadFileParameter
	
	static final String uploadFileSummary="FileSummary"
	static final String saveFileSummary="/tmp/carga_" + uploadFileParameter
	
}
