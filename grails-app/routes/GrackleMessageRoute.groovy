import org.apache.camel.language.groovy.GroovyRouteBuilder

class GrackleMessageRoute {
    def configure = {
            from("seda:my.queue").
	    to("activemq:queue:q1")
	    from("activemq:queue:q1").
            to("stream:out")
    }
}
