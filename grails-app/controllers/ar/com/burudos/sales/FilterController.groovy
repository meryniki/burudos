package ar.com.burudos.sales



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FilterController {
	static Boolean linkMe = true
	static String btnName = "filter.btnLabel"
	static String iconName = "filter.iconName"
	
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
		
		print params
		
		if ((!params.month_month) || params.month_month==0) {
			String hql = "select month(max(validMonth)) as maxMonth, year(max(validMonth)) as maxYear  from Filter"
			def result = Summary.executeQuery(hql)
			if (!result.isEmpty() && result[0][0]!=null && result[0][0]!=0){
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
	

		def query = Filter.where{
			(filterCode ==~  "%${search}%" ||
					description ==~  "%${search}%" ) && (
					month(validMonth) == params.month_month &&
					year(validMonth) == params.month_year)
		}

		lista = query.list(params)
		total = query.count()

		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[summaryInstanceCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}

	def show(Filter filterInstance) {
		respond filterInstance
	}

	def create() {
		respond new Filter(params)
	}

	@Transactional
	def save(Filter filterInstance) {
		if (filterInstance == null) {
			notFound()
			return
		}

		if (filterInstance.hasErrors()) {
			respond filterInstance.errors, view:'create'
			return
		}

		filterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'filterInstance.label', default: 'Filter'),
					filterInstance.id
				])
				redirect filterInstance
			}
			'*' { respond filterInstance, [status: CREATED] }
		}
	}

	def edit(Filter filterInstance) {
		respond filterInstance
	}

	@Transactional
	def update(Filter filterInstance) {
		if (filterInstance == null) {
			notFound()
			return
		}

		if (filterInstance.hasErrors()) {
			respond filterInstance.errors, view:'edit'
			return
		}

		filterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Filter.label', default: 'Filter'),
					filterInstance.id
				])
				redirect filterInstance
			}
			'*'{ respond filterInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Filter filterInstance) {

		if (filterInstance == null) {
			notFound()
			return
		}

		filterInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Filter.label', default: 'Filter'),
					filterInstance.id
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
					message(code: 'filterInstance.label', default: 'Filter'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
