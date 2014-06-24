package ar.com.burucps.drools



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RuleSetController {

	static Boolean linkMe = true
	static String  btnName = "ruleSet.btnLabel"
	static String iconName = "ruleSet.iconName"

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

		def query = RuleSet.where{
			(setName ==~  "%${search}%" || setDescription ==~  "%${search}%")
		}

		println "SEARCH " + search

		lista = query.list(params)
		total = query.count()

		mapsearch.put("search", params.search);

		respond RuleSet.list(params), model:[ruleSetInstanceCount: RuleSet.count(), mapsearch: mapsearch]
	}

	def show(RuleSet ruleSetInstance) {
		respond ruleSetInstance
	}

	def create() {
		respond new RuleSet(params)
	}

	@Transactional
	def save(RuleSet ruleSetInstance) {
		if (ruleSetInstance == null) {
			notFound()
			return
		}

		if (ruleSetInstance.hasErrors()) {
			respond ruleSetInstance.errors, view:'create'
			return
		}

		ruleSetInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'ruleSetInstance.label', default: 'RuleSet'),
					ruleSetInstance.id
				])
				redirect ruleSetInstance
			}
			'*' { respond ruleSetInstance, [status: CREATED] }
		}
	}

	def edit(RuleSet ruleSetInstance) {
		respond ruleSetInstance
	}

	@Transactional
	def update(RuleSet ruleSetInstance) {
		if (ruleSetInstance == null) {
			notFound()
			return
		}

		if (ruleSetInstance.hasErrors()) {
			respond ruleSetInstance.errors, view:'edit'
			return
		}

		ruleSetInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'RuleSet.label', default: 'RuleSet'),
					ruleSetInstance.id
				])
				redirect ruleSetInstance
			}
			'*'{ respond ruleSetInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(RuleSet ruleSetInstance) {

		if (ruleSetInstance == null) {
			notFound()
			return
		}

		ruleSetInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'RuleSet.label', default: 'RuleSet'),
					ruleSetInstance.id
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
					message(code: 'ruleSetInstance.label', default: 'RuleSet'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
