package ar.com.burudos.sales
import java.text.DateFormat;
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
			String hql = "select month(max(date)) as maxMonth, year(max(date)) as maxYear  from Transaction"
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
					month(date) == params.month_month &&
					year(date) == params.month_year)
		}

		lista = query.list(params)
		total = query.count()

		mapsearch.put("search", params.search);

		respond lista, model:[transactionInstanceCount: total,
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
		int linea = 0
		def code
		def Map row_mapa = [:]

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

		jfile.splitEachLine('\t') { row ->
			try {
				row_mapa[BuruConstants.row_type]        = "params.type_file";
				row_mapa[BuruConstants.row_iva]         = 0;
				row_mapa[BuruConstants.row_iibb]        = 0;
				row_mapa[BuruConstants.row_total]       = 0;
				row_mapa[BuruConstants.row_neto]        = 0;
				//print params.type_file.equals(BuruConstants.file_altas)
				if ( params.type_file.equals(BuruConstants.file_altas) ) {
					row_mapa[BuruConstants.row_buname]  = row[1];
					row_mapa[BuruConstants.row_emp]     = row[2];
					row_mapa[BuruConstants.row_date]    = row[3];
					row_mapa[BuruConstants.row_op_code] = row[10];
					row_mapa[BuruConstants.row_plan]    = row[10];
					row_mapa[BuruConstants.row_sds]     = row[4];
					row_mapa[BuruConstants.row_ani]     = row[5];
					row_mapa[BuruConstants.row_cliente] = row[6];
					row_mapa[BuruConstants.row_imei]    = row[7];
					row_mapa[BuruConstants.row_sim]     = row[8];
					row_mapa[BuruConstants.row_cat_plan]= row[9];
					row_mapa[BuruConstants.row_promo]   = row[11];
					row_mapa[BuruConstants.row_equipo]  = row[12];
					row_mapa[BuruConstants.row_almacen] = row[13];
					row_mapa[BuruConstants.row_cliente] = row[14];
					row_mapa[BuruConstants.row_cliente_doc]  = row[15];
					row_mapa[BuruConstants.row_cancel]  = row[16];
					row_mapa[BuruConstants.row_legajo]  = row[17];
					row_mapa[BuruConstants.row_factura] = row[18];
					row_mapa[BuruConstants.row_importe] = row[19];
					row_mapa[BuruConstants.row_op_desc]= row[20];
					row_mapa[BuruConstants.row_debaut]  = row[21];
				}else if ( params.type_file.equals(BuruConstants.file_cater)){
					row_mapa[BuruConstants.row_buname]  = row[2];
					row_mapa[BuruConstants.row_emp]     = row[3];
					row_mapa[BuruConstants.row_date]    = row[4];
					row_mapa[BuruConstants.row_op_code] = row[1];
					row_mapa[BuruConstants.row_sds]     = row[4];
					row_mapa[BuruConstants.row_ani]     = row[5];
					row_mapa[BuruConstants.row_sim]     = row[6];
					row_mapa[BuruConstants.row_imei]    = row[7];
					row_mapa[BuruConstants.row_folio]   = row[8];
					row_mapa[BuruConstants.row_plan]    = row[9];
					row_mapa[BuruConstants.row_factura] = row[10];
					row_mapa[BuruConstants.row_equipo]  = row[11];
					row_mapa[BuruConstants.row_partida] = row[12];
					row_mapa[BuruConstants.row_cancel]  = row[13];
					row_mapa[BuruConstants.row_cliente] = row[14];
					row_mapa[BuruConstants.row_cliente_doc]  = row[15];
				}else if ( params.type_file.equals(BuruConstants.file_post)){
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
					row_mapa[BuruConstants.row_op_code] = row[0];
					row_mapa[BuruConstants.row_date]    = new SimpleDateFormat("dd/MM/yyyy").format(new Date().plus(-31));
					//row_mapa[BuruConstants.row_op_date]    = row[1];
					row_mapa[BuruConstants.row_ani]     = row[4];
					row_mapa[BuruConstants.row_buname]  = row[5];
					row_mapa[BuruConstants.row_emp]     = row[5];
					row_mapa[BuruConstants.row_plan]    = row[14];
					row_mapa[BuruConstants.row_importe] = row[17];
					row_mapa[BuruConstants.row_cat_plan]= row[18];
					row_mapa[BuruConstants.row_op_desc] = row[13];
				}

				/*Creates the Op if not exists*/
				if (Operation.findByCode(row_mapa[BuruConstants.row_op_code])==null) {
					Operation.withNewSession{session->
						try {
							code = new Operation(type:row_mapa[BuruConstants.row_type] ,
							code: row_mapa[BuruConstants.row_op_code],
							active: true,
							description:row_mapa[BuruConstants.row_op_desc]).save(failOnError: true, flush: true)
						} catch (Exception e) {
							linea = linea + 1
							if (linea<200) transactionInstance.errors.reject(row[0],row_mapa[BuruConstants.row_op_code]+BuruConstants.op_create_error)
							String sline = String.valueOf(linea);
							reportOfErrors.put(sline, BuruConstants.op_create_error+row)
							e.printStackTrace();
						}
					}
				}

				/*Creates the Client if not exists*
				 if (row_mapa[BuruConstants.row_cliente_doc]!=null
				 && Client.findByNdoc(row_mapa[BuruConstants.row_cliente_doc])==null) {
				 Client.withNewSession{session->
				 try {
				 code = new Client(cname:row_mapa[BuruConstants.row_cliente],ndoc:row_mapa[BuruConstants.row_cliente_doc]).save(failOnError:true,flush:true)
				 } catch (Exception e) {
				 linea = linea + 1
				 if (linea<200) transactionInstance.errors.reject(row[0],row_mapa[BuruConstants.row_cliente]+BuruConstants.cl_create_error)
				 String sline = String.valueOf(linea);
				 reportOfErrors.put(sline, BuruConstants.cl_create_error+row)
				 e.printStackTrace()
				 return
				 }
				 }
				 }
				 /*Finally Search for the employee to match*/
				Employee tmpemployee
				BussinesUnit butmp

				if ( !row_mapa[BuruConstants.row_buname])
					tmpemployee= Employee.findByName(row_mapa[BuruConstants.row_emp])
				else{
					butmp = BussinesUnit.findByNombre(row_mapa[BuruConstants.row_buname])
					if (butmp)
						tmpemployee= Employee.findByNameAndBu(row_mapa[BuruConstants.row_emp], butmp )
					else
						tmpemployee= Employee.findByName(row_mapa[BuruConstants.row_emp])
				}

				if (! tmpemployee ){
					linea = linea + 1
					if (linea<200) transactionInstance.errors.reject(row[0],row_mapa[BuruConstants.row_emp]+BuruConstants.employee_exist_error)
					String sline = String.valueOf(linea);
					reportOfErrors.put(sline, row)
				}
				else{
					code = new Transaction(
							party:     tmpemployee.id,
							op:        Operation.findByCode(row_mapa[BuruConstants.row_op_code]).id,
							date:      Date.parse("dd/MM/yyyy", row_mapa[BuruConstants.row_date]),
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
				}
			}catch (Exception e) {
				linea = linea + 1

				if (linea<200)
					transactionInstance.errors.reject(row[0], row_mapa[BuruConstants.row_emp]+BuruConstants.trx_create_error);

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
