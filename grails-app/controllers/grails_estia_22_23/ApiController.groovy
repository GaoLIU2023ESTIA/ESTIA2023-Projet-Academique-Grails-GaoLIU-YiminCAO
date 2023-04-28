package grails_estia_22_23

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN', 'ROLE_CLIENT', 'ROLE_MODERATOR'])
class ApiController {

    /**
     * GET / PUT / PATCH / DELETE
     * GET : Récupère un utilisateur spécifique (id)
     * PUT / PATCH : Modifient intégralement / partiellement un utilisateur
     * DELETE : Supprime un utilisateurppp
     */
    def user() {
        // Je teste si le parametre ID est bien défini
        if (!params.id)
            return response.status = 400
        // Je récupère l'instance d'utilisateur associé à cet ID
        def userInstance = User.get(params.id)
        // Je teste si l'utilisateur existe
        if (!userInstance)
            return response.status = 404

        switch (request.getMethod()) {
            case "GET":
                // Je réponds
                renderThis(userInstance, request.getHeader("Accept"))
                break
            case "PUT":
                if ((params.username != null) && (params.password != null)) {
                    userInstance.username = params.username
                    userInstance.password = params.password
                }
                if (userInstance.save(flush: true)) {
                    response.status = 200
                    renderThis(userInstance, request.getHeader("Accept"))
                } else
                    response.status = 400
                break
            case "PATCH":
                if ((request.JSON.username != null))
                    userInstance.username = request.JSON.username
                if ((request.JSON.password != null))
                    userInstance.password = request.JSON.password
                if (userInstance.save(flush: true)) {
                    response.status = 200
                    renderThis(userInstance, request.getHeader("Accept"))
                } else
                    response.status = 400
                break
            case "DELETE":
                UserRole.removeAll(userInstance)
                userInstance.delete(flush: true)
                response.status = 204
                renderThis(userInstance, request.getHeader("Accept"))
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

    /**
     * GET / POST
     * GET : Récupère la liste des utilisateurs
     * POST : Crée un nouvel utilisateur
     */
    def users() {

        switch (request.getMethod()) {
            case "GET":
                def userListInstance = User.getAll()
                if (userListInstance != null) {
                    renderThis(userListInstance, request.getHeader("Accept"))
                    response.status = 200
                } else {
                    response.status = 400
                }
                break
            case "POST":
                def userNewInstance = new User(params)
                userNewInstance.save(flush: true)
                println(userNewInstance.errors)
                def role = Role.get(params.role)
                UserRole.create(userNewInstance,role, true)
                return response.status = 201
                break
        }
    render "OK"
    }

    def annonce() {

        if (!params.id)
            return response.status = 400
        def annonceInstance = Annonce.get(params.id)
        if (!annonceInstance)
            return response.status = 404

        switch (request.getMethod()) {
            case "GET":
                renderThis(annonceInstance, request.getHeader("Accept"))
                break
            case "PUT":
                if (request.JSON.title != null && request.JSON.description != null && params.price != null && params.dateCreated != null && params.lastUpdated != null) {
                    annonceInstance.title = request.JSON.title
                    annonceInstance.description = request.JSON.description
                    annonceInstance.price = Float.parseFloat(params.price)
                    annonceInstance.dateCreated = Date.parse("DD-MM-YY", params.dateCreated.toString())
                    annonceInstance.lastUpdated = Date.parse("DD-MM-YY", params.lastUpdated.toString())
                }

                if (annonceInstance.save(flush: true)) {
                    response.status = 200
                    renderThis(annonceInstance, request.getHeader("Accept"))
                } else
                    response.status = 400

                break
            case "PATCH":

                if (request.JSON.title != null)
                    annonceInstance.title = request.JSON.title
                if (request.JSON.description != null)
                    annonceInstance.description = request.JSON.description
                if (params.price != null)
                    annonceInstance.price = Float.parseFloat(params.price)

                if (annonceInstance.save(flush: true)) {
                    response.status = 200
                    renderThis(annonceInstance, request.getHeader("Accept"))
                } else
                    response.status = 400
                break
            case "DELETE":
                annonceInstance.delete(flush: true)
                response.status = 204
                renderThis(annonceInstance, request.getHeader("Accept"))
                break
            default:
                return response.status = 405
                break
        }
        return response.status = 406
    }

    /**
     * GET / POST
     * GET : Récupère la liste des annonces
     * POST : Créer une nouvelle annonce
     */

    def annonces() {

        switch (request.getMethod()) {
            case "GET":
                def annonceListInstance = Annonce.getAll()
                if (annonceListInstance != null) {
                    renderThis(annonceListInstance, request.getHeader("Accept"))
                    response.status = 200
                } else {
                    response.status = 400
                }
                break

            case "POST":
                def annonceNewInstance = new Annonce(params)
                if (annonceNewInstance.save(flush: true)) {
                    renderThis(annonceNewInstance, request.getHeader("Accept"))
                    response.status = 201
                } else {
                    response.status = 400
                }
                break
        }
    }

    def renderThis(Object object, String accept) {
        switch (accept) {
            case "xml":
            case "text/xml":
            case "application/xml":
                render object as XML
                break
            case "json":
            case "text/json":
            case "application/json":
            default:
                render object as JSON
                break
        }
    }
}