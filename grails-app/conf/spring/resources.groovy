// Place your Spring DSL code here
beans = {
    	activemq(org.apache.activemq.camel.component.ActiveMQComponent) {
		brokerURL = 'vm://MyBroker'
	}

        reportingService(com.pac.grackle.ReportingService)

}