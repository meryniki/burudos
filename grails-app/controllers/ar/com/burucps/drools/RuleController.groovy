package ar.com.burucps.drools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RuleController {

	static Boolean linkMe = true
	static String  btnName = "rule.btnLabel"
	static String iconName = "rule.iconName"

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
			max = Math.min(max ?: 20, 100)

		params.max = max

		def query = Rule.where{
			ruleName ==~  "%${search}%"
		}

		println "SEARCH " + search

		lista = query.list(params)
		total = query.count()

		mapsearch.put("search", params.search);

		respond Rule.list(params), model:[ruleInstanceCount: Rule.count(), mapsearch: mapsearch]
	}

	def show(Rule ruleInstance) {
		respond ruleInstance
	}

	def create() {
		respond new Rule(params)
	}

	@Transactional
	def save(Rule ruleInstance) {
		if (ruleInstance == null) {
			notFound()
			return
		}

		if (ruleInstance.hasErrors()) {
			respond ruleInstance.errors, view:'create'
			return
		}

		ruleInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'ruleInstance.label', default: 'Rule'),
					ruleInstance.id
				])
				redirect ruleInstance
			}
			'*' { respond ruleInstance, [status: CREATED] }
		}
	}

	def edit(Rule ruleInstance) {
		respond ruleInstance
	}

	@Transactional
	def update(Rule ruleInstance) {
		if (ruleInstance == null) {
			notFound()
			return
		}

		if (ruleInstance.hasErrors()) {
			respond ruleInstance.errors, view:'edit'
			return
		}

		ruleInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Rule.label', default: 'Rule'),
					ruleInstance.id
				])
				redirect ruleInstance
			}
			'*'{ respond ruleInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Rule ruleInstance) {

		if (ruleInstance == null) {
			notFound()
			return
		}

		ruleInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Rule.label', default: 'Rule'),
					ruleInstance.id
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
					message(code: 'ruleInstance.label', default: 'Rule'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
