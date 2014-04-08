package ar.com.burudos.sales.statement



import static org.springframework.http.HttpStatus.*
import ar.com.burudos.party.Employee;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParameterController {

	static Boolean linkMe = true
	static String btnName = "parameter.btnLabel"
	static String iconName = "parameter.iconName"

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
			max = Math.min(max ?: 10, 100)

		params.max = max

		def query = Parameter.where{
			//paramCategory ==~  "%${search}%" ||
			//paramGroup ==~  "%${search}%" ||
			paramDescription ==~  "%${search}%"
		}

		lista = query.list(params)
		total = query.count()

		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[parameterInstanceCount: total,
			mapsearch: mapsearch]
	}

	def show(Parameter parameterInstance) {
		respond parameterInstance
	}

	def create() {
		respond new Parameter(params)
	}

	@Transactional
	def save(Parameter parameterInstance) {
		if (parameterInstance == null) {
			notFound()
			return
		}

		if (parameterInstance.hasErrors()) {
			respond parameterInstance.errors, view:'create'
			return
		}

		parameterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'parameterInstance.label', default: 'Parameter'),
					parameterInstance.id
				])
				redirect parameterInstance
			}
			'*' { respond parameterInstance, [status: CREATED] }
		}
	}

	def edit(Parameter parameterInstance) {
		respond parameterInstance
	}

	@Transactional
	def update(Parameter parameterInstance) {
		if (parameterInstance == null) {
			notFound()
			return
		}

		if (parameterInstance.hasErrors()) {
			respond parameterInstance.errors, view:'edit'
			return
		}

		parameterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Parameter.label', default: 'Parameter'),
					parameterInstance.id
				])
				redirect parameterInstance
			}
			'*'{ respond parameterInstance, [status: OK] }
		}
	}

	@Transactional
	def deactivate(Parameter parameterInstance) {

		if (parameterInstance == null) {
			notFound()
			return
		}

		parameterInstance.active = false
		parameterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deactivated.message', args: [
					message(code: 'Parameter.label', default: 'Parameter'),
					parameterInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	@Transactional
	def activate(Parameter parameterInstance) {

		if (parameterInstance == null) {
			notFound()
			return
		}

		parameterInstance.active = true
		parameterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.activated.message', args: [
					message(code: 'Parameter.label', default: 'Parameter'),
					parameterInstance.id
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
	def uploadFile(Parameter parameterInstance) {
		def reportOfErrors = [:]
		def mapreport = [:]
		int linea = 0
		def code

		/*File management*/
		//def file = request.getFile(BuruConstants.uploadFileEmployee)
		//def jfile = new java.io.File(BuruConstants.saveFileEmployee)
		//if(file && !file.empty && file.size < BuruConstants.MAX_FILE) {
		//	file.transferTo( jfile )
		//}
		//else{
		//	employeeInstance.errors.reject(BuruConstants.NO_VALID_FILE);
		//	respond employeeInstance.errors, view:'upload_result', model:[report:mapreport]
		//	return
		//}

		//jfile.splitEachLine('\t') { row ->
		//	try {
		//		code = Employee.findByLegajo(row[0]) ?: new Employee(
		//				legajo: row[0],
		//				fullname: row[1],
		//				dofingreso: Date.parse(BuruConstants.dateFormatEmployee,row[2]),
		//				uid: row[3],
		///				bu: BussinesUnit.findByCode(row[5]).id,
		//				isworker: true,
		//				iscoordinator: false
		//				).save(failOnError: true, flush: true)
		//	} catch (Exception e) {

		//		linea = linea + 1;
		//		employeeInstance.errors.reject(row[0], row[0]+"\t"+row[1]+"\t"+row[3]+"\t"+row[4]+"\t"+row[5]);
		//		String sline = String.valueOf(linea);
		//		reportOfErrors.put(sline, row)

		//		e.printStackTrace();
		//	}
		//}

		mapreport.put("report", reportOfErrors)

		if (parameterInstance.hasErrors()) {
			respond parameterInstance.errors, view:'upload_result', model:[report:mapreport]
			return
		}

		redirect action:"index"
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'parameterInstance.label', default: 'Parameter'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
