package ar.com.burudos.sales.statement

import static org.springframework.http.HttpStatus.*
import ar.com.burudos.party.Employee;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StatementLineController {

	static Boolean linkMe = false
	static String btnName = "statementLine.btnLabel"
	static String iconName = "statementLine.iconName"

	static allowedMethods = [save: "POST", update: "PUT"]

	def example() {
	}

	def index(Integer max, Integer offset, String search) {
		/*Initialize counts and params*/
		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];
		if (!search)
			search = "";
		if (!offset)
			offset = 0;
		if (!max)
			max = Math.min(max ?: 10, 100)

		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[statementLineInstanceCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}

	// @Transactional
	def show(StatementLine statementLineInstance) {
		respond statementLineInstance
	}

	def process() {
	}
	
	
	def edit(StatementLine statementLineInstance) {
		respond statementLineInstance
	}

	@Transactional
	def update(StatementLine statementLineInstance) {
		if (statementLineInstance == null) {
			notFound()
			return
		}

		if (statementLineInstance.hasErrors()) {
			respond StatementLineInstance.errors, view:'edit'
			return
		}

		statementLineInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'statementLine.label', default: 'statementLine'),
					statementLineInstance.id
				])
				redirect statementLineInstance
			}
			'*'{ respond statementLineInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(StatementLine statementLineInstance) {

		if (statementLineInstance == null) {
			notFound()
			return
		}

		statementLineInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'statementLine.label', default: 'statementLine'),
					statementLineInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'statementLineInstance.label', default: 'statementLine'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
