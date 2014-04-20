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
			if (!result.isEmpty() && result[0][0]!=null){
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
			(bu.nombre ==~  "%${search}%" ) && (
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
		def bu_to_summarize = BussinesUnit.findById(params.bu)?.getSons()

		Filter.findAllByBuInListAndMonth(bu_to_summarize,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year)).each() { filter->
			
			bu_to_summarize.each(){ butmp->
				counting = 0
				employes = 0
				def where_filter = ""
				
				if (filter.op)
				    where_filter += " and  t.op.id = " + filter.op.id
				if (filter.ani)
					where_filter += " and t.ani = '" + filter.ani  + "'"
				if (filter.sds)
					where_filter += " and t.sds = '" + filter.sds + "'"
				if (filter.imei)
					where_filter += " and t.imei = '" + filter.imei  + "'"
				if (filter.sim)
					where_filter += " and t.sim = '" + filter.sim  + "'"
				if (filter.folio)
					where_filter += " and t.folio = '" + filter.folio  + "'"
				if (filter.partida)
					where_filter += " and t.partida = '" + filter.partida  + "'"
				if (filter.equipo)
					where_filter += " and t.equipo = '" + filter.equipo  + "'"
				if (filter.solicitud)
					where_filter += " and t.solicitud = '" + filter.solicitud  + "'"
				if (filter.cancel)
					where_filter += " and t.cancel = '" + filter.cancel  + "'"
				if (filter.estado)
					where_filter += " and t.estado = '" + filter.estado  + "'"
				if (filter.factura)
					where_filter += " and t.factura = '" + filter.factura  + "'"
				if (filter.importe)
					where_filter += " and t.importe = '" + filter.importe + "'"
				if (filter.cat_plan)
					where_filter += " and t.cat_plan = '" + filter.cat_plan  + "'"
				if (filter.plan_promo)
					where_filter += " and t.plan_promo = '" + filter.plan_promo + "'"
					
				Employee.findAllWhere(bu:butmp).each(){	mparty ->
					def query = "from Transaction t where t.party.id = " + mparty.id  +
							where_filter +
							" and month(t.date) = " + params.month_month +
							" and year(t.date) = " + params.month_year
					Transaction.findAll(query).each() { trx->
						counting += 1;
						employes += 1
					}
				}

				if ( employes>0 )
					code = new Summary(
							filter: filter,
							bu: butmp,
							month: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
							quantity: counting
							).save(failOnError: true, flush: true)
			}
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
