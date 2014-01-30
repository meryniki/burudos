package ar.com.burudos.business



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CoordinationEmployeeUnitController {
	
	static Boolean linkMe = true
	static String btnName = "coordination.btnLabel"

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CoordinationEmployeeUnit.list(params), model:[coordinationEmployeeUnitInstanceCount: CoordinationEmployeeUnit.count()]
    }

    def show(CoordinationEmployeeUnit coordinationEmployeeUnitInstance) {
        respond coordinationEmployeeUnitInstance
    }

    def create() {
        respond new CoordinationEmployeeUnit(params)
    }

    @Transactional
    def save(CoordinationEmployeeUnit coordinationEmployeeUnitInstance) {
        if (coordinationEmployeeUnitInstance == null) {
            notFound()
            return
        }

        if (coordinationEmployeeUnitInstance.hasErrors()) {
            respond coordinationEmployeeUnitInstance.errors, view:'create'
            return
        }

        coordinationEmployeeUnitInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'coordinationEmployeeUnitInstance.label', default: 'CoordinationEmployeeUnit'), coordinationEmployeeUnitInstance.id])
                redirect (action: index(1))
            }
            '*' { respond coordinationEmployeeUnitInstance, [status: CREATED] }
        }
    }

    def edit(CoordinationEmployeeUnit coordinationEmployeeUnitInstance) {
        respond coordinationEmployeeUnitInstance
    }

    @Transactional
    def update(CoordinationEmployeeUnit coordinationEmployeeUnitInstance) {
        if (coordinationEmployeeUnitInstance == null) {
            notFound()
            return
        }

        if (coordinationEmployeeUnitInstance.hasErrors()) {
            respond coordinationEmployeeUnitInstance.errors, view:'edit'
            return
        }

        coordinationEmployeeUnitInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CoordinationEmployeeUnit.label', default: 'CoordinationEmployeeUnit'), coordinationEmployeeUnitInstance.id])
                redirect coordinationEmployeeUnitInstance
            }
            '*'{ respond coordinationEmployeeUnitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CoordinationEmployeeUnit coordinationEmployeeUnitInstance) {

        if (coordinationEmployeeUnitInstance == null) {
            notFound()
            return
        }

        coordinationEmployeeUnitInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CoordinationEmployeeUnit.label', default: 'CoordinationEmployeeUnit'), coordinationEmployeeUnitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'coordinationEmployeeUnitInstance.label', default: 'CoordinationEmployeeUnit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
