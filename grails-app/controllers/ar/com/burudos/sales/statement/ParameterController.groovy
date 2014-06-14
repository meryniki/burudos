package ar.com.burudos.sales.statement

import static org.springframework.http.HttpStatus.*
import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.constants.BuruConstants;
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
			max = Math.min(max ?: 20, 100)

		params.max = max

		def query = Parameter.where{
		    paramGroup ==~  "%${search}%" ||
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
			'*' {
				respond parameterInstance, [status: CREATED]
			}
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
			'*'{
				respond parameterInstance, [status: OK]
			}
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
		parameterInstance.clearErrors()

		/*File management*/
		def file = request.getFile(BuruConstants.uploadFileParameter)
		def jfile = new java.io.File(BuruConstants.saveFileParameter)
		if(file && !file.empty && file.size < BuruConstants.MAX_FILE) {
			file.transferTo( jfile )
		}
		else{
			parameterInstance.errors.reject(BuruConstants.NO_VALID_FILE);
			respond parameterInstance.errors, view:'upload_result', model:[report:mapreport]
			return
		}

		jfile.splitEachLine('\t') { row ->
			try {
				def bu = BussinesUnit.findByNombre(row[7])
				code = Parameter.findByParamCodeAndBussinesUnit(row[0],bu) ?: new Parameter(
						paramCode: row[0],
						paramCategory: getCategory(row[1]),
						paramGroup: row[2],
						paramDescription: row[3],
						maxValue: row[6],
						minValue: row[5],
						value: row[4],
						bussinesUnit:bu,
						active: true
						).save(failOnError: true, flush: true)
			} catch (Exception e) {

				linea = linea + 1;
				parameterInstance.errors.reject('parameter.upload.row.fail', [
					row[0],
					row[1],
					row[2],
					row[3],
					row[4],
					row[5],
					row[6],
					row[7]] as Object[],'Upload failed: [{0},{1},{2},{3},{4},{5},{6},{7}]');
				String sline = String.valueOf(linea);
				reportOfErrors.put(sline, row)

				e.printStackTrace();
			}
		}

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

	private StatementLineGroup getCategory (String groupName) {
		switch (groupName) {
			case "VENTAS":
				return StatementLineGroup.SALES;
			case "PUNTOS":
				return StatementLineGroup.POINTS;
			case "INCENTIVO IND":
				return StatementLineGroup.INDIVIDUAL_INCENTIVE;
			case "INCENTIVO PTO VTA":
				return StatementLineGroup.POS_INCENTIVE;
			case "DEDUCCIONES":
				return StatementLineGroup.DEDUCTIONS;
			default:
				return StatementLineGroup.OTHERS;
		}
	}
}
