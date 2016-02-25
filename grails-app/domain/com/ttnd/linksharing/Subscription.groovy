package com.ttnd.linksharing

//enum Seriousness{SERIOUS, VERY_SERIOUS, CASUAL}
class Subscription {

    Topic topic
    User user
    Seriousness seriousness

    static belongsTo = [user:User,topic:Topic]


    static constraints = {
        user(unique: ['topic'])

    }
    static mapping = {
        seriousness defaultValue:"Seriousness.SERIOUS"
    }
}
