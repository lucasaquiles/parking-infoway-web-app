package br.com.lucasaquiles



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProprietarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Proprietario.list(params), model:[proprietarioInstanceCount: Proprietario.count()]
    }

    def show(Proprietario proprietarioInstance) {
        respond proprietarioInstance
    }

    def create() {
        respond new Proprietario(params)
    }

    @Transactional
    def save(Proprietario proprietarioInstance) {
        if (proprietarioInstance == null) {
            notFound()
            return
        }

        if (proprietarioInstance.hasErrors()) {
            respond proprietarioInstance.errors, view:'create'
            return
        }

        proprietarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), proprietarioInstance.id])
                redirect proprietarioInstance
            }
            '*' { respond proprietarioInstance, [status: CREATED] }
        }
    }

    def edit(Proprietario proprietarioInstance) {
        respond proprietarioInstance
    }

    @Transactional
    def update(Proprietario proprietarioInstance) {
        if (proprietarioInstance == null) {
            notFound()
            return
        }

        if (proprietarioInstance.hasErrors()) {
            respond proprietarioInstance.errors, view:'edit'
            return
        }

        proprietarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Proprietario.label', default: 'Proprietario'), proprietarioInstance.id])
                redirect proprietarioInstance
            }
            '*'{ respond proprietarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Proprietario proprietarioInstance) {

        if (proprietarioInstance == null) {
            notFound()
            return
        }

        proprietarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Proprietario.label', default: 'Proprietario'), proprietarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'proprietario.label', default: 'Proprietario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
