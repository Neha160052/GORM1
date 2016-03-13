package com.ttnd.linksharing


import spock.lang.Specification



class TopicSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Topic Name should be unique per user"() {

        given:
        User user = new User(firstName: "Neha", lastName: "Singhal", password: "12345", email: "neha@gmail.com", username: "Neha singhal")

        and:
        Topic topic = new Topic(name: "HTML", createdBy: user, visibility: Visibility.PUBLIC)

        when:
        Boolean result = topic.validate()

        then:
        result == true


        when:
        User newUser = new User(firstName: "Swati", lastName: "Singhal", password: "123765", email: "swat@gmail.com", username: "swati singhal")

        Topic newTopic = new Topic(name: "HTML", createdBy: newUser, visibility: Visibility.PRIVATE)
        newTopic.save()

        then:
        newTopic.count() == 1
     /*   newTopic.errors.allErrors.size() == 1
        newTopic.errors.getFieldErrorCount('name') == 1*/


    }

    def "Visibility should not be null & must be enum"() {
        given:
        User user = new User(firstName: "Neha", lastName: "Singhal", password: "12345", email: "neha@gmail.com", username: "Neha singhal")

        and: "user created topic"
        Topic topic = new Topic(name: name, visibility:visibility,user:user)

        when: "check for valiation"
        Boolean result = topic.validate()

        then: "test the result"
        result == valid

        where: "trying different values"

        sno | name     | visibility             | valid
        1   | "grails" | " "                    | false
        2   | "java"   | null                   | false
     //   3   | "grails" | Visibility.PRIVATE     | true
     //   4   | "grails" | Visibility.PUBLIC      | true
        5   | "grails" | "xyz"                  | false

    }

}
