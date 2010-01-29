package com.pac.grackle

import org.springframework.beans.factory.InitializingBean
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class MailService implements InitializingBean {

    boolean transactional = true


    def setting

    void afterPropertiesSet() {
        this.setting = ConfigurationHolder.config.setting
    }

   def sendMail(String addressee, String from, String title, String message)  {

    }
}
