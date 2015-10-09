package br.com.lucasaquiles



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParkingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Parking.list(params), model:[parkingInstanceCount: Parking.count()]
    }

    def show(Parking parkingInstance) {
        respond parkingInstance
    }

    def create() {
        respond new Parking(params)
    }

    @Transactional
    def save(Parking parkingInstance) {
        if (parkingInstance == null) {
            notFound()
            return
        }

        if (parkingInstance.hasErrors()) {
            respond parkingInstance.errors, view:'create'
            return
        }

        parkingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'parking.label', default: 'Parking'), parkingInstance.id])
                redirect parkingInstance
            }
            '*' { respond parkingInstance, [status: CREATED] }
        }
    }

    def edit(Parking parkingInstance) {
        respond parkingInstance
    }

    @Transactional
    def update(Parking parkingInstance) {
        if (parkingInstance == null) {
            notFound()
            return
        }

        if (parkingInstance.hasErrors()) {
            respond parkingInstance.errors, view:'edit'
            return
        }

        parkingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Parking.label', default: 'Parking'), parkingInstance.id])
                redirect parkingInstance
            }
            '*'{ respond parkingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Parking parkingInstance) {

        if (parkingInstance == null) {
            notFound()
            return
        }

        parkingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Parking.label', default: 'Parking'), parkingInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'parking.label', default: 'Parking'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
