package ar.com.burudos.sales



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OperationController {

	static Boolean linkMe = true
	static String btnName = "operation.btnLabel"
	static String iconName = "operation.iconName"

	static allowedMethods = [save: "POST", update: "PUT"]

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
			max = 20;
		
		params.max = max;		
		
		def query = Operation.where{
			code ==~  "%${search}%" ||
			cat_plan ==~  "%${search}%" ||
			plan_promo ==~  "%${search}%" 
		}
		
		lista = query.list(params)
		total = query.count()
		
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[operationInstanceCount: total,
			mapsearch: mapsearch]
		
	}

	def show(Operation operationInstance) {
		respond operationInstance
	}

	def create() {
		respond new Operation(params)
	}

	@Transactional
	def save(Operation operationInstance) {
		if (operationInstance == null) {
			notFound()
			return
		}

		if (operationInstance.hasErrors()) {
			respond operationInstance.errors, view:'create'
			return
		}

		operationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'operationInstance.label', default: 'Operation'),
					operationInstance.id
				])
				redirect operationInstance
			}
			'*' { respond operationInstance, [status: CREATED] }
		}
	}

	def edit(Operation operationInstance) {
		respond operationInstance
	}

	@Transactional
	def update(Operation operationInstance) {
		if (operationInstance == null) {
			notFound()
			return
		}

		if (operationInstance.hasErrors()) {
			respond operationInstance.errors, view:'edit'
			return
		}

		operationInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Operation.label', default: 'Operation'),
					operationInstance.id
				])
				redirect operationInstance
			}
			'*'{ respond operationInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Operation operationInstance) {

		if (operationInstance == null) {
			notFound()
			return
		}

		operationInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Operation.label', default: 'Operation'),
					operationInstance.id
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
		def jfile = new java.io.File( "/home/meri/Desktop/op_${file.name}" )

		if(file && !file.empty && file.size < 1024) {
			file.transferTo( jfile )
		}

		def code
		jfile.splitEachLine('\t') { row ->
			code = Operation.findByCode(row[0]) ?: new Operation(
					code: row[0],
					meaning: row[1],
					description: row[2],
					).save(failOnError: true, flush: true)
		}

		redirect action:"index"
	}


	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'operationInstance.label', default: 'Operation'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
