class CommandActionController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ commandActionInstanceList: CommandAction.list( params ) ]
    }

    def show = {
        def commandActionInstance = CommandAction.get( params.id )

        if(!commandActionInstance) {
            flash.message = "CommandAction not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ commandActionInstance : commandActionInstance ] }
    }

    def delete = {
        def commandActionInstance = CommandAction.get( params.id )
        if(commandActionInstance) {
            commandActionInstance.delete()
            flash.message = "CommandAction ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "CommandAction not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def commandActionInstance = CommandAction.get( params.id )

        if(!commandActionInstance) {
            flash.message = "CommandAction not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ commandActionInstance : commandActionInstance ]
        }
    }

    def update = {
        def commandActionInstance = CommandAction.get( params.id )
        if(commandActionInstance) {
            commandActionInstance.properties = params
            if(!commandActionInstance.hasErrors() && commandActionInstance.save()) {
                flash.message = "CommandAction ${params.id} updated"
                redirect(action:show,id:commandActionInstance.id)
            }
            else {
                render(view:'edit',model:[commandActionInstance:commandActionInstance])
            }
        }
        else {
            flash.message = "CommandAction not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def commandActionInstance = new CommandAction()
        commandActionInstance.properties = params
        return ['commandActionInstance':commandActionInstance]
    }

    def save = {
        def commandActionInstance = new CommandAction(params)
        if(!commandActionInstance.hasErrors() && commandActionInstance.save()) {
            flash.message = "CommandAction ${commandActionInstance.id} created"
            redirect(action:show,id:commandActionInstance.id)
        }
        else {
            render(view:'create',model:[commandActionInstance:commandActionInstance])
        }
    }
}
