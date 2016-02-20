package com.ttnd.linksharing

import grails.test.mixin.TestFor
import spock.lang.Specification


/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
class UserSpec extends Specification {


    void "canary test"() {
        expect:
        println "its working"
        true
    }

   void "test for valid User"() {
        given:
        User user = new User(email: email, username: username, password: password, firstName: firstname, lastName: lastname, admin: admin, active: active)

        when:
        Boolean result = user.validate()

        then:
        result == valid

        where:
        email            | username | password | firstname | lastname  | admin  | active | valid
        "asba"           | "qwer"   | "asdf"   | "neha"    | "singhal" |  0     | 0      | false
        null             | "qwer"   | "asdf"   | "neha"    | "singhal" |  0     | 0      | false
        "neha@ga.com"    | "qwer"   | null     | "neha"    | "singhal" |  0     | 0      | false
        "neha@ga.com"    | "qwer"   | "123425" | "neha"    | "singhal" |   0    | 0      | true

    }

    void "Test for Uniqueness of emailId"(){
        given:
        String email="neha@gmail.com"

        and:
        User user=new User(firstName: "Neha",lastName: "Singhal",password: "12345",email: email,username: "Neha singhal")

        when:
        user.save()

        then:
        user.count()==1

        when:
        User newUser=new User(firstName: "Swati",lastName: "Singhal",password: "12987",email: email,username: "Swati Singhal")
        newUser.save()

        then:
        newUser.count() == 1
        newUser.errors.allErrors.size() == 1
        newUser.errors.getFieldErrorCount('email') == 1

    }
}
