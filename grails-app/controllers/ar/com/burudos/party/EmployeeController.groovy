package ar.com.burudos.party
import ar.com.burudos.business.BussinesUnit
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

	static Boolean linkMe = true
	static String btnName = "employee.btnLabel"

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
		params.max = Math.min(max ?: 20, 100)
		respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
	}

	def show(Employee employeeInstance) {
		respond employeeInstance
	}

	def create() {
		respond new Employee(params)
	}

	@Transactional
	def save(Employee employeeInstance) {
		if (employeeInstance == null) {
			notFound()
			return
		}

		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'create'
			return
		}

		employeeInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'employeeInstance.label', default: 'Employee'),
					employeeInstance.id
				])
				redirect employeeInstance
			}
			'*' { respond employeeInstance, [status: CREATED] }
		}
	}

	def edit(Employee employeeInstance) {
		respond employeeInstance
	}

	def upload = {
		// do something with the file
	}

	@Transactional
	def uploadFile() {
		def file = request.getFile('myFile')
		def jfile = new java.io.File( "carga_${file.name}" )

		if(file && !file.empty && file.size < 10240) {
			file.transferTo( jfile )
		}

		def code
	
		jfile.splitEachLine('\t') { row ->
			try {
				code = Employee.findByLegajo(row[0]) ?: new Employee(
						legajo: row[0],
						names: row[1],
						dofingreso: Date.parse("dd/MM/yyyy","01/01/2001"),//row[2]),
						uid: row[3],
						bu: BussinesUnit.findByCode(row[5]).id,
						isworker: true,
						iscoordinator: false
						).save(failOnError: true, flush: true)
			} catch (Exception e) {
				e.printStackTrace()
				print row[2]
				print row[3]
				print row[4]
				print row[5]
			}
			
		}

		redirect action:"index"
	}


	@Transactional
	def update(Employee employeeInstance) {
		if (employeeInstance == null) {
			notFound()
			return
		}

		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'edit'
			return
		}

		employeeInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Employee.label', default: 'Employee'),
					employeeInstance.id
				])
				redirect employeeInstance
			}
			'*'{ respond employeeInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Employee employeeInstance) {

		if (employeeInstance == null) {
			notFound()
			return
		}

		employeeInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Employee.label', default: 'Employee'),
					employeeInstance.id
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
					message(code: 'employeeInstance.label', default: 'Employee'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
