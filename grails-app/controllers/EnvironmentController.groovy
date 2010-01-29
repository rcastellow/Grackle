class EnvironmentController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ environmentInstanceList: Environment.list( params ) ]
    }

    def show = {
        def environmentInstance = Environment.get( params.id )

        if(!environmentInstance) {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ environmentInstance : environmentInstance ] }
    }

    def delete = {
        def environmentInstance = Environment.get( params.id )
        if(environmentInstance) {
            environmentInstance.delete()
            flash.message = "Environment ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def environmentInstance = Environment.get( params.id )

        if(!environmentInstance) {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ environmentInstance : environmentInstance ]
        }
    }

    def update = {
        def environmentInstance = Environment.get( params.id )
        if(environmentInstance) {
            environmentInstance.properties = params
            if(!environmentInstance.hasErrors() && environmentInstance.save()) {
                flash.message = "Environment ${params.id} updated"
                redirect(action:show,id:environmentInstance.id)
            }
            else {
                render(view:'edit',model:[environmentInstance:environmentInstance])
            }
        }
        else {
            flash.message = "Environment not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def environmentInstance = new Environment()
        environmentInstance.properties = params
        return ['environmentInstance':environmentInstance]
    }

    def save = {
        def environmentInstance = new Environment(params)
        if(!environmentInstance.hasErrors() && environmentInstance.save()) {
            flash.message = "Environment ${environmentInstance.id} created"
            redirect(action:show,id:environmentInstance.id)
        }
        else {
            render(view:'create',model:[environmentInstance:environmentInstance])
        }
    }
}
