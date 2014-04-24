package ar.com.burudos.business

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import ar.com.burudos.constants.BuruConstants

@Transactional(readOnly = true)
class BussinesUnitController {

	static Boolean linkMe = true
	static String  btnName = "bussinesUnit.btnLabel"
	static String iconName = "bussinesUnit.iconName"

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

		def query = BussinesUnit.where{
			nombre ==~  "%${search}%" ||
			code ==~  "%${search}%" ||
			father.nombre ==~  "%${search}%" ||
			father.code ==~  "%${search}%" ||
			departamento ==~  "%${search}%" ||
			provincia ==~  "%${search}%" ||
			calle ==~  "%${search}%"
		}
		
		lista = query.list(params)
		total = query.count()
		
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[bussinesUnitInstanceCount: total,
			mapsearch: mapsearch]
	}
	
	def show(BussinesUnit bussinesUnitInstance) {
		respond bussinesUnitInstance
	}

	def create() {
		respond new BussinesUnit(params)
	}

	@Transactional
	def save(BussinesUnit bussinesUnitInstance) {
		if (bussinesUnitInstance == null) {
			notFound()
			return
		}

		if (bussinesUnitInstance.hasErrors()) {
			respond bussinesUnitInstance.errors, view:'create'
			return
		}

		bussinesUnitInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'bussinesUnitInstance.label', default: 'BussinesUnit'),
					bussinesUnitInstance.id
				])
				redirect bussinesUnitInstance
			}
			'*' { respond bussinesUnitInstance, [status: CREATED] }
		}
	}

	def edit(BussinesUnit bussinesUnitInstance) {
		respond bussinesUnitInstance
	}

	def upload = {
		// do something with the file
	}

	@Transactional
	def uploadFile(BussinesUnit bussinesUnitInstance) {
		
		/*File management*/
		def file = request.getFile(BuruConstants.uploadFileEmployee)
		def jfile = new java.io.File(BuruConstants.saveFileEmployee)
		if(file && !file.empty && file.size < BuruConstants.MAX_FILE) {
			file.transferTo( jfile )
		}
		else{
			bussinesUnitInstance.errors.reject(BuruConstants.NO_VALID_FILE);
			respond bussinesUnitInstance.errors, view:'upload_result', model:[report:mapreport]
			return
		}

		
		def code
		jfile.splitEachLine('\t') { row ->
			try{
				code = BussinesUnit.findByCode(row[0]) ?: new BussinesUnit(
						code: row[0],
						father: BussinesUnit.findByCode(row[1]).id,
						provincia: row[2],
						departamento: row[3],
						localidad: row[4],
						calle: row[5],
						altura: row[6],
						nombre: row[7],
						).save(failOnError: true, flush: true)
			}catch (Exception e) {
				e.printStackTrace();
				bussinesUnitInstance.errors.reject(row[0], row[0]+"\t"+row[1]+"\t"+row[2]+"\t"+row[3]);
			}
		}

		if (bussinesUnitInstance.hasErrors()) {
			respond bussinesUnitInstance.errors, view:'upload_result'
			return
		}
		
		redirect action:"index"
	}

	@Transactional
	def update(BussinesUnit bussinesUnitInstance) {
		if (bussinesUnitInstance == null) {
			notFound()
			return
		}

		if (bussinesUnitInstance.hasErrors()) {
			respond bussinesUnitInstance.errors, view:'edit'
			return
		}

		bussinesUnitInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'BussinesUnit.label', default: 'BussinesUnit'),
					bussinesUnitInstance.id
				])
				redirect bussinesUnitInstance
			}
			'*'{ respond bussinesUnitInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(BussinesUnit bussinesUnitInstance) {

		if (bussinesUnitInstance == null) {
			notFound()
			return
		}

		bussinesUnitInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'BussinesUnit.label', default: 'BussinesUnit'),
					bussinesUnitInstance.id
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
					message(code: 'bussinesUnitInstance.label', default: 'BussinesUnit'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
