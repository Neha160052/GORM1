package com.ttnd.linksharing

enum Visibility{PUBLIC, PRIVATE }
class Topic {



    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
   Visibility visibility

    static hasMany = [subscription:Subscription,resource:Resource]
  //  static belongsTo = [user:User]


    static constraints = {
       name(unique: ['createdBy'], blank: false)
        visibility(inList: Visibility.values().toList())

    }

    static mapping = {
        sort name: 'asc'
    }

    String toString(){
        return name
    }

    def afterInsert(){
        Topic.withNewSession {
            Subscription subscription=new Subscription(topic: this,user: this.createdBy,seriousness: Seriousness.VERY_SERIOUS)
            if(subscription.save())
            {
                log.info("${this} is saved")
            }
            else
            {
                log.error("${subscription.errors.allErrors()}")
            }
        }
    }
}
