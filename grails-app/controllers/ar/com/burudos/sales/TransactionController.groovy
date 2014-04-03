package ar.com.burudos.sales

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

	def index() {
		/*Initialize counts and params. The params are Strings*/
		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];
		if (!params.search)
			params.search = "";
		if (!params.offset)
			params.offset = "0";
		if (!params.max)
			params.max = "20";
		int mioffset = Integer.parseInt(params.offset);
		int mimax = Integer.parseInt(params.max);
		
		/*query depends on fields to filter*/
		def query = "from Transaction t where t.op.code like '%%" + params.search + "%%' or t.party.name like '%%" + params.search + "%%'"

		/* Use counting to have both values total and counting with only one query */
		Transaction.findAll(query,[offset: mioffset]).each{ trx->
			if ( counting < mimax) {
				lista.add(trx);
				counting += 1;
			}
			total += 1;
		}
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", params.search);

		respond lista, model:[transactionInstanceCount: total,
			mapsearch: mapsearch]
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
		def code
		def Map row_mapa = [:]

		def file = request.getFile('myFile')
		def jfile = new java.io.File( "tx_${file.name}" )

		if(file && !file.empty && file.size < BuruConstants.MAX_FILE) {
			file.transferTo( jfile )
		}

		jfile.splitEachLine('\t') { row ->
			try {
				//print params.type_file.equals(BuruConstants.file_altas)
				if ( params.type_file.equals(BuruConstants.file_altas) ) {
					row_mapa[BuruConstants.row_emp]     = row[2];
					row_mapa[BuruConstants.row_date]    = row[3];
					row_mapa[BuruConstants.row_op_code] = row[10];
					row_mapa[BuruConstants.row_plan]    = "";
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
					row_mapa[BuruConstants.row_plan_dec]= row[20];
					row_mapa[BuruConstants.row_debaut]  = row[21];
				}else if ( params.type_file.equals(BuruConstants.file_cater)){
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
					row_mapa[BuruConstants.row_emp]       = row[2];
					row_mapa[BuruConstants.row_date]      = row[3];
					row_mapa[BuruConstants.row_op_code]   = row[0]+row[7];
					row_mapa[BuruConstants.row_ani]       = row[5];
					row_mapa[BuruConstants.row_solicitud] = row[6];
					row_mapa[BuruConstants.row_plan]      = row[7];
					row_mapa[BuruConstants.row_plan_h]    = row[8];
					row_mapa[BuruConstants.row_plan_d]    = row[9];
				}

				/*Creates the Op if not exists*/
				if (Operation.findByCode(row_mapa[BuruConstants.row_op_code])==null) {
					Operation.withNewSession{session->
						try {
							code = new Operation(code:row_mapa[BuruConstants.row_op_code],
							cat_plan:row_mapa[BuruConstants.row_cat_plan],
							plan_promo:row_mapa[BuruConstants.row_promo]).save(failOnError: true, flush: true)
							//op_desde:Operation.findByCode(row_mapa[BuruConstants.row_plan_d])?.id,
							//op_hasta:Operation.findByCode(row_mapa[BuruConstants.row_plan_h])?.id).save(failOnError: true, flush: true)
						} catch (Exception e) {
							transactionInstance.errors.reject(row[9],row_mapa[BuruConstants.row_op_code]+BuruConstants.op_create_error)
							e.printStackTrace()
							return
						}
					}
				}
				/*Creates the Client if not exists*/
				if (row_mapa[BuruConstants.row_cliente_doc]!=null
				&& Client.findByNdoc(row_mapa[BuruConstants.row_cliente_doc])==null) {
					Client.withNewSession{session->
						try {
							code = new Client(cname:row_mapa[BuruConstants.row_cliente],ndoc:row_mapa[BuruConstants.row_cliente_doc]).save(failOnError:true,flush:true)
						} catch (Exception e) {
							transactionInstance.errors.reject(row[0],row_mapa[BuruConstants.row_cliente]+BuruConstants.cl_create_error)
							e.printStackTrace()
							return
						}
					}
				}

				if (Employee.findByName(row_mapa[BuruConstants.row_emp])==null) {
					transactionInstance.errors.reject(row[0],row_mapa[BuruConstants.row_emp]+BuruConstants.employee_exist_error)
				}
				else{
					code = new Transaction(
							party: Employee.findByName(row_mapa[BuruConstants.row_emp]).id,
							op:    Operation.findByCode(row_mapa[BuruConstants.row_op_code]).id,
							date:  Date.parse("dd/MM/yyyy", row_mapa[BuruConstants.row_date]),
							sds:   row_mapa[BuruConstants.row_sds],
							ani:   row_mapa[BuruConstants.row_ani],
							imei:  row_mapa[BuruConstants.row_imei],
							sim:   row_mapa[BuruConstants.row_sim],
							folio: row_mapa[BuruConstants.row_folio],
							partida:   row_mapa[BuruConstants.row_partida],
							equipo:    row_mapa[BuruConstants.row_equipo],
							//almacen:   BussinesUnit.findByCode(row_mapa[BuruConstants.row_almacen])?.id,
							//cliente:   Client.findByNdoc(row_mapa[BuruConstants.row_cliente_doc]).id,
							cancel:    row_mapa[BuruConstants.row_cancel],
							estado:    row_mapa[BuruConstants.row_estado],
							factura:   row_mapa[BuruConstants.row_factura],
							importe:   row_mapa[BuruConstants.row_importe],
							plan_desc: row_mapa[BuruConstants.row_plan_dec],
							debaut:    row_mapa[BuruConstants.row_debaut]
							).save(failOnError: true, flush: true)
				}
			}catch (Exception e) {
				e.printStackTrace();
				transactionInstance.errors.reject(row[0], row_mapa[BuruConstants.row_emp]+BuruConstants.trx_create_error);
			}
		}

		if (transactionInstance.hasErrors()) {
			respond transactionInstance.errors, view:'upload_result'
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
