package ar.com.burudos.sales.statement

import ar.com.burucps.sales.statement.StatementGenerator
import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burucps.sales.statement.StatementLineType;
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import ar.com.burudos.sales.statement.StatementLine

@Transactional(readOnly = true)
class EmployeeStatementController {

	static Boolean linkMe = true
	static String btnName = "statement.btnLabel"
	static String iconName = "statement.iconName"

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
			max = Math.min(max ?: 20, 100)

		params.max = max

		/*Date to get index list*/
		def datemonth
		def dateyear
		if (!params.month_month) {
			String hql = "select month(max(statement_period)) as maxMonth, year(max(statement_period)) as maxYear  from Statement"
			def result = Statement.executeQuery(hql)
			if  (!result.isEmpty() && result[0][0]!=null){
				datemonth = String.valueOf(result[0][0])
				dateyear = String.valueOf(result[0][1])
				params.month_month = String.valueOf(result[0][0])
				params.month_year = dateyear
			}
			else {
				def today= new Date()
				datemonth = String.valueOf(today[Calendar.MONTH])
				dateyear = String.valueOf(today[Calendar.YEAR])
				params.month_month = datemonth
				params.month_year = dateyear
			}
		}else{
			datemonth = params.month_month
			dateyear = params.month_year
		}
		
		def query = EmployeeStatement.where{
			(
					(businessUnit.nombre==~  "%${search}%" ||
					employee.name ==~  "%${search}%" ) && (
					month(statementPeriod) == params.month_month &&
					year(statementPeriod) == params.month_year)
			)
		}

		println "SEARCH " + search
		
		lista = query.list(params)
		total = query.count()

		mapsearch.put("search", params.search);

		respond lista, model:[statementInstanceCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}

	// @Transactional
	def show(EmployeeStatement employeeStatementInstance) {
	/*	StatementLine.withNewSession{session->
			try {
				def code = new StatementLine(statement: employeeStatementInstance, 	type: StatementLineType.RULE,
				paramGroup: StatementLineGroup.POINTS,
				description: "fdls; dfs",
				unitAmount:20,
				unitAmountFixed:34,
				operationsAmount:30,
				operationsAmountFixed:50,
				amount: 10,
				amountFixed: 20,
				lineOrder: 0).save(failOnError: true, flush: true)
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	   */
		respond employeeStatementInstance, view:employeeStatementInstance.statementTemplate.view
	}

	def process() {
	}

	def showStandard_printable(EmployeeStatement employeeStatementInstance) {
		respond employeeStatementInstance
	}
	
	def showPromoter_printable(EmployeeStatement employeeStatementInstance) {
		respond employeeStatementInstance
	}
	
	def showCoordinator_printable(EmployeeStatement employeeStatementInstance) {
		respond employeeStatementInstance
	}
	
	def showSilvero_printable(EmployeeStatement employeeStatementInstance) {
		respond employeeStatementInstance
	}
	
	@Transactional
	def doProcess() {
		StatementGenerator generator = new StatementGenerator();
		generator.generateStatement(Integer.parseInt(params.month_month), Integer.parseInt(params.month_year))

		redirect action:"index"
	}

	@Transactional
	def update(Statement statementInstance) {
		if (statementInstance == null) {
			notFound()
			return
		}

		if (statementInstance.hasErrors()) {
			respond statementInstance.errors, view:'edit'
			return
		}

		statementInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Statement.label', default: 'Statement'),
					statementInstance.id
				])
				redirect statementInstance
			}
			'*'{ respond statementInstance, [status: OK] }
		}
	}
	
	@Transactional
	def delete(Statement statementInstance) {

		if (statementInstance == null) {
			notFound()
			return
		}

		statementInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Statement.label', default: 'Statement'),
					statementInstance.id
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
					message(code: 'statementInstance.label', default: 'Statement'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
