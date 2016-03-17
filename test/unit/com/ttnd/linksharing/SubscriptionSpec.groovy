package com.ttnd.linksharing


import spock.lang.Specification




class SubscriptionSpec extends Specification {



    void "Test for uniqness of user"() {

        given: "Create a user"
        User user = new User(firstName: "Neha", lastName: "Singhal", password: "12345", email: "topic", username: "Neha singhal")

        and: "cerate a Topic"
        Topic topic = new Topic(name: "Grails", createdBy: user, visibility: Visibility.PRIVATE)

        and: "Create Subscription"
        Subscription subscription = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)

        when:
        subscription.save()

        then:
        subscription.count() == 1

        when:
        Topic newTopic = new Topic(name: "HTML", createdBy: user, visibility: Visibility.PRIVATE)
        Subscription newSubscription = new Subscription(topic: newTopic, user: user, seriousness: Seriousness.SERIOUS)
        newSubscription.save()

        then:
        newSubscription.count() == 1
      /*  newSubscription.errors.allErrors.size() == 1
        newSubscription.errors.getFieldErrorCount('name') == 1*/


    }
}
