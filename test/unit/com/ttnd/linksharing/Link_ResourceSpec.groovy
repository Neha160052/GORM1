package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification


/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */

class Link_ResourceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Validate Lnik Resources"() {

        given: "user created Resource"
        User user = new User(firstName: "Neha", lastName: "Singhal", email: "a@b.com", password: "qwerty", username: "abc")
        Topic topic = new Topic(name:"grails", visibility:Visibility.PRIVATE, createdBy: user)
        Link_Resource linkResource = new Link_Resource(url: url,description:"this is helpfull" ,topic:topic ,createdBy:user )

        when: "check for validation"
        Boolean result = linkResource.validate()
       // println "${linkResource.errors.allErrors}"
        then: "test the result"
        result == valid

        where: "trying different values"

        sno | url                                                                 | valid
        1   | " "                                                                 | false
        2   | null                                                                | false
      //  3   | "http://grails.github.io/grails-doc/2.5.1/ref/Constraints/url.html" | true
    }
}
