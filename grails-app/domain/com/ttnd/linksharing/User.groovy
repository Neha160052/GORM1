package com.ttnd.linksharing

class User {

    String email
    String username
    String password
    String firstName
    String lastName
    byte photo
    boolean admin
    boolean active
    Date dateCreated
    Date lastUpdated
    static transients = ['name']

    static hasMany = [topics:Topic,subscriptions:Subscription,readingitems:ReadingItem,resources:Resource]

    static constraints = {
        email(unique: true, email: true,blank:false)
        password(blank:false, minSize: 5)
        firstName(blank: false)
        lastName(blank: false)
        username(blank: false)
        photo(nullable:true)
        admin(nullable: true)
        active(nullable:true)


    }

    String getName() {
        [this.firstName,this.lastName].join(' ');

    }

    String toString()
    {
        return username;
    }

    def beforeInsert() {
    }

}
