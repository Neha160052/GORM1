package com.ttnd.linksharing


import vo.PostVO

class User {

    String email
    String username
    String password
    String firstName
    String lastName
    byte photo
    boolean admin=false
    boolean active=true
    Date dateCreated
    Date lastUpdated
    String confirmPassword
    static transients = ['name', 'confirmPassword','subscribedTopic']

    static hasMany = [topics: Topic, subscriptions: Subscription, readingitems: ReadingItem, resources: Resource]

    static constraints = {
        email(unique: true, email: true, blank: false)
        password(blank: false, minSize: 5)
        firstName(blank: false)
        lastName(blank: false)
        username(blank: false)
        photo(nullable: true)
        admin(nullable: true)
        active(nullable: true)
        confirmPassword(bindable: true, nullable: true, blank: true, validator: { val, obj ->
            if (!obj.id && (obj.password != val || !val)) {
                return 'password.do.not.match.confirmPassword'
            }
        })

    }

    static mapping = {
        sort id: 'desc'
        photo(sqlType: 'longblob')
    }

    List<Topic> getSubscribedTopic(){
        List<Topic> subscribedTopics=Subscription.createCriteria().list(offset:0,max:5) {
            projections {
                property('topic')
            }
                eq('user.id',this.id)
        }
        subscribedTopics
    }

    List<Topic> getSubscribedTopics(){
        List<Topic> subscribedTopics=Subscription.createCriteria().list() {
            projections {
                property('topic')
            }
            eq('user.id',this.id)
        }
        subscribedTopics
    }

    List<PostVO> getInboxItems() {
        List<PostVO> readingItemsList = [];
        ReadingItem.findAllByUser(this, [max:5, offset: 0]).each {
            readingItemsList.add(new PostVO(topicId: it.resource.topic.id, resourceID: it.resource.id, description: it.resource.discription,
                    topicName: it.resource.topic.name, userId: it.user.id, userUserName: it.resource.createdBy.username,
                    userFirstName: it.resource.createdBy.firstName, userLastName: it.resource.createdBy.lastName,
                    isRead: it.isRead,
                    url: it.resource.class.toString().equals(LinkResource) ? it.resource.toString() : "",
                    filePath: it.resource.class.toString().equals(DocumentResource) ? it.resource.toString() : ""))

        }
        return readingItemsList

    }

    boolean isSubscribed(String topicName){
        Topic topic=Topic.findByName(topicName)
        Subscription subscription=Subscription.findByUserAndTopic(this,topic)
        if(subscription){
            return true
        }else {
            return false
        }
    }
    boolean canDeleteResource(long id){
        println id
        Resource resource=Resource.get(id)
        println resource.createdBy
        println this
        println resource.createdBy.id==this.id
        if(resource.createdBy.id==this.id||this.admin){
            return true
        }else{
            return false
        }

    }
    Subscription getSubscription(Long topicId) {
        return Subscription.createCriteria().get {
            eq('topic.id', topicId)
            eq('user.id', this.id)
        }
    }

    Boolean hasTopicRight(Long id) {
        Topic topic = Topic.get(id)
        if (this.admin || this.equals(topic.createdBy)) {
            return true
        } else {
            return false
        }
    }

    String getName() {
        [this.firstName, this.lastName].join(' ');

    }

    String toString() {
        return username;
    }

    def beforeInsert() {
    }

}