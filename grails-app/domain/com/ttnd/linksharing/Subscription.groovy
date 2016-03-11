package com.ttnd.linksharing


class Subscription {
    User user
    Seriousness seriousness = Seriousness.SERIOUS
    Date dateCreated
    Date lastUpdated

    static belongsTo = [topic: Topic]

    static constraints = {
        user nullable: false, blank: false, unique: ['topic'];
        topic nullable: false, blank: false;
    }

    static mapping = {
        user(lazy: false)
        topic(lazy: false)
    }
// //static fetchMode=[subscribedBy:'eager',topic:'eager']
}