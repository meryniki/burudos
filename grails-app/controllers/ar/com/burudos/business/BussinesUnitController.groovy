package ar.com.burudos.business



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BussinesUnitController {
	
	static Boolean linkMe = true
	static String btnName = "businessUnit.btnLabel"

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond BussinesUnit.list(params), model:[bussinesUnitInstanceCount: BussinesUnit.count()]
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'bussinesUnitInstance.label', default: 'BussinesUnit'), bussinesUnitInstance.id])
                redirect bussinesUnitInstance
            }
            '*' { respond bussinesUnitInstance, [status: CREATED] }
        }
    }

    def edit(BussinesUnit bussinesUnitInstance) {
        respond bussinesUnitInstance
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'BussinesUnit.label', default: 'BussinesUnit'), bussinesUnitInstance.id])
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'BussinesUnit.label', default: 'BussinesUnit'), bussinesUnitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bussinesUnitInstance.label', default: 'BussinesUnit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
