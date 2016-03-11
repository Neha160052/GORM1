package com.ttnd.linksharing

import grails.util.Holders
import org.springframework.beans.factory.annotation.Autowired

class UtilController {
    def grailsApplication
    def utillService
    def myBeanConstructor
    def mailService

    @Autowired
    DemoBean myBean1

    def index() {
        render(grailsApplication.config.grails.testvariable)
        log.warn("Sample warn")
        log.error(" sample error")
        log.info("sample info")
        log.fatal("sample fatal")

    }

    def application(){
        User user=session.user
        List topics= []//user.subscribedTopic
        render view:'application'
    }

    def saveUser(){
       render utillService.saveUser()
    }

    def beanDemo(){
        render myBean1.properties


    }

    def demoProt(){
        def c= Holders.applicationContext.getBean('myBean')
        render "${c}::::${c.properties}"
    }

    def mailDemo(){
        mailService.sendMail {
            to "neha.singhal@tothenew.com"
            from "913nehasinghal@gmail.com"
            subject "Hello John"
            body 'this is some text'
        }
    }
}
