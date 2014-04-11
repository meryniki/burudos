package ar.com.burudos.sales

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.party.Employee
import static java.util.Calendar.MONTH

@Transactional(readOnly = true)
class SummaryController {

	static Boolean linkMe = true
	static String btnName = "summary.btnLabel"
	static String iconName = "summary.iconName"

	static allowedMethods = [save: "POST", update: "PUT"]

	def index(Integer max, Integer offset, String search) {
		/*Initialize counts and params*/
		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];

		/*Initialization*/
		if (!search)
			search = "";
		if (!offset)
			offset = 0;
		if (!max)
			max = 20;
		params.max = max;

		/*Date to get index list*/
		def datemonth
		def dateyear
		if (!params.month_month) {
			String hql = "select month(max(month)) as maxMonth, year(max(month)) as maxYear  from Summary"
			def result = Summary.executeQuery(hql)
			if (!result.isEmpty()){
				datemonth = String.valueOf(result[0][0])
				dateyear = String.valueOf(result[0][1])
				params.month_month = String.valueOf(result[0][0])
				params.month_year = dateyear
			}else {
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

		def query = Summary.where{
			(bu.nombre ==~  "%${search}%" ||
					op.cat_plan ==~  "%${search}%" ||
					op.plan_promo ==~  "%${search}%" ||
					op.code ==~  "%${search}%") && (
					month(month) == params.month_month &&
					year(month) == params.month_year)
		}

		lista = query.list(params)
		total = query.count()

		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[summaryInstanceCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}

	def show(Summary summaryInstance) {
		respond summaryInstance
	}

	def create() {
		respond new Summary(params)
	}

	@Transactional
	def save(Summary summaryInstance) {
		if (summaryInstance == null) {
			notFound()
			return
		}

		if (summaryInstance.hasErrors()) {
			respond summaryInstance.errors, view:'create'
			return
		}

		summaryInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'summaryInstance.label', default: 'Summary'),
					summaryInstance.id
				])
				redirect summaryInstance
			}
			'*' { respond summaryInstance, [status: CREATED] }
		}
	}

	def edit(Summary summaryInstance) {
		respond summaryInstance
	}

	@Transactional
	def update(Summary summaryInstance) {
		if (summaryInstance == null) {
			notFound()
			return
		}

		if (summaryInstance.hasErrors()) {
			respond summaryInstance.errors, view:'edit'
			return
		}

		summaryInstance.create

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Summary.label', default: 'Summary'),
					summaryInstance.id
				])
				redirect summaryInstance
			}
			'*'{ respond summaryInstance, [status: OK] }
		}
	}

	def domonthly = {
	}

	@Transactional
	def createMonthly() {
		def code
		int counting = 0
		int employes = 0

		Operation.getAll().each() { op->

			def bu_to_summarize = BussinesUnit.findAllByFather(BussinesUnit.findById(params.bu))

			//ITERO BUSCANDO LOS HIJOS
			def otherlist = []
			bu_to_summarize.each(){ butmp->
				def more_bus = BussinesUnit.findAllByFather(butmp)
				if (!more_bus.isEmpty()) more_bus.each(){ newbu ->
					otherlist.add(newbu)
				}
			}
			otherlist.each() { other->
				bu_to_summarize.add(other)
			}
			//ITERO BUSCANDO LOS HIJOS
			def aotherlist = []
			bu_to_summarize.each(){ butmp->
				def more_bus = BussinesUnit.findAllByFather(butmp)
				if (!more_bus.isEmpty()) more_bus.each(){ newbu ->
					aotherlist.add(newbu)
				}
			}
			aotherlist.each() { other->
				bu_to_summarize.add(other)
			}

			bu_to_summarize.each(){ butmp->
				counting = 0
				employes = 0
				Employee.findAllWhere(bu:butmp).each(){	mparty ->
					def query = "from Transaction t where t.party.id = " + mparty.id  +
							" and t.op.id = " + op.id  +
							" and month(t.date) = " + params.month_month +
							" and year(t.date) = " + params.month_year
					Transaction.findAll(query).each() { trx->
						counting += 1;
						employes += 1
					}
				}

				if ( employes>0 )
					code = new Summary(
							op: op,
							bu: butmp,
							month: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
							quantity: counting
							).save(failOnError: true, flush: true)
			}
			/*El que se busco*/
			counting = 0
			employes = 0
			Employee.findAllWhere(bu:BussinesUnit.findById(params.bu)).each(){	mparty ->
				def query = "from Transaction t where t.party.id = " + mparty.id  +
						" and t.op.id = " + op.id  +
						" and month(t.date) = " + params.month_month +
						" and year(t.date) = " + params.month_year
				Transaction.findAll(query).each() { trx->
					counting += 1;
					employes += 1
				}
			}

			if ( employes>0 )
				code = new Summary(
						op: op,
						bu: BussinesUnit.findById(params.bu),
						month: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
						quantity: counting
						).save(failOnError: true, flush: true)
		}

		redirect action:"index"
	}


	@Transactional
	def delete(Summary summaryInstance) {

		if (summaryInstance == null) {
			notFound()
			return
		}

		summaryInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Summary.label', default: 'Summary'),
					summaryInstance.id
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
					message(code: 'summaryInstance.label', default: 'Summary'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
