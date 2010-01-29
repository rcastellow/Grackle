class JmsController {

    def index = {redirect(action:send,params:params)}

    def reportingService

    def send = {
        def reportMessage = [name:"foo",data:"bar"]
        reportingService.sendReport("this is a message to the queue service...")
    }

}
