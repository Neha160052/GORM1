package com.ttnd.linksharing

import vo.TopicVO

class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static hasMany = [subscriptions: Subscription, resources: Resource]
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

    static List<TopicVO> getTrendingTopics() {
        List<TopicVO> topicVOList = []
        def criteria = Resource.createCriteria()
        List result = criteria.list(max: 5) {
            projections {
                createAlias('topic', 't')
                property('t.id', 'topicId')
                property('t.name', 'topicName')
                property('t.visibility', 'topicVisibility')
                rowCount('resource_count')
                property('t.createdBy')
            }

            groupProperty('t.id')
            eq('t.visibility', Visibility.PUBLIC)
            order('resource_count', 'desc')
            order('topicName', 'desc')
        }

        result.each {
            topicVOList.add(new TopicVO(id: it[0], name: it[1], visibility: it[2], count: it[3], createdBy: it[4]))
        }
        return topicVOList
    }

    boolean isPublic(long id) {
        Topic topic=Topic.read(id)
        if(topic.visibility==Visibility.PUBLIC){
            return true
        }else {
            return false
        }
    }

    boolean canViewedBy(long id,User user){
        Topic topic=Topic.read(id)
        if(isPublic(id)||topic.createdBy.id==user.id){
            return true
        }else {
            return false
        }
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
