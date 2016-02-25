package com.ttnd.linksharing

import VO.TopicVO

class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions: Subscription, resource: Resource]
    //  static belongsTo = [user:User]


    static constraints = {
        name(unique: ['createdBy'], blank: false)
        visibility(inList: Visibility.values().toList())

    }

    static mapping = {
        sort name: 'asc'
        subscriptions lazy: false
    }

    String toString() {
        return name
    }

    static TopicVO getTrendingTopics() {
        List results = Topic.createCriteria().list {
            projections {
                createAlias("Resource", "r")
                groupProperty("r.id")
                property("r.name")
                count("r.id", "totalResources")
            }
            order("totalResources", "desc")
            order("r.name", "desc")
            maxResults 10
        }
        new TopicVO(id: this.id, name: this.name, visibility: this.visibility, count: results[1], createdBy: this.createdBy)

    }

    def afterInsert() {
        Topic.withNewSession {
            Subscription subscription = new Subscription(topic: this, user: this.createdBy, seriousness: Seriousness.VERY_SERIOUS)
            if (subscription.save()) {
                log.info("${this} is saved")
            } else {
                log.error("${subscription.errors.allErrors()}")
            }
        }
    }


}
