package grails_estia_22_23

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import org.springframework.web.multipart.MultipartFile


@Secured(['ROLE_ADMIN', 'ROLE_MODERATOR'])
class AnnonceController {

    AnnonceService annonceService
    SpringSecurityService springSecurityService
    MyService myService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        // On défini une variable qui contiendra notre liste d'annonces
        def annonceList = myService.getUserSpecificAnnonces(((User)springSecurityService.getCurrentUser()), params)
        render(view: '/annonce/index', model: [annonceList: annonceList, annonceCount: annonceList.size()])
    }
    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def show(Long id) {
        respond annonceService.get(id)
    }
    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def create() {
        render(view: '/annonce/create', model:[annonce: new Annonce(params), usernameList: User.list()])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }
        def illustrationInstance = new Illustration(params)
        MultipartFile file = request.getFile('image')
        def name = file.getOriginalFilename()
        String imageUploadPath = grailsApplication.config.illustrations.basePath
        try {
            if (file && !file.empty) {
                file.transferTo(new File("${imageUploadPath}/${name}"))
                illustrationInstance.filename="${name}"
                illustrationInstance.save flush:true
                annonce.addToIllustrations(new Illustration(filename: illustrationInstance.filename))
                flash.message = "your.sucessful.file.upload.message"
            }
            else {
                flash.message = "your.unsucessful.file.upload.message"
            }
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view: 'create'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }



    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def edit(Long id) {
        respond annonceService.get(id)
    }
    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def update() {
        def annonce = Annonce.get(params.id)
        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Float.parseFloat(params.price)
        annonce.author = User.get(params.author.id)
        if (annonce == null) {
            notFound()
            return
        }
        def illustrationInstance = new Illustration(params)
        MultipartFile file = request.getFile('image')
        def name = file.getOriginalFilename()
        String imageUploadPath = grailsApplication.config.illustrations.basePath
        try {
            if (file && !file.empty) {
                file.transferTo(new File("${imageUploadPath}/${name}"))
                illustrationInstance.filename="${name}"
                illustrationInstance.save flush:true
                annonce.addToIllustrations(new Illustration(filename: illustrationInstance.filename))
                flash.message = "your.sucessful.file.upload.message"
            }
            else {
                flash.message = "your.unsucessful.file.upload.message"
            }
            annonceService.save(annonce)
        } catch (ValidationException e) {
            println annonce.errors
            redirect view: 'edit',  id: annonce.id
            return
        }
        flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])

        redirect view: 'edit',  id: annonce.id
        return
    }
    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)
        request.
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }
    @Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
