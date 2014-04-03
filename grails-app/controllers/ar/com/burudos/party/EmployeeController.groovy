package ar.com.burudos.party
import grails.converters.JSON
import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.sales.Transaction
import ar.com.burudos.sales.Operation
import ar.com.burudos.sales.Summary
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

	static Boolean linkMe = true
	static String btnName = "employee.btnLabel"
	static String iconName = "employee.iconName"

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
			
		/*query depends on fields to filter*/
		def query = "from Employee e where e.name like '%%" + search + 
		                         "%%' or e.legajo like '%%" + search +
								 "%%' or e.uid like '%%" + search +
								 "%%' or e.bu.nombre like '%%" + search +
								 "%%'"

		/* Use counting to have both values total and counting with only one query */
		Employee.findAll(query,[offset: offset]).each{ trx->
			if ( counting < max) {
				lista.add(trx);
				counting += 1;
			}
			total += 1;
		}
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[employeeInstanceCount: total,
			mapsearch: mapsearch]
		
	}

	def show(Employee employeeInstance) {
		respond employeeInstance
	}

	def ventas(Employee employeeInstance) {
		totalOfTransactions(employeeInstance)
		respond employeeInstance
	}
	
	def buventas(Employee employeeInstance) {
		totalOfSummary(employeeInstance)
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
	def uploadFile(Employee employeeInstance) {
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
						fullname: row[1],
						dofingreso: Date.parse("dd/MM/yyyy",row[2]),
						uid: row[3],
						bu: BussinesUnit.findByCode(row[5]).id,
						isworker: true,
						iscoordinator: false
						).save(failOnError: true, flush: true)
			} catch (Exception e) {
				e.printStackTrace();
				employeeInstance.errors.reject(row[0], row[0]+"\t"+row[1]+"\t"+row[3]+"\t"+row[4]+"\t"+row[5]);
			}
		}
		
		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'upload_result'
			return
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
	
	/**
	 * Obtener las transacciones para las liquidaciones
	 * @return
	 */
	def totalOfTransactions(Employee employeeInstance){
		def lista = [];
		Operation.list().each{ this_op->
			def query = Transaction.where {
				op == this_op 
				party == employeeInstance
			}
			def op_total = query.count();
			def totals = [:];
			totals.put("name", this_op.toString());
			totals.put("y", op_total);
			if (op_total!=0) 
				lista.add(totals);
		}
		render (lista as JSON)
	}
	
	/**
	 * Obtener las transacciones totales para las liquidaciones
	 * @return
	 */
	def totalOfSummary(Employee employeeInstance){
		def lista = [];
		Summary.list().each{ sum->
			def totals = [:];
			if (sum.bu.id == employeeInstance.bu.id)
			{
				totals.put("name", sum.op.toString());
				totals.put("y", sum.quantity);
				if ( sum.quantity && sum.quantity != 0)
					lista.add(totals);
			}
		}	
		render (lista as JSON)
	}
	
}
