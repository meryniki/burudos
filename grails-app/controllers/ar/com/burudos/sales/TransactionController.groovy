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
		params.max = Math.min(max ?: 10, 100)
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
	def uploadFile() {
		def file = request.getFile('myFile')
		def jfile = new java.io.File( "/home/meri/Desktop/tx_${file.name}" )

		if(file && !file.empty && file.size < 1024) {
			file.transferTo( jfile )
		}

		def code
		jfile.splitEachLine('\t') { row ->
			code = new Transaction(
					party: Employee.findByEmployeenro(row[0]).id,
					op: Operation.findByCode(row[1]).id,
					month: row[2],
					quantity: row[3],
					).save(failOnError: true, flush: true)
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
