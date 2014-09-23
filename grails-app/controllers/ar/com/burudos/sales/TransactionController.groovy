package ar.com.burudos.sales
import java.text.DateFormat;
import org.apache.commons.logging.LogFactory
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;

import static org.springframework.http.HttpStatus.*

import java.util.Date;

import grails.transaction.Transactional
import ar.com.burudos.party.Client;
import ar.com.burudos.party.Employee
import ar.com.burudos.sales.Operation
import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.constants.BuruConstants

@Transactional(readOnly = true)
class TransactionController {

	private static final log = LogFactory.getLog(this)

	static Boolean linkMe = true
	static String btnName = "transaction.btnLabel"
	static String iconName = "transaction.iconName"

	static allowedMethods = [save: "POST", update: "PUT"]

	def index(Integer max, Integer offset, String search) {

		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];

		/*Initialization*/
		if (!search)
			search = "";
		if (!offset)
			offset = 0;
		if (!max)
			max = 20;
		params.max = max;

		/*Date to get index list*/
		def datemonth
		def dateyear
		if (!params.month_month) {
			String hql = "select month(max(datet)) as maxMonth, year(max(datet)) as maxYear  from Transaction"
			def result = Transaction.executeQuery(hql)
			if (!result.isEmpty() && result[0][0]!=null){
				datemonth = String.valueOf(result[0][0])
				dateyear = String.valueOf(result[0][1])
				params.month_month = String.valueOf(result[0][0])
				params.month_year = dateyear
			}
			else {
				def today= new Date()
				datemonth = String.valueOf(today[Calendar.MONTH])
				dateyear = String.valueOf(today[Calendar.YEAR])
				params.month_month = datemonth
				params.month_year = dateyear
			}
		}else{
			datemonth = params.month_month
			dateyear = params.month_year
		}

		def query = Transaction.where{
			( op.code ==~  "%${search}%" ||
					party.name ==~  "%${search}%" ) &&(
					month(datet) == params.month_month &&
					year(datet) == params.month_year)
		}

		lista = query.list(params)

		total = query.count()

		mapsearch.put("search", params.search);

		respond lista, model:[transactionInstanceCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}

	def uploads(Integer max, Integer offset, String search) {

		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];

		/*Initialization*/
		if (!search)
			search = "";
		if (!offset)
			offset = 0;
		if (!max)
			max = 100;
		params.max = max;
		
		/*Date to get index list*/
		def datemonth
		def dateyear
		if (!params.month_month) {
			String hql = "select month(max(dateofupload)) as maxMonth, year(max(dateofupload)) as maxYear  from Transaction"
			def result = Transaction.executeQuery(hql)
			if (!result.isEmpty() && result[0][0]!=null){
				datemonth = String.valueOf(result[0][0])
				dateyear = String.valueOf(result[0][1])
				params.month_month = String.valueOf(result[0][0])
				params.month_year = dateyear
			}
			else {
				def today= new Date()
				datemonth = String.valueOf(today[Calendar.MONTH])
				dateyear = String.valueOf(today[Calendar.YEAR])
				params.month_month = datemonth
				params.month_year = dateyear
			}
		}else{
			datemonth = params.month_month
			dateyear = params.month_year
		}

		lista = Transaction.executeQuery("select distinct typeofupload as type, dateofupload as date, count(*) as cant from Transaction group by typeofupload, dateofupload")

		total = lista.size()

		mapsearch.put("search", params.search);

		respond lista, model:[uploadsList:lista, uploadsCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}


	def show(Transaction transactionInstance) {
		respond transactionInstance
	}

	def create() {
		respond new Transaction(params)
	}

	@Transactional
	def save(Transaction transactionInstance) {
		if (transactionInstance == null) {
			notFound()
			return
		}

		if (transactionInstance.hasErrors()) {
			respond transactionInstance.errors, view:'create'
			return
		}

		transactionInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'transactionInstance.label', default: 'Transaction'),
					transactionInstance.id
				])
				redirect transactionInstance
			}
			'*' { respond transactionInstance, [status: CREATED] }
		}
	}

	def edit(Transaction transactionInstance) {
		respond transactionInstance
	}

	@Transactional
	def update(Transaction transactionInstance) {
		if (transactionInstance == null) {
			notFound()
			return
		}

		if (transactionInstance.hasErrors()) {
			respond transactionInstance.errors, view:'edit'
			return
		}

		transactionInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Transaction.label', default: 'Transaction'),
					transactionInstance.id
				])
				redirect transactionInstance
			}
			'*'{ respond transactionInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Transaction transactionInstance) {

		if (transactionInstance == null) {
			notFound()
			return
		}

		transactionInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Transaction.label', default: 'Transaction'),
					transactionInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	def upload = {
		// do something with the file
	}

	@Transactional
	def uploadFile(Transaction transactionInstance) {

		/*Analize each line of the file*/
		def reportOfErrors = [:]
		def mapreport = [:]

		/*line of Error*/
		int linea = 0
		/*line of row in file*/
		int rownumber = 0

		def code
		def Map row_mapa = [:]

		/*Upload file properties*/
		def update = new Date()
		def uptype

		transactionInstance.clearErrors();

		/*File management*/
		def file = request.getFile(BuruConstants.uploadFileTransaction)
		def jfile = new java.io.File( BuruConstants.saveFileTransaction )
		if(file && !file.empty && file.size < BuruConstants.MAX_FILE) {
			file.transferTo( jfile )
		}
		else{
			transactionInstance.errors.reject(BuruConstants.NO_VALID_FILE);
			respond transactionInstance.errors, view:'upload_result', model:[report:mapreport]
			return
		}

		def empmap = [:]
		Employee.findAll().each() { ee->
			empmap[ee.name] = ee
		}

		jfile.splitEachLine('\t') { row ->
			rownumber++
			println "Row N: " + rownumber
			try {
				row_mapa[BuruConstants.row_type]        = "params.type_file";
				row_mapa[BuruConstants.row_iva]         = 0;
				row_mapa[BuruConstants.row_iibb]        = 0;
				row_mapa[BuruConstants.row_total]       = 0;
				row_mapa[BuruConstants.row_neto]        = 0;
				def thereiserror = false
				//print params.type_file.equals(BuruConstants.file_altas)
				if ( params.type_file.equals(BuruConstants.file_altas) ) {
					uptype = BuruConstants.uploadtype_alta
					row_mapa[BuruConstants.row_buname]  = row[1];
					row_mapa[BuruConstants.row_emp]     = row[2];
					row_mapa[BuruConstants.row_date]    = row[3];
					row_mapa[BuruConstants.row_op_code] = row[11];
					row_mapa[BuruConstants.row_plan]    = row[11];
					row_mapa[BuruConstants.row_sds]     = row[4];
					row_mapa[BuruConstants.row_ani]     = row[5];
					//row_mapa[BuruConstants.row_portabilidad] = row[6];
					row_mapa[BuruConstants.row_cliente] = row[7];
					row_mapa[BuruConstants.row_imei]    = row[8];
					row_mapa[BuruConstants.row_sim]     = row[9];
					row_mapa[BuruConstants.row_cat_plan]= row[10];
					row_mapa[BuruConstants.row_promo]   = row[12];
					//row_mapa[BuruConstants.row_oferta]   = row[13];
					row_mapa[BuruConstants.row_equipo]  = row[14];
					row_mapa[BuruConstants.row_almacen] = row[15];
					row_mapa[BuruConstants.row_cliente] = row[16];
					row_mapa[BuruConstants.row_cliente_doc]  = row[17];
					row_mapa[BuruConstants.row_cancel]  = row[19];
					row_mapa[BuruConstants.row_legajo]  = row[21];
					row_mapa[BuruConstants.row_factura] = row[22];
					row_mapa[BuruConstants.row_importe] = row[23];
					row_mapa[BuruConstants.row_op_desc]= row[24];
					row_mapa[BuruConstants.row_debaut]  = row[25];
				}else if ( params.type_file.equals(BuruConstants.file_cater)){
					uptype = BuruConstants.uploadtype_cater
					row_mapa[BuruConstants.row_buname]  = row[3];
					row_mapa[BuruConstants.row_emp]     = row[4];
					row_mapa[BuruConstants.row_date]    = row[5];
					row_mapa[BuruConstants.row_op_code] = row[1];
					row_mapa[BuruConstants.row_sds]     = row[5];
					row_mapa[BuruConstants.row_ani]     = row[6];
					row_mapa[BuruConstants.row_sim]     = row[7];
					row_mapa[BuruConstants.row_imei]    = row[8];
					row_mapa[BuruConstants.row_folio]   = row[9];
					row_mapa[BuruConstants.row_plan]    = row[10];
					row_mapa[BuruConstants.row_factura] = row[11];
					row_mapa[BuruConstants.row_equipo]  = row[12];
					row_mapa[BuruConstants.row_partida] = row[13];
					row_mapa[BuruConstants.row_cancel]  = row[14];
					row_mapa[BuruConstants.row_cliente] = row[15];
					row_mapa[BuruConstants.row_cliente_doc]  = row[16];
				}else if ( params.type_file.equals(BuruConstants.file_post)){
					uptype = BuruConstants.uploadtype_post
					row_mapa[BuruConstants.row_buname]    = row[1];
					row_mapa[BuruConstants.row_emp]       = row[2];
					row_mapa[BuruConstants.row_date]      = row[3];
					row_mapa[BuruConstants.row_op_code]   = row[0];
					row_mapa[BuruConstants.row_ani]       = row[5];
					row_mapa[BuruConstants.row_solicitud] = row[6];
					row_mapa[BuruConstants.row_servicio]  = row[7];
					//row_mapa[BuruConstants.row_plan_h]    = row[8];
					//row_mapa[BuruConstants.row_plan_d]    = row[9];
					//row_mapa[BuruConstants.row_op_desc]   = row[7];
				}else if ( params.type_file.equals(BuruConstants.file_facturacion)){
					uptype = BuruConstants.uploadtype_facturacion
					row_mapa[BuruConstants.row_date]      = row[0];
					row_mapa[BuruConstants.row_emp]       = row[1];
					row_mapa[BuruConstants.row_tipo_fact] = row[2];
					row_mapa[BuruConstants.row_factura]   = row[3];
					row_mapa[BuruConstants.row_op_code]   = row[4];
					row_mapa[BuruConstants.row_op_type]   = row[5];
					row_mapa[BuruConstants.row_op_desc]   = row[6];
					row_mapa[BuruConstants.row_equipo]    = row[7];
					row_mapa[BuruConstants.row_blister]   = row[8];
					row_mapa[BuruConstants.row_cantidad]  = row[9];
					row_mapa[BuruConstants.row_neto]      = row[10];
					row_mapa[BuruConstants.row_descuento] = row[11];
					//row_mapa[BuruConstants.row_neto]      = row[12];
					row_mapa[BuruConstants.row_iva]       = row[13];
					//row_mapa[BuruConstants.row_neto]      = row[14];
					row_mapa[BuruConstants.row_iibb]      = row[15];
					row_mapa[BuruConstants.row_total]     = row[16];
					row_mapa[BuruConstants.row_imei]      = row[17];
				}else if ( params.type_file.equals(BuruConstants.file_bajas)){
					uptype = BuruConstants.uploadtype_baja
					row_mapa[BuruConstants.row_op_code] = row[0];

					/*Fecha en formato MM/dd*/
					def dd = new Date().plus(-31)
					//if(row[16].length()>6)
					//	dd = new SimpleDateFormat("MM/dd/yyyy").parse(row[16])

					row_mapa[BuruConstants.row_date]    =  new SimpleDateFormat("dd/MM/yyyy").format(dd);
					row_mapa[BuruConstants.row_ani]     = row[4];
					row_mapa[BuruConstants.row_buname]  = row[8];
					row_mapa[BuruConstants.row_emp]     = row[8];
					row_mapa[BuruConstants.row_plan]    = row[9];
					row_mapa[BuruConstants.row_importe] = row[17];
					row_mapa[BuruConstants.row_cat_plan]= row[18];
					row_mapa[BuruConstants.row_op_desc] = row[19];
				}else if ( params.type_file.equals(BuruConstants.file_porta)){
					uptype = BuruConstants.uploadtype_porta
					row_mapa[BuruConstants.row_op_code] = row[5];
					row_mapa[BuruConstants.row_date]    = row[11];
					row_mapa[BuruConstants.row_ani]     = row[4];
					row_mapa[BuruConstants.row_estado]  = row[9];
					row_mapa[BuruConstants.row_promo]   = row[12];
				}

				/*Creates the Op if not exists*/
				if (row_mapa[BuruConstants.row_op_code]==null
				|| row_mapa[BuruConstants.row_op_code].length()<1 )
				{
					linea = linea + 1
					if (linea<200)
						transactionInstance.errors.reject(row[0],rownumber+BuruConstants.op_create_error2)
					String sline = String.valueOf(linea);
					reportOfErrors.put(sline, row)
					thereiserror = true
				}
				else if ( Operation.findByCode(row_mapa[BuruConstants.row_op_code])==null) {
					Operation.withNewSession{session->
						try {
							code = new Operation(type:row_mapa[BuruConstants.row_type] ,
							code: row_mapa[BuruConstants.row_op_code],
							active: true,
							description:row_mapa[BuruConstants.row_op_desc]).save(failOnError: true, flush: true)
						} catch (Exception e) {
							linea = linea + 1
							if (linea<200) transactionInstance.errors.reject(row[0],rownumber+BuruConstants.op_create_error)
							String sline = String.valueOf(linea);
							reportOfErrors.put(sline, BuruConstants.op_create_error+row)
							e.printStackTrace();
						}
					}
				}

				/*Finally Search for the employee to match*/
				Employee tmpemployee
				BussinesUnit butmp

				if ( params.type_file.equals(BuruConstants.file_porta)){
					Transaction tmptrx = Transaction.findByAniAndTypeofupload(row_mapa[BuruConstants.row_ani], BuruConstants.uploadtype_alta)
					if (tmptrx)
						tmpemployee = tmptrx.party
				}

				if (empmap.containsKey(row_mapa[BuruConstants.row_emp]))
					tmpemployee = empmap[row_mapa[BuruConstants.row_emp]]

				if ( !tmpemployee && params.type_file.equals(BuruConstants.file_bajas)){
					butmp = BussinesUnit.findByNombre(row_mapa[BuruConstants.row_buname])
					if (butmp){
						Employee.findAllWhere(bu:butmp).each(){ e-> tmpemployee = e }
					}
				}

				if (! tmpemployee ){
					linea = linea + 1
					if (linea<200) transactionInstance.errors.reject(row[0],rownumber+BuruConstants.employee_exist_error)
					String sline = String.valueOf(linea);
					reportOfErrors.put(sline, row)
				}
				else if (!thereiserror){
					Transaction.withNewSession { session->
						try {
							code = new Transaction(
									dateofupload: update,
									typeofupload: uptype,
									party:     tmpemployee.id,
									op:        Operation.findByCode(row_mapa[BuruConstants.row_op_code]).id,
									datet:      Date.parse("dd/MM/yyyy", row_mapa[BuruConstants.row_date]),
									sds:       row_mapa[BuruConstants.row_sds],
									ani:       row_mapa[BuruConstants.row_ani],
									imei:      row_mapa[BuruConstants.row_imei],
									sim:       row_mapa[BuruConstants.row_sim],
									folio:     row_mapa[BuruConstants.row_folio],
									partida:   row_mapa[BuruConstants.row_partida],
									equipo:    row_mapa[BuruConstants.row_equipo],
									//almacen:   BussinesUnit.findByCode(row_mapa[BuruConstants.row_almacen])?.id,
									//cliente:   Client.findByNdoc(row_mapa[BuruConstants.row_cliente_doc]).id,
									cancel:    row_mapa[BuruConstants.row_cancel],
									estado:    row_mapa[BuruConstants.row_estado],
									factura:   row_mapa[BuruConstants.row_factura],
									importe:   row_mapa[BuruConstants.row_importe],
									plan_desc: row_mapa[BuruConstants.row_op_desc],
									debaut:    row_mapa[BuruConstants.row_debaut],
									cat_plan:  row_mapa[BuruConstants.row_cat_plan],
									plan:      row_mapa[BuruConstants.row_plan],
									tipo_factura:    row_mapa[BuruConstants.row_tipo_fact],
									blister:   row_mapa[BuruConstants.row_blister],
									cantidad:  row_mapa[BuruConstants.row_cantidad],
									servicio:  row_mapa[BuruConstants.row_servicio],
									iva:       row_mapa[BuruConstants.row_iva].toDouble(),
									iibb:      row_mapa[BuruConstants.row_iibb].toDouble(),
									total:     row_mapa[BuruConstants.row_total].toDouble(),
									neto:      row_mapa[BuruConstants.row_neto].toDouble(),
									descuento: row_mapa[BuruConstants.row_descuento],
									plan_promo:row_mapa[BuruConstants.row_promo]
									).save(failOnError: true, flush: true)
						}catch (Exception e)
						{
							linea = linea + 1

							if (linea<200)
								transactionInstance.errors.reject(row[0], rownumber+BuruConstants.trx_create_error);

							String sline = String.valueOf(linea);
							reportOfErrors.put(sline, BuruConstants.trx_create_error+row)

							e.printStackTrace();
						}
					}
				}
			}catch (Exception e) {
				linea = linea + 1

				if (linea<200)
					transactionInstance.errors.reject(row[0], rownumber+BuruConstants.trx_create_error);

				String sline = String.valueOf(linea);
				reportOfErrors.put(sline, BuruConstants.trx_create_error+row)

				e.printStackTrace();
			}
		}

		mapreport.put("report", reportOfErrors)

		if (transactionInstance.hasErrors()) {
			respond transactionInstance.errors, view:'upload_result', model:[report:mapreport]
			return
		}

		redirect action:"index"
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'transactionInstance.label', default: 'Transaction'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
