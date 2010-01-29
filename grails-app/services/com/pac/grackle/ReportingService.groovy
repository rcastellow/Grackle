package com.pac.grackle

import org.springframework.beans.factory.InitializingBean
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ReportingService implements InitializingBean {

    def setting

    void afterPropertiesSet() {
        this.setting = ConfigurationHolder.config.setting
    }

    def void sendReport(String reportMessage) {
        sendMessage("seda:my.queue",reportMessage)
    }
}
