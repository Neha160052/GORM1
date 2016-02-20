package com.ttnd.linksharing

class UtilController {
    def grailsApplication

    def index() {
        render(grailsApplication.config.grails.testvariable)
        log.warn("Sample warn")
        log.error(" sample error")
        log.info("sample info")
        log.fatal("sample fatal")

    }
}
