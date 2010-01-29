import org.apache.camel.*
import grails.test.GrailsUnitTestCase

class JMSClientTests extends GrailsUnitTestCase {

    def reportingService

    void testJMSClient() {
        def reportMessage = [name:"foo",data:"bar"]
        reportingService.sendReport("this is a message to the queue service...")
    }
}
