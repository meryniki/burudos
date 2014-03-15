package ar.com.burudos.sales

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import ar.com.burudos.party.Employee
import ar.com.burudos.sales.Operation

@Transactional(readOnly = true)
class TransactionController {

	static Boolean linkMe = true
	static String btnName = "transaction.btnLabel"

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 20, 100)
		respond Transaction.list(params), model:[transactionInstanceCount: Transaction.count()]
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
		def file = request.getFile('myFile')
		def jfile = new java.io.File( "tx_${file.name}" )

		if(file && !file.empty && file.size < 102400) {
			file.transferTo( jfile )
		}

		def code
		String altas = "altas.txt";
		String cater = "cater.txt";

		String row_emp;
		String row_op_code;
		String row_date;


		jfile.splitEachLine('\t') { row ->
			try {
				//if ( file.name.equals(altas) ) {
				row_emp = row[2];
				row_date = row[3];
				row_op_code = row[10];
				//}else if ( file.name.equals(cater)){
				//	row_emp = row[3];
				//	row_date = row[4];
				//	row_op_code = row[1];
				//}
				if (Operation.findByCode(row_op_code)==null) {
					Operation.withNewSession{session->
						try {
							code = new Operation(code:row_op_code).save(failOnError: true, flush: true)
						} catch (Exception e) {
							print "error al guardar operacion"
							e.printStackTrace()
							return
						}
					}
				}
				if (Employee.findByName(row_emp)==null) {
					transactionInstance.errors.reject(row[0],row_emp+" No existe empleado")
				}
				else{
				code = new Transaction(
						party: Employee.findByName(row_emp).id,
						op: Operation.findByCode(row_op_code).id,
						date: Date.parse("dd/MM/yyyy", row_date)
						).save(failOnError: true, flush: true)
				}
			}catch (Exception e) {
				e.printStackTrace();
				transactionInstance.errors.reject(row[0], row[0]+"\t"+row[1]+"\t"+row[3]+"\t"+row[4]+"\t"+row[5]);
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
